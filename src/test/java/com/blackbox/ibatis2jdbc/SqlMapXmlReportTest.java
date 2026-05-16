package com.blackbox.ibatis2jdbc;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.assertTrue;

class SqlMapXmlReportTest {
  private static final String RESOURCE_PROPERTY = "sqlmap.resource";
  private static final String REPORT_PROPERTY = "sqlmap.report";
  private String sqlMapResource;
  private String sqlMapFileName;
  private Path reportPath;
  private Path sqlScriptPath;

  private static final String SQLMAP_RESOURCE = "src/test/resources/sqlmaps/test-sqlmap.xml";
  private final IbatisToJdbcConverter converter = new IbatisToJdbcConverter();

  @BeforeEach
  void setUp() throws IOException {
    sqlMapResource = normalizeResourcePath(System.getProperty(RESOURCE_PROPERTY, SQLMAP_RESOURCE));
    String sqlMapFilePath = toFileSystemSqlMapPath(sqlMapResource);
    sqlMapFileName = extractFileName(sqlMapFilePath);
    reportPath = resolveReportPath(sqlMapFileName, System.getProperty(REPORT_PROPERTY));
    sqlScriptPath = resolveSqlScriptPath(reportPath);
    converter.clearLoadedSqlMaps();
    converter.loadSqlMapsFromClasspath(sqlMapFilePath);
  }

  @Test
  void generateDynamicSqlReport() throws Exception {
    List<StatementCase> cases = collectCasesFromLoadedStatements();
    List<CaseResult> results = new ArrayList<>();

    for (StatementCase statementCase : cases) {
      String finalSql = null;
      String resolvedStatementType = statementCase.statementType;
      try {
        ConvertedSql convertedSql = converter.convertPrepared(statementCase.statementId, statementCase.parameters);
        finalSql = convertedSql.toPreviewSql();
        resolvedStatementType = convertedSql.getStatementType();
        assertTrue(finalSql != null && !finalSql.trim().isEmpty(), statementCase.statementId + " generated blank SQL");
        assertTrue(!IbatisXmlSupport.containsDynamicTagMarkup(finalSql) && !finalSql.contains("<![CDATA["),
            statementCase.statementId + " still contains XML/dynamic tags");
        assertSqlStructure(statementCase.statementId, finalSql);
        results.add(CaseResult.success(statementCase, resolvedStatementType, finalSql));
      } catch (Throwable throwable) {
        results.add(CaseResult.failure(statementCase, resolvedStatementType, finalSql, throwable));
      }
    }

    writeReport(results);
  }

  private List<StatementCase> collectCasesFromLoadedStatements() {
    List<StatementCase> cases = new ArrayList<>();
    for (IbatisToJdbcConverter.LoadedStatementInfo info : converter.getLoadedStatementInfos()) {
      TestParameterUtils.StatementMeta meta = TestParameterUtils.resolveStatementMeta(info);
      String statementXml = info.getSqlMapXml() == null ? "" : info.getSqlMapXml();

      // 如果是标量参数，仍然只生成两组
      if (meta.scalarParameter) {
        Object baseParameters = TestParameterUtils.buildParameters(meta, true, 0);
        cases.add(new StatementCase(
            info.getStatementId(),
            "标量基础执行",
            "标量参数主路径",
            baseParameters,
            meta.statementType,
            statementXml));
        Object variantParameters = TestParameterUtils.buildParameters(meta, true, 1);
        cases.add(new StatementCase(
            info.getStatementId(),
            "标量变体执行",
            "标量参数变体",
            variantParameters,
            meta.statementType,
            statementXml));
        continue;
      }

      // 动态参数分支全覆盖
      List<Map<String, Object>> paramVariants = TestParameterUtils.generateAllDynamicParameterVariants(meta);
      int idx = 0;
      for (Map<String, Object> paramSet : paramVariants) {
        StringBuilder caseName = new StringBuilder("动态分支");
        StringBuilder assertion = new StringBuilder("参数分支：");
        for (String key : paramSet.keySet()) {
          Object val = paramSet.get(key);
          if (val == null || (val instanceof String && ((String) val).isEmpty())
              || (val instanceof Collection && ((Collection<?>) val).isEmpty())) {
            caseName.append("|无").append(key);
            assertion.append(key).append("=空;");
          } else {
            caseName.append("|有").append(key);
            assertion.append(key).append("=有值;");
          }
        }
        cases.add(new StatementCase(
            info.getStatementId(),
            caseName.append("#").append(idx).toString(),
            assertion.toString(),
            paramSet,
            meta.statementType,
            statementXml));
        idx++;
      }
    }
    return cases;
  }

