package com.blackbox.ibatis2jdbc;

import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static com.blackbox.ibatis2jdbc.TestSupport.listOf;
import static com.blackbox.ibatis2jdbc.TestSupport.mapOf;

class IbatisToJdbcConverterTest {
	private static final String SQLMAP_RESOURCE = "/sqlmaps/test-sqlmap.xml";
	private final IbatisToJdbcConverter converter = new IbatisToJdbcConverter();

	// ── convert(): 全内联字面量，输出最终可读 SQL ──────────────────────────────

	@Test
	void convertInlinesAllParameterTypes() throws Exception {
		String xml = readResource(SQLMAP_RESOURCE);

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

		ConvertedSql beanResult = converter.convert(xml, "findUsersByIdMap", new UserFilter(1001, "ACTIVE"));
		assertEquals("SELECT id, name, status, created_at FROM users where id = 1001", beanResult.sql());

		ConvertedSql nestedBeanResult = converter.convert(
				xml,
				"findUsersByNestedBean",
				new SearchCriteria(new UserFilter(1001, "ACTIVE")));
		assertEquals("SELECT id, name, status FROM users where id = 1001 AND status = 'ACTIVE'",
				nestedBeanResult.sql());

		// List 参数：iterate 内联每个元素
		List<Object> listParams = listOf("A001", "B002");
		ConvertedSql listResult = converter.convert(xml, "findUsersByIdsList", listParams);
		assertEquals("SELECT id, name, status, created_at FROM users where id IN ('A001','B002')", listResult.sql());
		assertEquals(listParams, listResult.parameters());

		ConvertedSql collectionAliasResult = converter.convert(xml, "findUsersByCollectionAlias", listParams);
		assertEquals("SELECT id, name, status, created_at FROM users where id IN ('A001','B002')",
				collectionAliasResult.sql());

		ConvertedSql arrayAliasResult = converter.convert(xml, "findUsersByArrayAlias", new Long[] { 1001L, 1002L });
		assertEquals("SELECT id, name, status, created_at FROM users where id IN (1001,1002)", arrayAliasResult.sql());

		ConvertedSql parameterAliasResult = converter.convert(
				xml,
				"findUsersByParameterAlias",
				new SearchCriteria(new UserFilter(1001, "ACTIVE")));
		assertEquals("SELECT id, name, status FROM users where id = 1001 AND status = 'ACTIVE'",
				parameterAliasResult.sql());
	}

