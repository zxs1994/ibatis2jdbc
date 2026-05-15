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
import java.util.Arrays;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static com.blackbox.ibatis2jdbc.TestSupport.listOf;
import static org.junit.jupiter.api.Assertions.assertTrue;

class SqlMapXmlReportTest {
  private static final String RESOURCE_PROPERTY = "sqlmap.resource";
  private static final String REPORT_PROPERTY = "sqlmap.report";
  private static final Pattern DOCTYPE_PATTERN = Pattern.compile("(?is)<!DOCTYPE[^>]*>");
  private static final Pattern PLACEHOLDER_PATTERN = Pattern.compile("([#$])([\\w.\\[\\]]+)\\1");
  private static final List<String> STATEMENT_TAGS = Arrays.asList("select", "insert", "update", "delete", "statement");
  private static final List<String> DYNAMIC_TAGS = Arrays.asList("isNotEmpty", "isEmpty", "iterate", "dynamic", "trim");

  private IbatisToJdbcConverter converter;
  private String xml;
  private String sqlMapResource;
  private String sqlMapFileName;
  private Path reportPath;

  @BeforeEach
  void setUp() throws IOException {
    converter = new IbatisToJdbcConverter();
    sqlMapResource = normalizeResourcePath(System.getProperty(RESOURCE_PROPERTY, "/online_sqlmaps/hr_sqlmap.xml"));
    sqlMapFileName = extractFileName(sqlMapResource);
    reportPath = resolveReportPath(sqlMapFileName, System.getProperty(REPORT_PROPERTY));
    xml = stripDoctype(TestSupport.readResource(SqlMapXmlReportTest.class, sqlMapResource));
  }

  @Test
  void generateDynamicSqlReport() throws Exception {
    Document document = parseDocument(xml);
    List<StatementCase> cases = collectCases(document);
    List<CaseResult> results = new ArrayList<>();
    List<String> failures = new ArrayList<>();

    for (StatementCase statementCase : cases) {
      try {
        ConvertedSql convertedSql = converter.convert(xml, statementCase.statementId, statementCase.parameters);
        String finalSql = convertedSql.sql();
        assertTrue(finalSql != null && !finalSql.trim().isEmpty(), statementCase.statementId + " generated blank SQL");
        assertTrue(!finalSql.contains("<isNotEmpty") && !finalSql.contains("<isEmpty")
            && !finalSql.contains("<iterate") && !finalSql.contains("<![CDATA["),
            statementCase.statementId + " still contains XML/dynamic tags");
        results.add(CaseResult.success(statementCase, convertedSql.statementType(), finalSql));
      } catch (Throwable throwable) {
        failures.add(statementCase.statementId + " [" + statementCase.caseName + "]: " + throwable.getMessage());
        results.add(CaseResult.failure(statementCase, throwable));
      }
    }

    writeReport(results);
    assertTrue(failures.isEmpty(), "Statement failures:\n" + String.join("\n", failures));
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
      if (!STATEMENT_TAGS.contains(statement.getTagName())) {
        continue;
      }

      StatementMeta meta = analyzeStatement(statement);
      String originalXml = toXml(statement);
      Object activeParametersA = buildParameters(meta, true, 0);
      cases.add(new StatementCase(meta.statementId, meta.defaultCaseName("A"), meta.defaultAssertionPoint(),
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
    boolean isDynamicTag = DYNAMIC_TAGS.contains(element.getTagName());
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
    Matcher matcher = PLACEHOLDER_PATTERN.matcher(text);
    while (matcher.find()) {
      char marker = matcher.group(1).charAt(0);
      String property = normalizePropertyName(matcher.group(2));
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

  private void writeReport(List<CaseResult> results) throws IOException {
    StringBuilder builder = new StringBuilder();
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
    builder.append("- 补充场景：带 isEmpty 的 statement 额外增加空分支用例\n");
    builder.append("- 用例数：").append(results.size()).append("\n");
    builder.append("- 通过：").append(passed).append("\n");
    builder.append("- 失败：").append(failed).append("\n\n");

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
        builder.append("- 错误：\n\n```text\n").append(result.errorMessage).append("\n```\n\n");
      }
    }

    Files.write(reportPath, builder.toString().getBytes(StandardCharsets.UTF_8));
  }

  private String normalizeResourcePath(String value) {
    if (value == null || value.trim().isEmpty()) {
      return "/online_sqlmaps/hr_sqlmap.xml";
    }
    String trimmed = value.trim();
    return trimmed.startsWith("/") ? trimmed : "/" + trimmed;
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

  private String stripDoctype(String content) {
    return DOCTYPE_PATTERN.matcher(content).replaceAll("");
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

    private String defaultCaseName(String suffix) {
      if (!dynamicProperties.isEmpty()) {
        return "动态条件命中-" + suffix;
      }
      if (!placeholders.isEmpty()) {
        return "基础参数命中-" + suffix;
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

    private static CaseResult failure(StatementCase statementCase, Throwable throwable) {
      return new CaseResult(statementCase.statementId, statementCase.caseName, statementCase.statementType,
          statementCase.assertionPoint, stringify(statementCase.parameters), false, statementCase.originalXml,
          null, throwable.toString());
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
      return "  ".repeat(Math.max(0, depth));
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