  private boolean containsDynamicTags(String statementXml) {
    if (statementXml == null || statementXml.trim().isEmpty()) {
      return false;
    }
    String lower = statementXml.toLowerCase();
    return lower.contains("<dynamic")
        || lower.contains("<isnotempty")
        || lower.contains("<isempty")
        || lower.contains("<isnull")
        || lower.contains("<isnotnull")
        || lower.contains("<ispropertyavailable")
        || lower.contains("<isnotpropertyavailable")
        || lower.contains("<isparameterpresent")
        || lower.contains("<isnotparameterpresent")
        || lower.contains("<isequal")
        || lower.contains("<isnotequal")
        || lower.contains("<isgreaterthan")
        || lower.contains("<isgreaterequal")
        || lower.contains("<islessthan")
        || lower.contains("<islessequal")
        || lower.contains("<iterate");
  }

  private Object buildEmptyBranchParameters(Object parameters) {
    if (!(parameters instanceof Map<?, ?>)) {
      return parameters;
    }
    Map<?, ?> source = (Map<?, ?>) parameters;
    java.util.LinkedHashMap<String, Object> target = new java.util.LinkedHashMap<>();
    for (Map.Entry<?, ?> entry : source.entrySet()) {
      String key = String.valueOf(entry.getKey());
      Object value = entry.getValue();
      target.put(key, toEmptyLikeValue(value));
    }
    return target;
  }

  private Object toEmptyLikeValue(Object value) {
    if (value == null) {
      return null;
    }
    if (value instanceof String) {
      return "";
    }
    if (value instanceof Collection<?>) {
      return new ArrayList<>();
    }
    if (value.getClass().isArray()) {
      return new Object[0];
    }
    if (value instanceof Number || value instanceof Boolean || value instanceof Character) {
      return null;
    }
    return null;
  }

  private void assertSqlStructure(String statementId, String sql) {
    String issue = findSqlStructureIssue(sql);
    assertTrue(issue == null, statementId + " generated SQL with " + issue + ": " + sql);
  }

  private String findSqlStructureIssue(String sql) {
    int parenthesesDepth = 0;
    boolean inSingleQuote = false;
    boolean inDoubleQuote = false;
    for (int i = 0; i < sql.length(); i++) {
      char current = sql.charAt(i);
      if (current == '\'' && !inDoubleQuote) {
        if (inSingleQuote && i + 1 < sql.length() && sql.charAt(i + 1) == '\'') {
          i++;
          continue;
        }
        inSingleQuote = !inSingleQuote;
        continue;
      }
      if (current == '"' && !inSingleQuote) {
        inDoubleQuote = !inDoubleQuote;
        continue;
      }
      if (inSingleQuote || inDoubleQuote) {
        continue;
      }
      if (current == '(') {
        parenthesesDepth++;
        continue;
      }
      if (current == ')') {
        parenthesesDepth--;
        if (parenthesesDepth < 0) {
          return "extra closing parenthesis";
        }
      }
    }

    if (inSingleQuote) {
      return "unclosed single quote";
    }
    if (inDoubleQuote) {
      return "unclosed double quote";
    }
    if (parenthesesDepth != 0) {
      return "unbalanced parentheses";
    }
    return null;
  }

