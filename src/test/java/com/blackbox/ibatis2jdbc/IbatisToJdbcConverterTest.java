package com.blackbox.ibatis2jdbc;

import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static com.blackbox.ibatis2jdbc.TestSupport.listOf;
import static com.blackbox.ibatis2jdbc.TestSupport.mapOf;
import static org.junit.jupiter.api.Assertions.assertNotNull;

class IbatisToJdbcConverterTest {
	private static final String SQLMAP_RESOURCE = "/sqlmaps/test-sqlmap.xml";
	private final IbatisToJdbcConverter converter = new IbatisToJdbcConverter();

	// ────────────────────────────────────────────────────────────────
	// convert() 模式：全内联字面量，输出最终可读 SQL
	// ────────────────────────────────────────────────────────────────

	/**
	 * 测试参数内联：Map/String/Number/Bean/List/Array等各类参数类型
	 * 期望：#占位符# 被替换为对应值的字面量形式（数字不加引号，字符串加单引号）
	 * 同时验证 statementType 和 resultClass 的正确传递
	 */
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

		// Bean 参数：内联为属性值的字面量
		ConvertedSql beanResult = converter.convert(xml, "findUsersByIdMap", new UserFilter(1001, "ACTIVE"));
		assertEquals("SELECT id, name, status, created_at FROM users where id = 1001", beanResult.getSql());

		// 嵌套 Bean 参数：内联为嵌套属性值的字面量
		ConvertedSql nestedBeanResult = converter.convert(
				xml,
				"findUsersByNestedBean",
				new SearchCriteria(new UserFilter(1001, "ACTIVE")));
		assertEquals("SELECT id, name, status FROM users where id = 1001 AND status = 'ACTIVE'",
				nestedBeanResult.getSql());

		// List 参数：iterate 内联每个元素
		ConvertedSql listResult = converter.convert(xml, "findUsersByIdsList", listOf("A001", "B002"));
		assertEquals("SELECT id, name, status, created_at FROM users where id IN ('A001','B002')", listResult.getSql());
		assertEquals(listOf("A001", "B002"), listResult.getParameters());

		// Array 参数：iterate 内联每个元素
		ConvertedSql collectionAliasResult = converter.convert(xml, "findUsersByCollectionAlias", listOf("A001", "B002"));
		assertEquals("SELECT id, name, status, created_at FROM users where id IN ('A001','B002')",
				collectionAliasResult.getSql());

		// Array 参数别名访问：内联每个元素
		ConvertedSql arrayAliasResult = converter.convert(xml, "findUsersByArrayAlias", new Long[] { 1001L, 1002L });
		assertEquals("SELECT id, name, status, created_at FROM users where id IN (1001,1002)", arrayAliasResult.getSql());