	@Test
	void convertHandlesEdgeCases() throws Exception {
		String xml = readResource(SQLMAP_RESOURCE);

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
		String xml = readResource(SQLMAP_RESOURCE);
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
		String xml = readResource(SQLMAP_RESOURCE);
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
		String xml = readResource(SQLMAP_RESOURCE);

		ConvertedSql includeUsers = converter.convert(xml, "findUsersByInclude", mapOf("status", "ACTIVE"));
		assertEquals("SELECT id, name, status FROM users WHERE status = 'ACTIVE'", includeUsers.sql());

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

	@Test
	void convertForExecutionSkipsEmptyConditions() throws Exception {
		String xml = readResource(SQLMAP_RESOURCE);
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
	void supportsSqlIncludeFragmentsInExecutionMode() throws Exception {
		String xml = readResource(SQLMAP_RESOURCE);

		ConvertedSql result = converter.convertForExecution(xml, "findUsersByInclude", mapOf("status", "ACTIVE"));
		assertEquals("SELECT id, name, status FROM users WHERE status = ?", result.sql());
		assertEquals(listOf("ACTIVE"), result.parameters());
	}

	@Test
	void supportsBeanParametersInExecutionMode() throws Exception {
		String xml = readResource(SQLMAP_RESOURCE);

		ConvertedSql beanResult = converter.convertForExecution(xml, "findUsersByIdMap", new UserFilter(1001, "ACTIVE"));
		assertEquals("SELECT id, name, status, created_at FROM users where id = ?", beanResult.sql());
		assertEquals(listOf(1001L), beanResult.parameters());

		ConvertedSql nestedBeanResult = converter.convertForExecution(
				xml,
				"findUsersByNestedBean",
				new SearchCriteria(new UserFilter(1001, "ACTIVE")));
		assertEquals("SELECT id, name, status FROM users where id = ? AND status = ?", nestedBeanResult.sql());
		assertEquals(listOf(1001L, "ACTIVE"), nestedBeanResult.parameters());

		ConvertedSql collectionAliasResult = converter.convertForExecution(xml, "findUsersByCollectionAlias", listOf(1, 2));
		assertEquals("SELECT id, name, status, created_at FROM users where id IN (?,?)", collectionAliasResult.sql());
		assertEquals(listOf(1, 2), collectionAliasResult.parameters());

		ConvertedSql arrayAliasResult = converter.convertForExecution(xml, "findUsersByArrayAlias", new Long[] { 1001L, 1002L });
		assertEquals("SELECT id, name, status, created_at FROM users where id IN (?,?)", arrayAliasResult.sql());
		assertEquals(listOf(1001L, 1002L), arrayAliasResult.parameters());
	}

	@Test
	void supportsExtendedParameterAliasesAndEnumComparison() throws Exception {
		String xml = readResource(SQLMAP_RESOURCE);

		ConvertedSql aliasResult = converter.convert(
				xml,
				"findUsersByParameterAlias",
				new SearchCriteria(new UserFilter(1001, "ACTIVE")));
		assertEquals("SELECT id, name, status FROM users where id = 1001 AND status = 'ACTIVE'", aliasResult.sql());

		ConvertedSql enumCompareResult = converter.convert(xml, "findByEnumCompare", new PriorityHolder(Priority.HIGH));
		assertEquals("SELECT * FROM users WHERE priority_flag = 1", enumCompareResult.sql());
	}

	@Test
	void supportsUnaryConditionalTags() throws Exception {
		String xml = readResource(SQLMAP_RESOURCE);

		ConvertedSql result = converter.convert(xml, "findByUnaryTags", mapOf("status", "ACTIVE", "name", "Alice"));
		assertEquals(
				"SELECT * FROM users WHERE deleted IS NULL AND status = 'ACTIVE' AND name = 'Alice' AND missing_flag = 1",
				result.sql());
	}

	@Test
	void supportsBinaryConditionalTagsAndCompareProperty() throws Exception {
		String xml = readResource(SQLMAP_RESOURCE);

		ConvertedSql result = converter.convert(
				xml,
				"findByBinaryTags",
				mapOf("type", 1, "status", "ACTIVE", "age", 20, "score", 90, "rank", 2, "maxRank", 5, "level", 3));
		assertEquals(
				"SELECT * FROM users WHERE type = 1 AND status <> 'DISABLED' AND age > 18 AND score >= 90 AND rank < maxRank AND level <= 3",
				result.sql());
	}

	@Test
	void supportsParameterPresentTags() throws Exception {
		String xml = readResource(SQLMAP_RESOURCE);

		ConvertedSql presentResult = converter.convert(xml, "findByParameterPresence", mapOf("id", 1));
		assertEquals("SELECT * FROM users WHERE present_flag = 1", presentResult.sql());

		ConvertedSql absentResult = converter.convert(xml, "findByParameterPresence", null);
		assertEquals("SELECT * FROM users WHERE present_flag = 0", absentResult.sql());
	}

	private String readResource(String resourcePath) {
		try {
			return TestSupport.readResource(IbatisToJdbcConverterTest.class, resourcePath);
		} catch (IOException e) {
			throw new RuntimeException(e);
		}

	}

	private static final class UserFilter {
		private final long id;
		private final String status;

		private UserFilter(long id, String status) {
			this.id = id;
			this.status = status;
		}

		public long getId() {
			return id;
		}

		public String getStatus() {
			return status;
		}
	}

	private static final class SearchCriteria {
		private final UserFilter criteria;

		private SearchCriteria(UserFilter criteria) {
			this.criteria = criteria;
		}

		public UserFilter getCriteria() {
			return criteria;
		}
	}

	private enum Priority {
		LOW,
		MEDIUM,
		HIGH
	}

	private static final class PriorityHolder {
		private final Priority priority;

		private PriorityHolder(Priority priority) {
			this.priority = priority;
		}

		public Priority getPriority() {
			return priority;
		}
	}
}
