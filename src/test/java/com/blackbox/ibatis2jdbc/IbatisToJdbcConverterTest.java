package com.blackbox.ibatis2jdbc;

import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.net.URISyntaxException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static com.blackbox.ibatis2jdbc.TestSupport.listOf;
import static com.blackbox.ibatis2jdbc.TestSupport.mapOf;

class IbatisToJdbcConverterTest {
	private final IbatisToJdbcConverter converter = new IbatisToJdbcConverter();

	// ── convert(): 全内联字面量，输出最终可读 SQL ──────────────────────────────

	@Test
	void convertInlinesAllParameterTypes() throws Exception {
		String xml = readResource("/sqlmaps/multi-scenario-sqlmap.xml");

		// Map 参数：内联为字面量
		ConvertedSql mapResult = converter.convert(xml, "findUsersByIdMap", mapOf("id", 1001));
		assertEquals("SELECT id, name, status, created_at FROM users where id = 1001", mapResult.sql());
		assertEquals(mapOf("id", 1001), mapResult.parameters());
		assertEquals("select", mapResult.statementType());
		assertEquals("user", mapResult.resultClass());

		// String 参数：内联为字符串字面量
		ConvertedSql strResult = converter.convert(xml, "findUsersById", "U1001");
		assertEquals("SELECT id, name, status, created_at FROM users where id = 'U1001'", strResult.sql());
		assertEquals("U1001", strResult.parameters());

		// Number 参数：内联为数字字面量
		ConvertedSql numResult = converter.convert(xml, "findUsersByIdNumber", 123);
		assertEquals("SELECT id, name, status, created_at FROM users where id = 123", numResult.sql());
		assertEquals(123, numResult.parameters());
		assertEquals("select", numResult.statementType());

		// List 参数：iterate 内联每个元素
		List<Object> listParams = listOf("A001", "B002");
		ConvertedSql listResult = converter.convert(xml, "findUsersByIdsList", listParams);
		assertEquals("SELECT id, name, status, created_at FROM users where id IN ('A001','B002')", listResult.sql());
		assertEquals(listParams, listResult.parameters());
	}

	@Test
	void convertHandlesEdgeCases() throws Exception {
		String xml = readResource("/sqlmaps/multi-scenario-sqlmap.xml");

		// null 参数：内联为 null
		ConvertedSql nullResult = converter.convert(xml, "findUsersById", null);
		assertEquals("SELECT id, name, status, created_at FROM users where id = null", nullResult.sql());
		assertEquals(null, nullResult.parameters());

		// 空字符串：内联为 ''
		ConvertedSql emptyStrResult = converter.convert(xml, "findUsersById", "");
		assertEquals("SELECT id, name, status, created_at FROM users where id = ''", emptyStrResult.sql());
		assertEquals("", emptyStrResult.parameters());

		// 空 List：iterate 输出空括号
		List<Object> emptyList = listOf();
		ConvertedSql emptyListResult = converter.convert(xml, "findUsersByIdsList", emptyList);
		assertEquals("SELECT id, name, status, created_at FROM users where id IN (null)", emptyListResult.sql());
		assertEquals(emptyList, emptyListResult.parameters());
	}

	@Test
	void convertWithDynamicTagsAndIterate() throws Exception {
		String xml = readResource("/sqlmaps/user-sqlmap.xml");
		ConvertedSql result = converter.convert(
				xml,
				"findUsers",
				mapOf("name", "Alice", "status", "ACTIVE", "ids", listOf(10, 11, 12)));

		assertEquals(
				"SELECT id, name FROM users WHERE name = 'Alice' AND status = 'ACTIVE' AND id IN (10,11,12)",
				result.sql());
		assertEquals(
				mapOf("name", "Alice", "status", "ACTIVE", "ids", listOf(10, 11, 12)),
				result.parameters());
	}

	@Test
	void convertSkipsEmptyConditions() throws Exception {
		String xml = readResource("/sqlmaps/user-sqlmap.xml");
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("name", "");
		parameters.put("status", null);
		parameters.put("ids", listOf());

		ConvertedSql result = converter.convert(xml, "findUsers", parameters);
		assertEquals("SELECT id, name FROM users", result.sql());
		assertEquals(parameters, result.parameters());
	}