		// 参数别名访问：_parameter/criteria等别名能正确解析
		ConvertedSql parameterAliasResult = converter.convert(
				xml,
				"findUsersByParameterAlias",
				new SearchCriteria(new UserFilter(1001, "ACTIVE")));
		assertEquals("SELECT id, name, status FROM users where id = 1001 AND status = 'ACTIVE'",
				parameterAliasResult.getSql());
	}

	/**
	 * 测试边界情况：null/空字符串/空集合
	 * 期望：null → "null"，空字符串 → "''"，空List → "(null)" 保持SQL合法
	 */
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

		// 空 List：iterate 输出空括号或 (null)
		ConvertedSql emptyListResult = converter.convert(xml, "findUsersByIdsList", listOf());
		assertEquals("SELECT id, name, status, created_at FROM users where id IN (null)", emptyListResult.getSql());
		assertEquals(listOf(), emptyListResult.getParameters());
	}

	/**
	 * 测试动态标签 + iterate：multiple条件全命中时的拼装
	 * 期望：dynamic/isNotEmpty 条件全展开，id IN 用 iterate 逐个展开整数
	 */
	@Test
	void convertWithDynamicTagsAndIterate() throws Exception {
		String xml = readResource(SQLMAP_RESOURCE);

		// 全部参数命中：dynamic 条件全部展开，iterate 内联每个元素
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

	/**
	 * 测试动态标签跳过：空字符串/null/空集合条件全部跳过
	 * 期望：WHERE 子句完全消失，返回基础 SELECT 语句
	 */
	@Test
	void convertSkipsEmptyConditions() throws Exception {
		String xml = readResource(SQLMAP_RESOURCE);
		// dynamic 条件全部跳过，返回基础 SELECT 语句
		ConvertedSql result = converter.convert(xml, "findUsers", mapOf("name", "", "status", null, "ids", listOf()));
		assertEquals("SELECT id, name FROM users", result.getSql());
	}

	/**
	 * 测试多种SQL形式：SELECT/UPDATE/DELETE + sql/include + 动态标签组合
	 * 期望：各类语句能正确渲染，statementType 正确识别
	 */
	@Test
	void convertMultipleStatementShapes() throws Exception {
		String xml = readResource(SQLMAP_RESOURCE);

		// include 引用：sql 片段被正确替换
		ConvertedSql includeUsers = converter.convert(xml, "findUsersByInclude", mapOf("status", "ACTIVE"));
		assertEquals("SELECT id, name, status FROM users WHERE status = 'ACTIVE'", includeUsers.getSql());

		// SQL 标签：sql 片段被正确替换
		ConvertedSql keywordUsers = converter.convert(xml, "findUsersByKeyword", mapOf("keyword", "tom", "deleted", null));
		assertEquals(
				"SELECT id, name, status FROM users WHERE (name LIKE '%' || 'tom' || '%' OR email LIKE '%' || 'tom' || '%') AND deleted = 0",
				keywordUsers.getSql());

		// UPDATE 语句：正确识别 statementType，SET 子句正确渲染
		ConvertedSql updateUser = converter.convert(
				xml,
				"updateUser",
				mapOf("id", 1001, "name", "Bob", "status", "DISABLED", "email", "bob@example.com"));
		assertEquals(
				"UPDATE users SET name = 'Bob', status = 'DISABLED', email = 'bob@example.com' WHERE id = 1001",
				updateUser.getSql());
		assertEquals("update", updateUser.getStatementType());

		// DELETE 语句：正确识别 statementType，WHERE 子句正确渲染
		ConvertedSql deleteUsers = converter.convert(
				xml,
				"deleteUsersByIds",
				mapOf("ids", listOf(21, 22, 23)));
		assertEquals("DELETE FROM users WHERE id IN (21,22,23)", deleteUsers.getSql());

		// DELETE 语句 + List 参数：正确识别 statementType，WHERE 子句正确渲染，List 参数被 iterate 内联
		ConvertedSql deleteUsersByCodes = converter.convert(
				xml,
				"deleteUsersByCodes",
				mapOf("codes", listOf("A001", "B002", "C003")));
		assertEquals("DELETE FROM users WHERE code IN ('A001','B002','C003')", deleteUsersByCodes.getSql());
	}

	// ────────────────────────────────────────────────────────────────
	// 高级特性：参数别名、枚举、条件标签、resultMap
	// ────────────────────────────────────────────────────────────────

	/**
	 * 测试参数别名访问 + 枚举比较
	 * 期望：_parameter/criteria等别名能正确解析，枚举值与compareValue比较成功
	 */
	@Test
	void supportsExtendedParameterAliasesAndEnumComparison() throws Exception {
		String xml = readResource(SQLMAP_RESOURCE);

		// 参数别名访问：内联为属性值的字面量
		ConvertedSql aliasResult = converter.convert(
				xml,
				"findUsersByParameterAlias",
				new SearchCriteria(new UserFilter(1001, "ACTIVE")));
		assertEquals("SELECT id, name, status FROM users where id = 1001 AND status = 'ACTIVE'", aliasResult.getSql());

		// 枚举比较：枚举值被正确解析并与 compareValue 比较
		ConvertedSql enumCompareResult = converter.convert(xml, "findByEnumCompare", new PriorityHolder(Priority.HIGH));
		assertEquals("SELECT * FROM users WHERE priority_flag = 1", enumCompareResult.getSql());
	}

	/**
	 * 测试一元条件标签：isNull/isNotNull/isPropertyAvailable/isNotPropertyAvailable
	 * 期望：各标签按条件正确命中或跳过
	 */
	@Test
	void supportsUnaryConditionalTags() throws Exception {
		String xml = readResource(SQLMAP_RESOURCE);

		// isNotNull/isNotEmpty 条件命中，isNull/isEmpty 条件跳过
		ConvertedSql result = converter.convert(xml, "findByUnaryTags", mapOf("status", "ACTIVE", "name", "Alice"));
		assertEquals(
				"SELECT * FROM users WHERE deleted IS NULL AND status = 'ACTIVE' AND name = 'Alice' AND missing_flag = 1",
				result.getSql());
	}

	/**
	 * 测试二元条件标签：isEqual/isNotEqual/isGreaterThan/isGreaterEqual/isLessThan/isLessEqual
	 * 以及 compareProperty 比较两个参数的功能
	 * 期望：所有比较运算符正确执行
	 */
	@Test
	void supportsBinaryConditionalTagsAndCompareProperty() throws Exception {
		String xml = readResource(SQLMAP_RESOURCE);

		// 多条件组合：多个二元条件标签同时命中，compareProperty 正确比较两个参数
		ConvertedSql result = converter.convert(
				xml,
				"findByBinaryTags",
				mapOf("type", 1, "status", "ACTIVE", "age", 20, "score", 90, "rank", 2, "maxRank", 5, "level", 3));
		assertEquals(
				"SELECT * FROM users WHERE type = 1 AND status <> 'DISABLED' AND age > 18 AND score >= 90 AND rank < maxRank AND level <= 3",
				result.getSql());
	}

	/**
	 * 测试参数存在性条件：isParameterPresent/isNotParameterPresent
	 * 期望：有参数时命中第一个分支，null/无参数时命中第二个分支
	 */
	@Test
	void supportsParameterPresentTags() throws Exception {
		String xml = readResource(SQLMAP_RESOURCE);

		// 参数存在：命中 isParameterPresent 分支
		ConvertedSql presentResult = converter.convert(xml, "findByParameterPresence", mapOf("id", 1));
		assertEquals("SELECT * FROM users WHERE present_flag = 1", presentResult.getSql());

		// 参数不存在：命中 isNotParameterPresent 分支
		ConvertedSql absentResult = converter.convert(xml, "findByParameterPresence", null);
		assertEquals("SELECT * FROM users WHERE present_flag = 0", absentResult.getSql());
	}

	/**
	 * 测试resultMap识别和传递
	 * 期望：resultMap属性被解析，resultMapId字段被正确填充
	 */
	@Test
	public void testResultMapIntegration() throws Exception {
		String xml = readResource(SQLMAP_RESOURCE);
		// resultMap引用：resultMapId被正确解析和传递
		ConvertedSql convertedSql = converter.convert(xml, "selectUserByResultMap", null);

		assertNotNull(convertedSql);
		assertEquals("SELECT user_id, user_name FROM users", convertedSql.getSql());
		assertEquals("userResultMap", convertedSql.getResultMapId());
	}

	/**
	 * 测试命名空间形式resultMap引用（ns.userResultMap）
	 * 期望：命名空间前缀被去掉，正确回退到本地id（userResultMap）
	 */
	@Test
	void supportsNamespacedResultMapReference() throws Exception {
		String xml = readResource(SQLMAP_RESOURCE);
		// resultMap引用：命名空间前缀被去掉，正确回退到本地id
		ConvertedSql convertedSql = converter.convert(xml, "selectUserByNamespacedResultMap", null);

		assertEquals("SELECT user_id, user_name FROM users", convertedSql.getSql());
		assertEquals("userResultMap", convertedSql.getResultMapId());
	}

	/**
	 * 测试内存预加载入口：扫描 classpath 中 *sqlmap.xml 并建立 statementId 索引
	 * 期望：只传 statementId + parameters 也可以完成 SQL 转换
	 */
	@Test
	void convertsByStatementIdAfterLoadingSqlMaps() {
		int loaded = converter.loadSqlMapsFromClasspath();
		assertTrue(loaded > 0);

		// 直接按 statementId 调用，验证能正确转换 SQL
		ConvertedSql result = converter.convert("findUsersByIdMap", mapOf("id", 1001));
		assertEquals("SELECT id, name, status, created_at FROM users where id = 1001", result.getSql());
		assertEquals(mapOf("id", 1001), result.getParameters());
	}

	/**
	 * 测试未预加载时的行为
	 * 期望：直接按 statementId 调用会抛出明确异常，引导先执行 loadSqlMapsFromClasspath()
	 */
	@Test
	void throwsWhenConvertByStatementIdWithoutLoading() {
		IbatisToJdbcConverter freshConverter = new IbatisToJdbcConverter();
		IllegalStateException exception = assertThrows(IllegalStateException.class,
				() -> freshConverter.convert("findUsersByIdMap", mapOf("id", 1001)));
		assertTrue(exception.getMessage().contains("loadSqlMapsFromClasspath"));
	}

	// ────────────────────────────────────────────────────────────────
	// 负向测试：异常情况
	// ────────────────────────────────────────────────────────────────

	/**
	 * 测试找不到statement时抛出异常
	 * 期望：IllegalStateException wraps IllegalArgumentException("Cannot find
	 * statement: xxx")
	 */
	@Test
	void throwsWhenStatementIdDoesNotExist() throws Exception {
		String xml = readResource(SQLMAP_RESOURCE);

		IllegalStateException exception = assertThrows(IllegalStateException.class,
				() -> converter.convert(xml, "missingStatement", mapOf("id", 1)));

		assertTrue(exception.getCause() instanceof IllegalArgumentException);
		assertEquals("Cannot find statement: missingStatement", exception.getCause().getMessage());
	}

	/**
	 * 测试include引用不存在的sql片段时抛出异常
	 * 期望：IllegalStateException wraps IllegalArgumentException("Cannot find sql
	 * fragment: xxx")
	 */
	@Test
	void throwsWhenIncludeFragmentDoesNotExist() throws Exception {
		String xml = readResource(SQLMAP_RESOURCE);

		IllegalStateException exception = assertThrows(IllegalStateException.class,
				() -> converter.convert(xml, "brokenInclude", null));

		assertTrue(exception.getCause() instanceof IllegalArgumentException);
		assertEquals("Cannot find sql fragment: missingFragment", exception.getCause().getMessage());
	}

	/**
	 * 测试resultMap引用不存在的映射定义时抛出异常
	 * 期望：IllegalStateException wraps IllegalArgumentException("Cannot find
	 * resultMap: xxx")
	 */
	@Test
	void throwsWhenResultMapDoesNotExist() throws Exception {
		String xml = readResource(SQLMAP_RESOURCE);

		IllegalStateException exception = assertThrows(IllegalStateException.class,
				() -> converter.convert(xml, "brokenResultMap", null));

		assertTrue(exception.getCause() instanceof IllegalArgumentException);
		assertEquals("Cannot find resultMap: notExists", exception.getCause().getMessage());
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
