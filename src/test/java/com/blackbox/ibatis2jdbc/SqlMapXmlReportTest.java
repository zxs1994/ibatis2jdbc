package com.blackbox.ibatis2jdbc;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.w3c.dom.CDATASection;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import javax.xml.XMLConstants;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import java.io.IOException;
import java.io.StringWriter;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;

import static com.blackbox.ibatis2jdbc.TestSupport.listOf;
import static org.junit.jupiter.api.Assertions.assertTrue;

class SqlMapXmlReportTest {
  private static final String RESOURCE_PROPERTY = "sqlmap.resource";
  private static final String REPORT_PROPERTY = "sqlmap.report";
  private String xml;
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
    xml = new String(Files.readAllBytes(Paths.get(sqlMapFilePath)), StandardCharsets.UTF_8);
    converter.clearLoadedSqlMaps();
    converter.loadSqlMapsFromClasspath(sqlMapFilePath);
  }

  @Test
  void generateDynamicSqlReport() throws Exception {
    Document document = parseDocument(xml);
    List<StatementCase> cases = collectCases(document);
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

  private List<StatementCase> collectCases(Document document) throws Exception {
    List<StatementCase> cases = new ArrayList<>();
    NodeList nodes = document.getDocumentElement().getChildNodes();
    for (int index = 0; index < nodes.getLength(); index++) {
      Node node = nodes.item(index);
      if (!(node instanceof Element)) {
        continue;
      }
      Element statement = (Element) node;
      if (!IbatisXmlSupport.isStatementTag(statement.getTagName())) {
        continue;
      }

      StatementMeta meta = analyzeStatement(statement);
      String originalXml = toXml(statement);
      Object activeParametersA = buildParameters(meta, true, 0);
      cases.add(new StatementCase(meta.statementId, meta.defaultCaseName(), meta.defaultAssertionPoint(),
          activeParametersA, meta.statementType, originalXml));

      // 当存在参数时，仅保留一个基础用例（A），避免简单替换值带来的冗余用例

      if (meta.hasOptionalDynamicBranch()) {
        Object reducedParameters = buildParameters(meta, false, 0);
        cases.add(new StatementCase(meta.statementId, "可选条件关闭", "移除可选动态属性，观察条件收缩后的 SQL",
            reducedParameters, meta.statementType, originalXml));
      }
    }
    return cases;
  }

  private Object buildParameters(StatementMeta meta, boolean includeOptional, int variantIndex) {
    if (meta.scalarParameter) {
      return sampleScalarValue(meta, variantIndex);
    }

    Map<String, Object> parameters = new LinkedHashMap<>();
    for (Placeholder placeholder : meta.placeholders.values()) {
      String property = normalizePropertyName(placeholder.name);
      if (!includeOptional && meta.dynamicProperties.contains(property)
          && !meta.requiredOutsideDynamic.contains(property)) {
        continue;
      }
      parameters.put(property,
          sampleValue(property, placeholder.marker, meta.iterateProperties.contains(property), variantIndex));
    }

    if (includeOptional) {
      for (String property : meta.dynamicProperties) {
        if (!parameters.containsKey(property)) {
          parameters.put(property, sampleValue(property, '#', meta.iterateProperties.contains(property), variantIndex));
        }
      }
    }

    return parameters;
  }

  private Object sampleScalarValue(StatementMeta meta, int variantIndex) {
    if (!meta.placeholders.isEmpty()) {
      Placeholder placeholder = meta.placeholders.values().iterator().next();
      return sampleValue(normalizePropertyName(placeholder.name), placeholder.marker,
          meta.iterateProperties.contains(normalizePropertyName(placeholder.name)), variantIndex);
    }
    return variantIndex == 0 ? "VALUE_001" : "VALUE_002";
  }

  private Object sampleValue(String property, char marker, boolean iterate, int variantIndex) {
    String lower = property.toLowerCase(Locale.ROOT);
    if (iterate) {
      return variantIndex == 0 ? listOf("EVENT_A", "EVENT_B") : listOf("EVENT_X", "EVENT_Y", "EVENT_Z");
    }

    if (marker == '$') {
      if (lower.contains("order")) {
        return variantIndex == 0 ? "order by id desc" : "order by create_date asc";
      }
      if (lower.contains("departcode") || lower.contains("deptcode")) {
        return variantIndex == 0 ? "'D001','D002'" : "'D101','D102'";
      }
      if (lower.contains("table")) {
        return variantIndex == 0 ? "demo_table" : "demo_table_b";
      }
      if (lower.contains("timelimit") || lower.contains("limit") || lower.contains("count") || lower.contains("sort")) {
        return variantIndex == 0 ? 7 : 14;
      }
      if ("sql".equals(lower)) {
        return variantIndex == 0 ? "update demo_table set status = 1" : "delete from demo_table_b where id = 2";
      }
      return variantIndex == 0 ? "RAW_VALUE" : "RAW_VALUE_B";
    }

    if (lower.contains("date")) {
      return variantIndex == 0 ? "2026-05-14" : "2026-06-01";
    }
    if (lower.contains("time")) {
      return variantIndex == 0 ? "2026-05-14 10:00:00" : "2026-06-01 18:30:00";
    }
    if (lower.contains("status") || lower.contains("state") || lower.contains("count") || lower.contains("flag")
        || lower.contains("sort") || lower.contains("times") || lower.contains("timelimit")) {
      return variantIndex == 0 ? 1 : 2;
    }
    if (isNumericIdProperty(lower)) {
      return variantIndex == 0 ? 1001L : 2002L;
    }
    if (lower.contains("code")) {
      return variantIndex == 0 ? "CODE_001" : "CODE_002";
    }
    if (lower.contains("name")) {
      return variantIndex == 0 ? "NAME_001" : "NAME_002";
    }
    if (lower.contains("title") || lower.contains("subject") || lower.contains("topic")) {
      return variantIndex == 0 ? "TITLE_001" : "TITLE_002";
    }
    if (lower.contains("sql")) {
      return variantIndex == 0 ? "SQL_001" : "SQL_002";
    }
    return variantIndex == 0 ? "VALUE_001" : "VALUE_002";
  }

  private boolean isNumericIdProperty(String lower) {
    if (!lower.contains("id")) {
      return false;
    }
    return !lower.contains("openid") && !lower.contains("appid") && !lower.contains("code");
  }

  private StatementMeta analyzeStatement(Element statement) {
    StatementMeta meta = new StatementMeta(statement.getAttribute("id"), statement.getTagName(),
        isScalarParameter(statement.getAttribute("parameterClass")));
    collectMeta(statement, false, meta);
    return meta;
  }

  private void collectMeta(Node node, boolean insideDynamic, StatementMeta meta) {
    if (node.getNodeType() == Node.TEXT_NODE || node instanceof CDATASection) {
      collectPlaceholders(node.getNodeValue(), insideDynamic, meta);
      return;
    }

    if (!(node instanceof Element)) {
      return;
    }

    Element element = (Element) node;
    boolean isDynamicTag = IbatisXmlSupport.isDynamicTag(element.getTagName());
    if (isDynamicTag) {
      String property = normalizePropertyName(element.getAttribute("property"));
      if (!property.isEmpty()) {
        meta.dynamicProperties.add(property);
        if ("isEmpty".equals(element.getTagName())) {
          meta.emptyBranchProperties.add(property);
        }
        if ("iterate".equals(element.getTagName())) {
          meta.iterateProperties.add(property);
        }
      }
    }

    NodeList children = element.getChildNodes();
    for (int index = 0; index < children.getLength(); index++) {
      collectMeta(children.item(index), insideDynamic || isDynamicTag, meta);
    }
  }

  private void collectPlaceholders(String text, boolean insideDynamic, StatementMeta meta) {
    if (text == null || text.trim().isEmpty()) {
      return;
    }
    Matcher matcher = IbatisXmlSupport.PLACEHOLDER_PATTERN.matcher(text);
    while (matcher.find()) {
      char marker = matcher.group(1).charAt(0);
      String property = normalizePropertyName(IbatisXmlSupport.extractPlaceholderExpression(matcher));
      meta.placeholders.put(property, new Placeholder(property, marker));
      if (!insideDynamic) {
        meta.requiredOutsideDynamic.add(property);
      }
    }
  }

  private String normalizePropertyName(String name) {
    if (name == null) {
      return "";
    }
    String normalized = name.replace("[]", "").trim();
    int dotIndex = normalized.lastIndexOf('.');
    if (dotIndex >= 0 && dotIndex < normalized.length() - 1) {
      normalized = normalized.substring(dotIndex + 1);
    }
    return normalized;
  }

  private boolean isScalarParameter(String parameterClass) {
    if (parameterClass == null) {
      return false;
    }
    String lower = parameterClass.toLowerCase(Locale.ROOT);
    return lower.contains("string") || lower.contains("long") || lower.contains("integer");
  }

  private Document parseDocument(String text) throws Exception {
    DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
    factory.setFeature(XMLConstants.FEATURE_SECURE_PROCESSING, true);
    factory.setFeature("http://apache.org/xml/features/nonvalidating/load-external-dtd", false);
    factory.setFeature("http://xml.org/sax/features/external-general-entities", false);
    factory.setFeature("http://xml.org/sax/features/external-parameter-entities", false);
    factory.setNamespaceAware(false);
    return factory.newDocumentBuilder().parse(new org.xml.sax.InputSource(new java.io.StringReader(text)));
  }

  private String toXml(Element element) throws Exception {
    TransformerFactory factory = TransformerFactory.newInstance();
    Transformer transformer = factory.newTransformer();
    transformer.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "yes");
    transformer.setOutputProperty(OutputKeys.INDENT, "yes");
    StringWriter writer = new StringWriter();
    transformer.transform(new DOMSource(element), new StreamResult(writer));
    return writer.toString().trim();
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

  private static final class StatementMeta {
    private final String statementId;
    private final String statementType;
    private final boolean scalarParameter;
    private final Map<String, Placeholder> placeholders = new LinkedHashMap<>();
    private final Set<String> dynamicProperties = new LinkedHashSet<>();
    private final Set<String> emptyBranchProperties = new LinkedHashSet<>();
    private final Set<String> iterateProperties = new LinkedHashSet<>();
    private final Set<String> requiredOutsideDynamic = new LinkedHashSet<>();

    private StatementMeta(String statementId, String statementType, boolean scalarParameter) {
      this.statementId = statementId;
      this.statementType = statementType;
      this.scalarParameter = scalarParameter;
    }

    private boolean hasEmptyBranch() {
      return !emptyBranchProperties.isEmpty();
    }

    private boolean hasOptionalDynamicBranch() {
      if (hasEmptyBranch()) {
        return true;
      }
      for (String property : dynamicProperties) {
        if (!requiredOutsideDynamic.contains(property)) {
          return true;
        }
      }
      return false;
    }

    private String defaultCaseName() {
      if (!dynamicProperties.isEmpty()) {
        return "动态条件命中";
      }
      if (!placeholders.isEmpty()) {
        return "基础参数命中";
      }
      return "无参基础场景";
    }

    private String defaultAssertionPoint() {
      if (!dynamicProperties.isEmpty()) {
        return "传入动态变量，验证最终 SQL 正常展开";
      }
      if (!placeholders.isEmpty()) {
        return "传入基础变量，验证最终 SQL 正常生成";
      }
      return "不传参数，验证固定 SQL 可直接生成";
    }
  }

  private static final class Placeholder {
    private final String name;
    private final char marker;

    private Placeholder(String name, char marker) {
      this.name = name;
      this.marker = marker;
    }
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