  private void writeReport(List<CaseResult> results) throws IOException {
    StringBuilder builder = new StringBuilder();
    StringBuilder sqlBuilder = new StringBuilder();
    long passed = 0;
    long failed = 0;
    for (CaseResult result : results) {
      if (result.success) {
        passed++;
      } else {
        failed++;
      }
    }

    builder.append("# ").append(sqlMapFileName).append(" statement 测试报告\n\n");
    builder.append("- 资源路径：").append(sqlMapResource).append("\n");
    builder.append("- 范围：统计该 sqlmap 中全部顶层 statement\n");
    builder.append("- 用例数：").append(results.size()).append("\n");
    builder.append("- 通过：").append(passed).append("\n");
    builder.append("- 失败：").append(failed).append("\n\n");

    sqlBuilder.append("-- ").append(sqlMapFileName).append(" statement SQL 脚本\n");
    sqlBuilder.append("-- 资源路径: ").append(sqlMapResource).append("\n");
    sqlBuilder.append("-- 用例数: ").append(results.size()).append("\n");
    sqlBuilder.append("-- 通过: ").append(passed).append("\n");
    sqlBuilder.append("-- 失败: ").append(failed).append("\n\n");

    for (CaseResult result : results) {
      builder.append("## ").append(result.statementId).append(" [").append(result.caseName).append("]\n\n");
      builder.append("- statement 类型：").append(result.statementType).append("\n");
      builder.append("- 验证点：").append(result.assertionPoint).append("\n");
      builder.append("- 输入参数：\n\n```text\n").append(result.parametersText).append("\n```\n");
      builder.append("- 结果：").append(result.success ? "通过" : "失败").append("\n");
      builder.append("- 原始 XML：\n\n```xml\n").append(result.originalXml).append("\n```\n\n");
      if (result.success) {
        builder.append("- 最终 SQL：\n\n```sql\n").append(result.finalSql).append("\n```\n\n");
      } else {
        if (result.finalSql != null && !result.finalSql.trim().isEmpty()) {
          builder.append("- 最终 SQL（失败时生成结果）：\n\n```sql\n").append(result.finalSql).append("\n```\n\n");
        }
        builder.append("- 错误：\n\n```text\n").append(result.errorMessage).append("\n```\n\n");
      }

      appendSqlCase(sqlBuilder, result);
    }

    Files.write(reportPath, builder.toString().getBytes(StandardCharsets.UTF_8));
    Files.write(sqlScriptPath, sqlBuilder.toString().getBytes(StandardCharsets.UTF_8));
  }

  private String normalizeResourcePath(String value) {
    if (value == null || value.trim().isEmpty()) {
      return SQLMAP_RESOURCE;
    }
    return value.trim();
  }

  private String toFileSystemSqlMapPath(String resourcePath) {
    if (resourcePath.startsWith("/")) {
      return "src/test/resources" + resourcePath;
    }
    return resourcePath;
  }

  private String extractFileName(String resourcePath) {
    int index = resourcePath.lastIndexOf('/');
    return index >= 0 ? resourcePath.substring(index + 1) : resourcePath;
  }

  private Path resolveReportPath(String fileName, String reportProperty) {
    if (reportProperty != null && !reportProperty.trim().isEmpty()) {
      return Paths.get(reportProperty.trim());
    }
    String base = fileName;
    int dot = fileName.lastIndexOf('.');
    if (dot > 0) {
      base = fileName.substring(0, dot);
    }
    return Paths.get(base + "-full-report.md");
  }

  private Path resolveSqlScriptPath(Path markdownReportPath) {
    String fileName = markdownReportPath.getFileName().toString();
    String sqlFileName;
    if (fileName.endsWith(".md")) {
      sqlFileName = fileName.substring(0, fileName.length() - 3) + ".sql";
    } else {
      sqlFileName = fileName + ".sql";
    }
    Path parent = markdownReportPath.getParent();
    return parent == null ? Paths.get(sqlFileName) : parent.resolve(sqlFileName);
  }

  private void appendSqlCase(StringBuilder sqlBuilder, CaseResult result) {
    sqlBuilder.append("-- statementId: ").append(result.statementId).append("\n");
    sqlBuilder.append("-- case: ").append(result.caseName).append("\n");
    sqlBuilder.append("-- type: ").append(result.statementType).append("\n");
    sqlBuilder.append("-- assertion: ").append(result.assertionPoint).append("\n");
    appendSqlCommentBlock(sqlBuilder, "-- params: ", result.parametersText);
    if (result.success) {
      sqlBuilder.append(ensureSqlTerminator(result.finalSql)).append("\n\n");
      return;
    }

    if (result.finalSql != null && !result.finalSql.trim().isEmpty()) {
      sqlBuilder.append(ensureSqlTerminator(result.finalSql)).append("\n");
    }

    appendSqlCommentBlock(sqlBuilder, "-- error: ", result.errorMessage);
    sqlBuilder.append("\n");
  }

  private void appendSqlCommentBlock(StringBuilder sqlBuilder, String prefix, String value) {
    String normalized = value == null ? "" : value.replace("\r\n", "\n").replace('\r', '\n');
    String[] lines = normalized.split("\n", -1);
    for (String line : lines) {
      sqlBuilder.append(prefix).append(line).append("\n");
      prefix = "-- ";
    }
  }

  private String ensureSqlTerminator(String sql) {
    String trimmed = sql == null ? "" : sql.trim();
    if (trimmed.isEmpty() || trimmed.endsWith(";")) {
      return trimmed;
    }
    return trimmed + ";";
  }

  private static final class StatementCase {
    private final String statementId;
    private final String caseName;
    private final String assertionPoint;
    private final Object parameters;
    private final String statementType;
    private final String originalXml;

