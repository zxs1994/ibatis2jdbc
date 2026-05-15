package com.blackbox.ibatis2jdbc;

import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.net.URISyntaxException;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static com.blackbox.ibatis2jdbc.TestSupport.listOf;
import static com.blackbox.ibatis2jdbc.TestSupport.mapOf;

class JdbcExecutorTest {
  private static final String SQLMAP_RESOURCE = "/sqlmaps/test-sqlmap.xml";
  private final JdbcExecutor executor = new JdbcExecutor();
  private final IbatisToJdbcConverter converter = new IbatisToJdbcConverter();

  @Test
  void convertsNamedSqlToPreparedSql() throws Exception {
    String xml = readResource(SQLMAP_RESOURCE);
    ConvertedSql executionSql = converter.convertForExecution(
        xml,
        "findUsers",
        mapOf("name", "Alice", "status", "ACTIVE", "ids", listOf()));

    String namedSql = executionSql.sql().replaceFirst("\\?", ":name").replaceFirst("\\?", ":status");
    ConvertedSql convertedSql = new ConvertedSql(namedSql, mapOf("name", "Alice", "status", "ACTIVE"), "select",
        "user");

    JdbcExecutor.PreparedSql preparedSql = executor.toPreparedSql(convertedSql);

    assertEquals(executionSql.sql(), preparedSql.sql());
    assertEquals(listOf("Alice", "ACTIVE"), preparedSql.params());
  }

  @Test
  void keepsPositionalSqlWithListParameters() throws Exception {
    String xml = readResource(SQLMAP_RESOURCE);
    ConvertedSql convertedSql = converter.convertForExecution(xml, "findUsersByIdsList", listOf(1, 2, 3));

    JdbcExecutor.PreparedSql preparedSql = executor.toPreparedSql(convertedSql);

    assertEquals(convertedSql.sql(), preparedSql.sql());
    assertEquals(listOf(1, 2, 3), preparedSql.params());
  }

  @Test
  void keepsPositionalSqlWithSingleParameter() throws Exception {
    String xml = readResource(SQLMAP_RESOURCE);
    ConvertedSql executionSql = converter.convertForExecution(xml, "findUsersByIdNumber", 1001);
    ConvertedSql convertedSql = new ConvertedSql(
        executionSql.sql(),
        1001,
        executionSql.statementType(),
        executionSql.resultClass());

    JdbcExecutor.PreparedSql preparedSql = executor.toPreparedSql(convertedSql);

    assertEquals(executionSql.sql(), preparedSql.sql());
    assertEquals(listOf(1001), preparedSql.params());
  }

  @Test
  void failsWhenNamedParameterMissing() throws Exception {
    String xml = readResource(SQLMAP_RESOURCE);
    ConvertedSql executionSql = converter.convertForExecution(
        xml,
        "findUsers",
        mapOf("name", "Alice", "status", "ACTIVE", "ids", listOf()));

    String namedSql = executionSql.sql().replaceFirst("\\?", ":name").replaceFirst("\\?", ":status");
    ConvertedSql convertedSql = new ConvertedSql(
        namedSql,
        mapOf("name", "Alice"),
        "select",
        "java.lang.Integer");

    IllegalArgumentException exception = assertThrows(IllegalArgumentException.class,
        () -> executor.toPreparedSql(convertedSql));

    assertEquals("Missing named parameter: status", exception.getMessage());
  }

  @Test
  void failsWhenPlaceholderCountAndListSizeMismatch() throws Exception {
    String xml = readResource(SQLMAP_RESOURCE);
    ConvertedSql executionSql = converter.convertForExecution(xml, "findUsersByIdsList", listOf(1, 2));
    ConvertedSql convertedSql = new ConvertedSql(
        executionSql.sql(),
        listOf(1),
        executionSql.statementType(),
        executionSql.resultClass());

    IllegalArgumentException exception = assertThrows(IllegalArgumentException.class,
        () -> executor.toPreparedSql(convertedSql));

    assertEquals("Placeholder count 2 does not match list size 1", exception.getMessage());
  }

  @Test
  void supportsDuplicateNamedParameters() {
    ConvertedSql convertedSql = new ConvertedSql(
        "SELECT id FROM users WHERE name = :name OR nickname = :name",
        mapOf("name", "Alice"),
        "select",
        "java.lang.Integer");

    JdbcExecutor.PreparedSql preparedSql = executor.toPreparedSql(convertedSql);

    assertEquals("SELECT id FROM users WHERE name = ? OR nickname = ?", preparedSql.sql());
    assertEquals(listOf("Alice", "Alice"), preparedSql.params());
  }

  @Test
  void ignoresQuestionMarkInsideSqlStringLiteral() {
    ConvertedSql convertedSql = new ConvertedSql(
        "SELECT '?' AS marker, id FROM users WHERE id = ?",
        1001,
        "select",
        "java.lang.Integer");

    JdbcExecutor.PreparedSql preparedSql = executor.toPreparedSql(convertedSql);

    assertEquals("SELECT '?' AS marker, id FROM users WHERE id = ?", preparedSql.sql());
    assertEquals(listOf(1001), preparedSql.params());
  }

  private String readResource(String resourcePath) throws IOException, URISyntaxException {
    return TestSupport.readResource(JdbcExecutorTest.class, resourcePath);
  }
}
