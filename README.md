# iBatis 到 JDBC 转换测试项目

这个项目用于把 iBatis XML 中的 SQL 语句转换成两类结果：

- 可直接查看的最终 SQL
- 可供 JDBC `PreparedStatement` 执行的 SQL 和有序参数列表

项目当前基于 Java 8 和 JUnit 5，测试中已不再依赖 H2。

## 当前能力

当前已经覆盖的主要能力包括：

- `#param#` 占位符转最终字面量，或转 JDBC `?`
- `$param$` 原样拼接 SQL 片段
- `dynamic` 和 `trim` 片段展开
- `iterate` 集合展开
- `isNotEmpty`、`isEmpty`
- `isNull`、`isNotNull`
- `isPropertyAvailable`、`isNotPropertyAvailable`
- `isParameterPresent`、`isNotParameterPresent`
- `isEqual`、`isNotEqual`、`isGreaterThan`、`isGreaterEqual`、`isLessThan`、`isLessEqual`
- `compareValue` 和 `compareProperty` 条件比较
- `<![CDATA[ >= ]]>` 这类操作符 CDATA 清理
- XML `DOCTYPE` 预处理剥离，避免解析外部 DTD

## 快速开始

### 基本使用

#### 1. 初始化转换器

```java
IbatisToJdbcConverter converter = new IbatisToJdbcConverter();
converter.loadSqlMapsFromClasspath(); // 扫描 classpath 中所有 XMLMap 文件
```

#### 2. 转换 iBatis SQL 为 JDBC 形式

```java
// 准备参数（支持 Map、POJO 或任何类型的对象）
Map<String, Object> params = new HashMap<>();
params.put("userId", 123);
params.put("status", "active");

// 转换为 JDBC PreparedStatement 形式
ConvertedSql converted = converter.convertPrepared("selectUserById", params);

// 获取结果
String sql = converted.getSql();                    // SELECT ... WHERE id = ? AND status = ?
List<Object> bindings = converted.getPreparedBindings(); // [123, "active"]
```

### Spring JdbcTemplate 集成（推荐）

#### 1. 添加依赖

pom.xml 中已包含 spring-jdbc 5.3.31 作为可选依赖。若使用 Spring Boot，通常已自动引入。

#### 2. 创建执行器

```java
@Service
public class UserService {
  @Autowired
  private JdbcTemplate jdbcTemplate;
  
  private JdbcExecutor executor;
  private IbatisToJdbcConverter converter;
  
  @PostConstruct
  public void init() {
    converter = new IbatisToJdbcConverter();
    converter.loadSqlMapsFromClasspath();
    executor = new SpringJdbcExecutor(jdbcTemplate, converter);
  }
  
  // 查询多行
  public List<Map<String, Object>> findUsersByStatus(String status) {
    return executor.queryForList("selectUsersByStatus", 
      Collections.singletonMap("status", status));
  }
  
  // 查询单行
  public Map<String, Object> findUserById(Integer userId) {
    return executor.queryForMap("selectUserById", 
      Collections.singletonMap("userId", userId));
  }
  
  // 执行更新
  public int updateUserStatus(Integer userId, String newStatus) {
    Map<String, Object> params = new HashMap<>();
    params.put("userId", userId);
    params.put("status", newStatus);
    return executor.update("updateUserStatus", params);
  }
}
```

#### 3. 参数支持

`JdbcExecutor` 支持多种参数类型：

```java
// 使用 Map
Map<String, Object> mapParams = new HashMap<>();
mapParams.put("status", "active");
executor.queryForList("selectUsersByStatus", mapParams);

// 使用 POJO 对象
UserQuery query = new UserQuery();
query.setStatus("active");
query.setDepartmentId(10);
executor.queryForList("selectUsersByStatus", query);

// 使用任何对象
executor.queryForList("selectUsersByStatus", anyObject);
```

## 环境要求

- JDK 8
- Maven 3.9+

## 运行测试

执行全部测试：

```bash
mvn clean test
```

## 生成 SQLMap 报告

[src/test/java/com/blackbox/ibatis2jdbc/SqlMapXmlReportTest.java](src/test/java/com/blackbox/ibatis2jdbc/SqlMapXmlReportTest.java) 会读取一个 sqlmap 资源，遍历其中的顶层 statement，自动构造示例参数，并输出：

- Markdown 报告
- `.sql` 脚本文件

默认资源当前是：

- `/sqlmaps/multi-scenario-sqlmap.xml`

直接执行：

```bash
mvn -Dtest=SqlMapXmlReportTest test
```

也可以通过 JVM 系统属性覆盖输入资源和输出报告路径：

```bash
mvn -Dtest=SqlMapXmlReportTest \
	-Dsqlmap.resource=/online_sqlmaps/common_sqlmap.xml \
	-Dsqlmap.report=common_sqlmap-full-report.md test
```

其中：

- `sqlmap.resource` 指定要读取的测试资源路径
- `sqlmap.report` 指定 Markdown 报告输出路径

对应的 `.sql` 文件会和 Markdown 报告输出到同一路径目录下。

## 主要目录

- `src/main/java`：转换器与执行器实现
- `src/test/java`：单元测试和报告测试
- `src/test/resources/sqlmaps`：本地示例 sqlmap
- `src/test/resources/online_sqlmaps`：更大规模的真实 sqlmap 样例

## 主要类

- [src/main/java/com/blackbox/ibatis2jdbc/IbatisToJdbcConverter.java](src/main/java/com/blackbox/ibatis2jdbc/IbatisToJdbcConverter.java)：核心转换入口
- [src/main/java/com/blackbox/ibatis2jdbc/IbatisXmlSupport.java](src/main/java/com/blackbox/ibatis2jdbc/IbatisXmlSupport.java)：XML 标签和正则支持工具
- [src/main/java/com/blackbox/ibatis2jdbc/JdbcExecutor.java](src/main/java/com/blackbox/ibatis2jdbc/JdbcExecutor.java)：执行转换后 SQL 的 JDBC 辅助类

## 适用场景

这个项目适合在迁移 iBatis 到 JDBC 时，先把现有 SQLMap 作为样本喂给转换器，验证：

- 最终 SQL 是否正确展开
- 动态条件是否按预期命中或收缩
- `PreparedStatement` 参数顺序是否正确

如果后续要继续扩展标签支持，建议先补测试，再补转换逻辑。
