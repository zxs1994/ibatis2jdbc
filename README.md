# iBatis 到 JDBC 转换测试项目

这是一个最小可运行的测试工程，用来验证 iBatis XML 中的动态 SQL 标签如何转换成 JDBC SQL。

当前支持的核心场景：

- `<isNotEmpty>` 条件块
- `<iterate>` 集合展开
- `#param#` 占位符替换为 JDBC `?`
- `dynamic` 的简单 `prepend` 处理

## 运行

```bash
mvn test
```

## 结构

- `src/main/java` 下放转换器实现
- `src/test/resources` 下放示例 iBatis XML
- `src/test/java` 下放转换测试

## 适合做什么

这个项目适合先把你们现有 XML 样例逐个加到测试里，确认转换后的 JDBC SQL 和参数顺序是否正确，再继续扩展标签支持范围。