	@Test
	void convertMultipleStatementShapes() throws Exception {
		String xml = readResource("/sqlmaps/multi-scenario-sqlmap.xml");

		ConvertedSql filteredUsers = converter.convert(
				xml,
				"findUsersByFilters",
				mapOf("name", "Alice", "status", "ACTIVE", "ids", listOf(7, 8)));
		assertEquals(
				"SELECT id, name, status, created_at FROM users WHERE name = 'Alice' AND status = 'ACTIVE' AND id IN (7,8)",
				filteredUsers.sql());

		Map<String, Object> keywordParameters = new HashMap<>();
		keywordParameters.put("keyword", "tom");
		keywordParameters.put("deleted", null);
		ConvertedSql keywordUsers = converter.convert(xml, "findUsersByKeyword", keywordParameters);
		assertEquals(
				"SELECT id, name, status FROM users WHERE (name LIKE '%' || 'tom' || '%' OR email LIKE '%' || 'tom' || '%') AND deleted = 0",
				keywordUsers.sql());

		ConvertedSql updateUser = converter.convert(
				xml,
				"updateUser",
				mapOf("id", 1001, "name", "Bob", "status", "DISABLED", "email", "bob@example.com"));
		assertEquals(
				"UPDATE users SET name = 'Bob', status = 'DISABLED', email = 'bob@example.com' WHERE id = 1001",
				updateUser.sql());
		assertEquals("update", updateUser.statementType());

		ConvertedSql deleteUsers = converter.convert(
				xml,
				"deleteUsersByIds",
				mapOf("ids", listOf(21, 22, 23)));
		assertEquals("DELETE FROM users WHERE id IN (21,22,23)", deleteUsers.sql());

		ConvertedSql deleteUsersByCodes = converter.convert(
				xml,
				"deleteUsersByCodes",
				mapOf("codes", listOf("A001", "B002", "C003")));
		assertEquals("DELETE FROM users WHERE code IN ('A001','B002','C003')", deleteUsersByCodes.sql());
	}

	// ── convertForExecution(): 全 ? 占位符 + 有序参数列表，用于 PreparedStatement ─

	@Test
	void convertForExecutionProducesPositionalPlaceholders() throws Exception {
		String xml = readResource("/sqlmaps/multi-scenario-sqlmap.xml");

		// Map 参数：? 占位符 + 有序参数列表
		ConvertedSql mapResult = converter.convertForExecution(xml, "findUsersByIdMap", mapOf("id", 1001));
		assertEquals("SELECT id, name, status, created_at FROM users where id = ?", mapResult.sql());
		assertEquals(listOf(1001), mapResult.parameters());
		assertEquals("select", mapResult.statementType());

		// String 参数：? 占位符
		ConvertedSql strResult = converter.convertForExecution(xml, "findUsersById", "U1001");
		assertEquals("SELECT id, name, status, created_at FROM users where id = ?", strResult.sql());
		assertEquals(listOf("U1001"), strResult.parameters());

		// Number 参数：? 占位符
		ConvertedSql numResult = converter.convertForExecution(xml, "findUsersByIdNumber", 123);
		assertEquals("SELECT id, name, status, created_at FROM users where id = ?", numResult.sql());
		assertEquals(listOf(123), numResult.parameters());

		// List 参数：每个元素一个 ?
		ConvertedSql listResult = converter.convertForExecution(xml, "findUsersByIdsList", listOf("A001", "B002"));
		assertEquals("SELECT id, name, status, created_at FROM users where id IN (?,?)", listResult.sql());
		assertEquals(listOf("A001", "B002"), listResult.parameters());

		ConvertedSql emptyListResult = converter.convertForExecution(xml, "findUsersByIdsList", listOf());
		assertEquals("SELECT id, name, status, created_at FROM users where id IN (null)", emptyListResult.sql());
		assertEquals(listOf(), emptyListResult.parameters());
	}

	@Test
	void convertForExecutionWithDynamicTagsAndIterate() throws Exception {
		String xml = readResource("/sqlmaps/user-sqlmap.xml");
		ConvertedSql result = converter.convertForExecution(
				xml,
				"findUsers",
				mapOf("status", "ACTIVE", "name", "Alice", "ids", listOf(10, 11, 12)));

		assertEquals("SELECT id, name FROM users WHERE name = ? AND status = ? AND id IN (?,?,?)", result.sql());
		assertEquals(listOf("Alice", "ACTIVE", 10, 11, 12), result.parameters());
	}

