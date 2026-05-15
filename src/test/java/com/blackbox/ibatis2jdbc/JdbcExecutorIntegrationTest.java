package com.blackbox.ibatis2jdbc;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.net.URISyntaxException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.List;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertInstanceOf;
import static com.blackbox.ibatis2jdbc.TestSupport.mapOf;

class JdbcExecutorIntegrationTest {
  private Connection connection;
  private final IbatisToJdbcConverter converter = new IbatisToJdbcConverter();
  private final JdbcExecutor executor = new JdbcExecutor();

  @BeforeEach
  void setUp() throws Exception {
    connection = DriverManager.getConnection("jdbc:h2:mem:ibatis2jdbc;MODE=MySQL;DB_CLOSE_DELAY=-1");
    try (Statement statement = connection.createStatement()) {
      statement.execute("DROP TABLE IF EXISTS users");
      statement.execute(
          "CREATE TABLE users ("
              + "id BIGINT PRIMARY KEY,"
              + "name VARCHAR(100),"
              + "status VARCHAR(40),"
              + "created_at TIMESTAMP,"
              + "email VARCHAR(200),"
              + "deleted INT,"
              + "code VARCHAR(20)"
              + ")");
      statement.execute(
          "INSERT INTO users(id, name, status, created_at, email, deleted, code) VALUES "
              + "(1001, 'Alice', 'ACTIVE', CURRENT_TIMESTAMP, 'alice@example.com', 0, 'A001'),"
              + "(1002, 'Bob', 'DISABLED', CURRENT_TIMESTAMP, 'bob@example.com', 0, 'B002'),"
              + "(1003, 'Tom', 'ACTIVE', CURRENT_TIMESTAMP, 'tom@example.com', 0, 'C003')");
    }
  }

  @AfterEach
  void tearDown() throws Exception {
    if (connection != null) {
      connection.close();
    }
  }

  @Test
  void executesSelectWithNamedParameters() throws Exception {
    String xml = readResource("/sqlmaps/multi-scenario-sqlmap.xml");
    ConvertedSql convertedSql = converter.convertForExecution(xml, "findUsersByIdMap", mapOf("id", 1001));

    @SuppressWarnings("unchecked")
    List<Map<String, Object>> rows = (List<Map<String, Object>>) executor.execute(connection, convertedSql);

    assertEquals(1, rows.size());
    assertEquals("Alice", rows.get(0).get("NAME"));
    assertEquals("ACTIVE", rows.get(0).get("STATUS"));
  }

  @Test
  void executesSelectWithPositionalParameters() throws Exception {
    String xml = readResource("/sqlmaps/multi-scenario-sqlmap.xml");
    ConvertedSql convertedSql = converter.convertForExecution(xml, "findUsersByIdNumber", 1002);

    List<Map<String, Object>> rows = executor.queryForList(connection, convertedSql);

    assertEquals(1, rows.size());
    assertEquals("Bob", rows.get(0).get("NAME"));
  }

  @Test
  void executesUpdateByStatementType() throws Exception {
    String xml = readResource("/sqlmaps/multi-scenario-sqlmap.xml");
    ConvertedSql updateSql = converter.convertForExecution(
        xml,
        "updateUser",
        mapOf("id", 1003, "name", "Tommy", "status", "ACTIVE", "email", "tommy@example.com"));

    Object updated = executor.execute(connection, updateSql);
    assertInstanceOf(Integer.class, updated);
    assertEquals(1, updated);

    ConvertedSql verifySql = converter.convertForExecution(xml, "findUserContactById", mapOf("id", 1003));
    List<Map<String, Object>> rows = executor.queryForList(connection, verifySql);
    assertEquals("Tommy", rows.get(0).get("NAME"));
    assertEquals("tommy@example.com", rows.get(0).get("EMAIL"));
  }

  private String readResource(String resourcePath) throws IOException, URISyntaxException {
    return TestSupport.readResource(JdbcExecutorIntegrationTest.class, resourcePath);
  }
}
