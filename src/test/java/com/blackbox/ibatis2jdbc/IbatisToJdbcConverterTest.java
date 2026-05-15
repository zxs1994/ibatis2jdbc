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
import static org.junit.jupiter.api.Assertions.assertNotNull;

class IbatisToJdbcConverterTest {
	private static final String SQLMAP_RESOURCE = "/sqlmaps/test-sqlmap.xml";
	private final IbatisToJdbcConverter converter = new IbatisToJdbcConverter();

	// ── convert(): 全内联字面量，输出最终可读 SQL ──────────────────────────────

	@Test
	void convertInlinesAllParameterTypes() throws Exception {
		String xml = readResource(SQLMAP_RESOURCE);

		// Map 参数：内联为字面量
		ConvertedSql mapResult = converter.convert(xml, "findUsersByIdMap", mapOf("id", 1001));
		assertEquals("SELECT id, name, status, created_at FROM users where id = 1001", mapResult.getSql());
		assertEquals(mapOf("id", 1001), mapResult.getParameters());
		assertEquals("select", mapResult.getStatementType());
		assertEquals("user", mapResult.getResultClass());

		// String 参数：内联为字符串字面量
		ConvertedSql strResult = converter.convert(xml, "findUsersById", "U1001");
		assertEquals("SELECT id, name, status, created_at FROM users where id = 'U1001'", strResult.getSql());
		assertEquals("U1001", strResult.getParameters());

		// Number 参数：内联为数字字面量
		ConvertedSql numResult = converter.convert(xml, "findUsersByIdNumber", 123);
		assertEquals("SELECT id, name, status, created_at FROM users where id = 123", numResult.getSql());
		assertEquals(123, numResult.getParameters());
		assertEquals("select", numResult.getStatementType());

		ConvertedSql beanResult = converter.convert(xml, "findUsersByIdMap", new UserFilter(1001, "ACTIVE"));
		assertEquals("SELECT id, name, status, created_at FROM users where id = 1001", beanResult.getSql());

		ConvertedSql nestedBeanResult = converter.convert(
				xml,
				"findUsersByNestedBean",
				new SearchCriteria(new UserFilter(1001, "ACTIVE")));
		assertEquals("SELECT id, name, status FROM users where id = 1001 AND status = 'ACTIVE'",
				nestedBeanResult.getSql());

		// List 参数：iterate 内联每个元素
		List<Object> listParams = listOf("A001", "B002");
		ConvertedSql listResult = converter.convert(xml, "findUsersByIdsList", listParams);
		assertEquals("SELECT id, name, status, created_at FROM users where id IN ('A001','B002')", listResult.getSql());
		assertEquals(listParams, listResult.getParameters());

		ConvertedSql collectionAliasResult = converter.convert(xml, "findUsersByCollectionAlias", listParams);
		assertEquals("SELECT id, name, status, created_at FROM users where id IN ('A001','B002')",
				collectionAliasResult.getSql());

		ConvertedSql arrayAliasResult = converter.convert(xml, "findUsersByArrayAlias", new Long[] { 1001L, 1002L });
		assertEquals("SELECT id, name, status, created_at FROM users where id IN (1001,1002)", arrayAliasResult.getSql());

		ConvertedSql parameterAliasResult = converter.convert(
				xml,
				"findUsersByParameterAlias",
				new SearchCriteria(new UserFilter(1001, "ACTIVE")));
		assertEquals("SELECT id, name, status FROM users where id = 1001 AND status = 'ACTIVE'",
				parameterAliasResult.getSql());
	}