	@Test
	void convertForExecutionSkipsEmptyConditions() throws Exception {
		String xml = readResource("/sqlmaps/user-sqlmap.xml");
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("name", "");
		parameters.put("status", null);
		parameters.put("ids", listOf());

		ConvertedSql result = converter.convertForExecution(xml, "findUsers", parameters);
		assertEquals("SELECT id, name FROM users", result.sql());
		assertTrue(result.parameters() instanceof List);
		assertEquals(listOf(), result.parameters());
	}

	@Test
	void convertGeneratesFinalSqlDirectly() throws Exception {
		String xml = readResource("/sqlmaps/user-sqlmap.xml");

		ConvertedSql result = converter.convert(
				xml,
				"findUsers",
				mapOf("name", "Alice", "status", "ACTIVE", "ids", listOf(10, 11)));

		assertEquals("SELECT id, name FROM users WHERE name = 'Alice' AND status = 'ACTIVE' AND id IN (10,11)",
				result.sql());
		assertEquals(mapOf("name", "Alice", "status", "ACTIVE", "ids", listOf(10, 11)), result.parameters());
	}

	@Test
	void convertForExecutionGeneratesPreparedSql() throws Exception {
		String xml = readResource("/sqlmaps/user-sqlmap.xml");

		ConvertedSql result = converter.convertForExecution(
				xml,
				"findUsers",
				mapOf("name", "Alice", "status", "ACTIVE", "ids", listOf(10, 11)));

		assertEquals("SELECT id, name FROM users WHERE name = ? AND status = ? AND id IN (?,?)", result.sql());
		assertEquals(listOf("Alice", "ACTIVE", 10, 11), result.parameters());
	}

	@Test
	void supportsCdataWrappedOperators() throws Exception {
		String xml = readResource("/sqlmaps/multi-scenario-sqlmap.xml");

		ConvertedSql inlineSql = converter.convert(xml, "findUsersAfter", mapOf("startTime", "2026-05-14 00:00:00"));
		assertEquals("SELECT id, name FROM users WHERE created_at >= '2026-05-14 00:00:00'", inlineSql.sql());

		ConvertedSql executionSql = converter.convertForExecution(
				xml,
				"findUsersAfter",
				mapOf("startTime", "2026-05-14 00:00:00"));
		assertEquals("SELECT id, name FROM users WHERE created_at >= ?", executionSql.sql());
		assertEquals(listOf("2026-05-14 00:00:00"), executionSql.parameters());
	}

	@Test
	void ignoresXmlCommentsInBothModes() throws Exception {
		String xml = readResource("/sqlmaps/multi-scenario-sqlmap.xml");

		ConvertedSql inlineSql = converter.convert(
				xml,
				"findWithComments",
				mapOf("name", "Alice", "status", "ACTIVE"));
		assertEquals("SELECT id, name FROM users WHERE name = 'Alice' AND status = 'ACTIVE'", inlineSql.sql());

		ConvertedSql executionSql = converter.convertForExecution(
				xml,
				"findWithComments",
				mapOf("name", "Alice", "status", "ACTIVE"));
		assertEquals("SELECT id, name FROM users WHERE name = ? AND status = ?", executionSql.sql());
		assertEquals(listOf("Alice", "ACTIVE"), executionSql.parameters());
	}

	@Test
	void supportsRawDollarAndSafeHashPlaceholders() throws Exception {
		String xml = readResource("/sqlmaps/multi-scenario-sqlmap.xml");

		ConvertedSql inlineSql = converter.convert(
				xml,
				"findUsersRawAndSafe",
				mapOf("status", "ACTIVE", "orderBy", "created_at desc"));
		assertEquals(
				"SELECT id, name, status FROM users WHERE status = 'ACTIVE' ORDER BY created_at desc",
				inlineSql.sql());

		ConvertedSql executionSql = converter.convertForExecution(
				xml,
				"findUsersRawAndSafe",
				mapOf("status", "ACTIVE", "orderBy", "created_at desc"));
		assertEquals(
				"SELECT id, name, status FROM users WHERE status = ? ORDER BY created_at desc",
				executionSql.sql());
		assertEquals(listOf("ACTIVE"), executionSql.parameters());
	}

	private String readResource(String resourcePath) throws IOException, URISyntaxException {
		return TestSupport.readResource(IbatisToJdbcConverterTest.class, resourcePath);
	}
}