    private StatementCase(String statementId, String caseName, String assertionPoint, Object parameters,
        String statementType, String originalXml) {
      this.statementId = statementId;
      this.caseName = caseName;
      this.assertionPoint = assertionPoint;
      this.parameters = parameters;
      this.statementType = statementType;
      this.originalXml = originalXml;
    }
  }

  private static final class CaseResult {
    private final String statementId;
    private final String caseName;
    private final String statementType;
    private final String assertionPoint;
    private final String parametersText;
    private final boolean success;
    private final String originalXml;
    private final String finalSql;
    private final String errorMessage;

    private CaseResult(String statementId, String caseName, String statementType, String assertionPoint,
        String parametersText, boolean success, String originalXml, String finalSql, String errorMessage) {
      this.statementId = statementId;
      this.caseName = caseName;
      this.statementType = statementType;
      this.assertionPoint = assertionPoint;
      this.parametersText = parametersText;
      this.success = success;
      this.originalXml = originalXml;
      this.finalSql = finalSql;
      this.errorMessage = errorMessage;
    }

    private static CaseResult success(StatementCase statementCase, String statementType, String finalSql) {
      return new CaseResult(statementCase.statementId, statementCase.caseName, statementType,
          statementCase.assertionPoint, stringify(statementCase.parameters), true, statementCase.originalXml,
          finalSql, null);
    }

    private static CaseResult failure(StatementCase statementCase, String statementType, String finalSql,
        Throwable throwable) {
      return new CaseResult(statementCase.statementId, statementCase.caseName, statementType,
          statementCase.assertionPoint, stringify(statementCase.parameters), false, statementCase.originalXml,
          finalSql, throwable.toString());
    }

    private static String stringify(Object value) {
      return formatValue(value, 0);
    }

    private static String formatValue(Object v, int depth) {
      if (v == null) {
        return "null";
      }
      if (v instanceof String) {
        return '"' + escapeJson(v.toString()) + '"';
      }
      if (v instanceof Number || v instanceof Boolean) {
        return String.valueOf(v);
      }
      if (v instanceof Map<?, ?>) {
        return formatMap((Map<?, ?>) v, depth);
      }
      if (v instanceof Collection<?>) {
        return formatCollection((Collection<?>) v, depth);
      }
      if (v.getClass().isArray()) {
        return formatArray(v, depth);
      }
      return '"' + escapeJson(String.valueOf(v)) + '"';
    }

    private static String formatMap(Map<?, ?> map, int depth) {
      if (map.isEmpty()) {
        return "{}";
      }
      StringBuilder sb = new StringBuilder("{\n");
      boolean first = true;
      for (Map.Entry<?, ?> entry : map.entrySet()) {
        if (!first) {
          sb.append(",\n");
        }
        first = false;
        sb.append(indent(depth + 1))
            .append('"').append(escapeJson(String.valueOf(entry.getKey()))).append('"')
            .append(": ")
            .append(formatValue(entry.getValue(), depth + 1));
      }
      sb.append('\n').append(indent(depth)).append('}');
      return sb.toString();
    }

    private static String formatCollection(Collection<?> collection, int depth) {
      if (collection.isEmpty()) {
        return "[]";
      }
      StringBuilder sb = new StringBuilder("[\n");
      boolean first = true;
      for (Object item : collection) {
        if (!first) {
          sb.append(",\n");
        }
        first = false;
        sb.append(indent(depth + 1)).append(formatValue(item, depth + 1));
      }
      sb.append('\n').append(indent(depth)).append(']');
      return sb.toString();
    }

    private static String formatArray(Object array, int depth) {
      int length = java.lang.reflect.Array.getLength(array);
      if (length == 0) {
        return "[]";
      }
      StringBuilder sb = new StringBuilder("[\n");
      for (int i = 0; i < length; i++) {
        if (i > 0) {
          sb.append(",\n");
        }
        sb.append(indent(depth + 1)).append(formatValue(java.lang.reflect.Array.get(array, i), depth + 1));
      }
      sb.append('\n').append(indent(depth)).append(']');
      return sb.toString();
    }

    private static String indent(int depth) {
      int safeDepth = Math.max(0, depth);
      StringBuilder builder = new StringBuilder(safeDepth * 2);
      for (int i = 0; i < safeDepth; i++) {
        builder.append("  ");
      }
      return builder.toString();
    }

    private static String escapeJson(String text) {
      return text
          .replace("\\", "\\\\")
          .replace("\"", "\\\"")
          .replace("\n", "\\n")
          .replace("\r", "\\r")
          .replace("\t", "\\t");
    }
  }
}