	@Test
	void convertHandlesEdgeCases() throws Exception {
		String xml = readResource(SQLMAP_RESOURCE);

		// null 参数：内联为 null
		ConvertedSql nullResult = converter.convert(xml, "findUsersById", null);
		assertEquals("SELECT id, name, status, created_at FROM users where id = null", nullResult.getSql());
		assertEquals(null, nullResult.getParameters());

		// 空字符串：内联为 ''
		ConvertedSql emptyStrResult = converter.convert(xml, "findUsersById", "");
		assertEquals("SELECT id, name, status, created_at FROM users where id = ''", emptyStrResult.getSql());
		assertEquals("", emptyStrResult.getParameters());

		// 空 List：iterate 输出空括号
		List<Object> emptyList = listOf();
		ConvertedSql emptyListResult = converter.convert(xml, "findUsersByIdsList", emptyList);
		assertEquals("SELECT id, name, status, created_at FROM users where id IN (null)", emptyListResult.getSql());
		assertEquals(emptyList, emptyListResult.getParameters());
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
				result.getSql());
		assertEquals(
				mapOf("name", "Alice", "status", "ACTIVE", "ids", listOf(10, 11, 12)),
				result.getParameters());
	}

	@Test
	void convertSkipsEmptyConditions() throws Exception {
		String xml = readResource(SQLMAP_RESOURCE);
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("name", "");
		parameters.put("status", null);
		parameters.put("ids", listOf());

		ConvertedSql result = converter.convert(xml, "findUsers", parameters);
		assertEquals("SELECT id, name FROM users", result.getSql());
		assertEquals(parameters, result.getParameters());
	}

	@Test
	void convertMultipleStatementShapes() throws Exception {
		String xml = readResource(SQLMAP_RESOURCE);

		ConvertedSql includeUsers = converter.convert(xml, "findUsersByInclude", mapOf("status", "ACTIVE"));
		assertEquals("SELECT id, name, status FROM users WHERE status = 'ACTIVE'", includeUsers.getSql());

		Map<String, Object> keywordParameters = new HashMap<>();
		keywordParameters.put("keyword", "tom");
		keywordParameters.put("deleted", null);
		ConvertedSql keywordUsers = converter.convert(xml, "findUsersByKeyword", keywordParameters);
		assertEquals(
				"SELECT id, name, status FROM users WHERE (name LIKE '%' || 'tom' || '%' OR email LIKE '%' || 'tom' || '%') AND deleted = 0",
				keywordUsers.getSql());

		ConvertedSql updateUser = converter.convert(
				xml,
				"updateUser",
				mapOf("id", 1001, "name", "Bob", "status", "DISABLED", "email", "bob@example.com"));
		assertEquals(
				"UPDATE users SET name = 'Bob', status = 'DISABLED', email = 'bob@example.com' WHERE id = 1001",
				updateUser.getSql());
		assertEquals("update", updateUser.getStatementType());

		ConvertedSql deleteUsers = converter.convert(
				xml,
				"deleteUsersByIds",
				mapOf("ids", listOf(21, 22, 23)));
		assertEquals("DELETE FROM users WHERE id IN (21,22,23)", deleteUsers.getSql());

		ConvertedSql deleteUsersByCodes = converter.convert(
				xml,
				"deleteUsersByCodes",
				mapOf("codes", listOf("A001", "B002", "C003")));
		assertEquals("DELETE FROM users WHERE code IN ('A001','B002','C003')", deleteUsersByCodes.getSql());
	}

	@Test
	void convertForExecutionSkipsEmptyConditions() throws Exception {
		String xml = readResource(SQLMAP_RESOURCE);
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("name", "");
		parameters.put("status", null);
		parameters.put("ids", listOf());

		ConvertedSql result = converter.convertForExecution(xml, "findUsers", parameters);
		assertEquals("SELECT id, name FROM users", result.getSql());
		assertTrue(result.getParameters() instanceof List);
		assertEquals(listOf(), result.getParameters());
	}

	@Test
	void supportsSqlIncludeFragmentsInExecutionMode() throws Exception {
		String xml = readResource(SQLMAP_RESOURCE);

		ConvertedSql result = converter.convertForExecution(xml, "findUsersByInclude", mapOf("status", "ACTIVE"));
		assertEquals("SELECT id, name, status FROM users WHERE status = ?", result.getSql());
		assertEquals(listOf("ACTIVE"), result.getParameters());
	}

	@Test
	void supportsBeanParametersInExecutionMode() throws Exception {
		String xml = readResource(SQLMAP_RESOURCE);

		ConvertedSql beanResult = converter.convertForExecution(xml, "findUsersByIdMap", new UserFilter(1001, "ACTIVE"));
		assertEquals("SELECT id, name, status, created_at FROM users where id = ?", beanResult.getSql());
		assertEquals(listOf(1001L), beanResult.getParameters());

		ConvertedSql nestedBeanResult = converter.convertForExecution(
				xml,
				"findUsersByNestedBean",
				new SearchCriteria(new UserFilter(1001, "ACTIVE")));
		assertEquals("SELECT id, name, status FROM users where id = ? AND status = ?", nestedBeanResult.getSql());
		assertEquals(listOf(1001L, "ACTIVE"), nestedBeanResult.getParameters());

		ConvertedSql collectionAliasResult = converter.convertForExecution(xml, "findUsersByCollectionAlias", listOf(1, 2));
		assertEquals("SELECT id, name, status, created_at FROM users where id IN (?,?)", collectionAliasResult.getSql());
		assertEquals(listOf(1, 2), collectionAliasResult.getParameters());

		ConvertedSql arrayAliasResult = converter.convertForExecution(xml, "findUsersByArrayAlias",
				new Long[] { 1001L, 1002L });
		assertEquals("SELECT id, name, status, created_at FROM users where id IN (?,?)", arrayAliasResult.getSql());
		assertEquals(listOf(1001L, 1002L), arrayAliasResult.getParameters());
	}

	@Test
	void supportsExtendedParameterAliasesAndEnumComparison() throws Exception {
		String xml = readResource(SQLMAP_RESOURCE);

		ConvertedSql aliasResult = converter.convert(
				xml,
				"findUsersByParameterAlias",
				new SearchCriteria(new UserFilter(1001, "ACTIVE")));
		assertEquals("SELECT id, name, status FROM users where id = 1001 AND status = 'ACTIVE'", aliasResult.getSql());

		ConvertedSql enumCompareResult = converter.convert(xml, "findByEnumCompare", new PriorityHolder(Priority.HIGH));
		assertEquals("SELECT * FROM users WHERE priority_flag = 1", enumCompareResult.getSql());
	}

	@Test
	void supportsUnaryConditionalTags() throws Exception {
		String xml = readResource(SQLMAP_RESOURCE);

		ConvertedSql result = converter.convert(xml, "findByUnaryTags", mapOf("status", "ACTIVE", "name", "Alice"));
		assertEquals(
				"SELECT * FROM users WHERE deleted IS NULL AND status = 'ACTIVE' AND name = 'Alice' AND missing_flag = 1",
				result.getSql());
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
				result.getSql());
	}

	@Test
	void supportsParameterPresentTags() throws Exception {
		String xml = readResource(SQLMAP_RESOURCE);

		ConvertedSql presentResult = converter.convert(xml, "findByParameterPresence", mapOf("id", 1));
		assertEquals("SELECT * FROM users WHERE present_flag = 1", presentResult.getSql());

		ConvertedSql absentResult = converter.convert(xml, "findByParameterPresence", null);
		assertEquals("SELECT * FROM users WHERE present_flag = 0", absentResult.getSql());
	}

	@Test
	public void testResultMapIntegration() throws Exception {
		String xml = readResource(SQLMAP_RESOURCE);
		ConvertedSql convertedSql = converter.convert(xml, "selectUserByResultMap", null);

		assertNotNull(convertedSql);
		assertEquals("SELECT user_id, user_name FROM users", convertedSql.getSql());
		assertEquals("userResultMap", convertedSql.getResultMapId());
	}

	@Test
	void supportsNamespacedResultMapReference() throws Exception {
		String xml = readResource(SQLMAP_RESOURCE);
		ConvertedSql convertedSql = converter.convert(xml, "selectUserByNamespacedResultMap", null);

		assertEquals("SELECT user_id, user_name FROM users", convertedSql.getSql());
		assertEquals("userResultMap", convertedSql.getResultMapId());
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
