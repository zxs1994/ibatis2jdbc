package com.blackbox.ibatis2jdbc;

import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class TestParameterUtils {
  private static final Pattern PLACEHOLDER_PATTERN = IbatisXmlSupport.PLACEHOLDER_PATTERN;
  private static final Pattern ITERATE_PROPERTY_PATTERN = Pattern.compile(
      "<\\s*iterate\\b[^>]*\\bproperty\\s*=\\s*\"([^\"]+)\"",
      Pattern.CASE_INSENSITIVE);

  public static class StatementMeta {
    public final String statementId;
    public final String statementType;
    public final boolean scalarParameter;
    public String originalXml;
    public final Map<String, Placeholder> placeholders = new LinkedHashMap<>();
    public final Set<String> dynamicProperties = new LinkedHashSet<>();
    public final Set<String> emptyBranchProperties = new LinkedHashSet<>();
    public final Set<String> iterateProperties = new LinkedHashSet<>();
    public final Set<String> requiredOutsideDynamic = new LinkedHashSet<>();

    public StatementMeta(String statementId, String statementType, boolean scalarParameter) {
      this.statementId = statementId;
      this.statementType = statementType;
      this.scalarParameter = scalarParameter;
      this.originalXml = "";
    }
  }

  public static class Placeholder {
    public final String name;
    public final char marker;

    public Placeholder(String name, char marker) {
      this.name = name;
      this.marker = marker;
    }
  }

  public static StatementMeta resolveStatementMeta(IbatisToJdbcConverter.LoadedStatementInfo info) {
    String statementXml = info.getSqlMapXml() == null ? "" : info.getSqlMapXml();
    StatementMeta meta = new StatementMeta(
        info.getStatementId(),
        detectStatementType(statementXml),
        isScalarParameterClass(info.getParameterClass()));
    meta.originalXml = statementXml;

    Matcher placeholderMatcher = PLACEHOLDER_PATTERN.matcher(statementXml);
    while (placeholderMatcher.find()) {
      String markerText = placeholderMatcher.group(1);
      String expression = firstNonBlank(IbatisXmlSupport.extractPlaceholderExpression(placeholderMatcher));
      if (expression.isEmpty())
        continue;
      String property = normalizePropertyName(expression);
      if (property.isEmpty())
        continue;
      char marker = markerText == null || markerText.isEmpty() ? '#' : markerText.charAt(0);
      meta.placeholders.putIfAbsent(property, new Placeholder(property, marker));
    }
    Matcher iterateMatcher = ITERATE_PROPERTY_PATTERN.matcher(statementXml);
    while (iterateMatcher.find()) {
      String iterateProperty = normalizePropertyName(iterateMatcher.group(1));
      if (!iterateProperty.isEmpty()) {
        meta.iterateProperties.add(iterateProperty);
      }
    }
    return meta;
  }

  public static boolean isScalarParameterClass(String parameterClass) {
    if (parameterClass == null || parameterClass.trim().isEmpty()) {
      return false;
    }
    String normalized = parameterClass.trim();
    String lower = normalized.toLowerCase(Locale.ROOT);
    return "java.lang.string".equals(lower)
        || "string".equals(lower)
        || "java.lang.long".equals(lower)
        || "long".equals(lower)
        || "java.lang.integer".equals(lower)
        || "integer".equals(lower)
        || "java.lang.short".equals(lower)
        || "short".equals(lower)
        || "java.lang.byte".equals(lower)
        || "byte".equals(lower)
        || "java.lang.double".equals(lower)
        || "double".equals(lower)
        || "java.lang.float".equals(lower)
        || "float".equals(lower)
        || "java.lang.boolean".equals(lower)
        || "boolean".equals(lower)
        || "java.lang.character".equals(lower)
        || "character".equals(lower);
  }

  public static Object buildParameters(StatementMeta meta, boolean includeOptional, int variantIndex) {
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

  private static Object sampleScalarValue(StatementMeta meta, int variantIndex) {
    // 根据 parameterClass 类型返回对应类型的样例值
    String paramClass = null;
    if (meta != null && meta.originalXml != null) {
      // 尝试从 XML 中提取 parameterClass 属性
      String xml = meta.originalXml;
      int idx = xml.indexOf("parameterClass=");
      if (idx >= 0) {
        int start = xml.indexOf('"', idx);
        int end = start > 0 ? xml.indexOf('"', start + 1) : -1;
        if (start > 0 && end > start) {
          paramClass = xml.substring(start + 1, end).trim();
        }
      }
    }
    if (paramClass != null) {
      String lower = paramClass.toLowerCase(Locale.ROOT);
      if (lower.contains("long")) {
        return variantIndex == 0 ? 1001L : 2002L;
      }
      if (lower.contains("int")) {
        return variantIndex == 0 ? 1001 : 2002;
      }
      if (lower.contains("double")) {
        return variantIndex == 0 ? 1.23 : 4.56;
      }
      if (lower.contains("float")) {
        return variantIndex == 0 ? 1.23f : 4.56f;
      }
      if (lower.contains("boolean")) {
        return variantIndex == 0 ? true : false;
      }
      if (lower.contains("short")) {
        return variantIndex == 0 ? (short) 12 : (short) 34;
      }
      if (lower.contains("byte")) {
        return variantIndex == 0 ? (byte) 1 : (byte) 2;
      }
      if (lower.contains("char")) {
        return variantIndex == 0 ? 'A' : 'B';
      }
      // 只要不是数字类型都用字符串
    }
    return variantIndex == 0 ? "VALUE_001" : "VALUE_002";
  }

  private static Object sampleValue(String property, char marker, boolean iterate, int variantIndex) {
    String lower = property.toLowerCase(Locale.ROOT);
    if (iterate) {
      return variantIndex == 0 ? Arrays.asList("EVENT_A", "EVENT_B") : Arrays.asList("EVENT_X", "EVENT_Y", "EVENT_Z");
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

  private static boolean isNumericIdProperty(String lower) {
    if (!lower.contains("id")) {
      return false;
    }
    return !lower.contains("openid") && !lower.contains("appid") && !lower.contains("code");
  }

  private static String detectStatementType(String statementXml) {
    Pattern XML_TAG_PATTERN = Pattern.compile("<\\s*([A-Za-z][\\w:-]*)");
    Matcher matcher = XML_TAG_PATTERN.matcher(statementXml == null ? "" : statementXml);
    if (matcher.find()) {
      return matcher.group(1).toLowerCase(Locale.ROOT);
    }
    return "unknown";
  }

  private static String firstNonBlank(String... values) {
    if (values == null) {
      return "";
    }
    for (String value : values) {
      if (value != null && !value.trim().isEmpty()) {
        return value.trim();
      }
    }
    return "";
  }

  private static String normalizePropertyName(String name) {
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

  /**
   * 根据动态参数（如 isNotEmpty、iterate）生成所有分支参数组合（幂集），用于全分支测试。
   * 每个动态参数会生成“有值/无值”两种情况，iterate 还会生成空/非空集合。
   */
  public static List<Map<String, Object>> generateAllDynamicParameterVariants(StatementMeta meta) {
    List<String> dynamicProps = new ArrayList<>(meta.dynamicProperties);
    List<String> iterateProps = new ArrayList<>(meta.iterateProperties);
    List<Map<String, Object>> variants = new ArrayList<>();
    int n = dynamicProps.size();
    int iterateN = iterateProps.size();

    // 幂集枚举所有动态参数的有/无组合
    int total = 1 << n;
    for (int mask = 0; mask < total; mask++) {
      Map<String, Object> param = new LinkedHashMap<>();
      // 先填充所有占位符默认值
      for (Placeholder ph : meta.placeholders.values()) {
        String property = normalizePropertyName(ph.name);
        boolean isIterate = meta.iterateProperties.contains(property);
        param.put(property, sampleValue(property, ph.marker, isIterate, 0));
      }
      // 动态参数有/无
      for (int i = 0; i < n; i++) {
        String prop = dynamicProps.get(i);
        boolean present = ((mask >> i) & 1) == 1;
        boolean isIterate = meta.iterateProperties.contains(prop);
        if (present) {
          param.put(prop, sampleValue(prop, '#', isIterate, 0));
        } else {
          param.put(prop, isIterate ? new ArrayList<>() : "");
        }
      }
      // iterate 分支：对每个 iterate 属性再生成一个“空集合”分支
      if (iterateN > 0) {
        // 2^iterateN 个分支
        int iterateTotal = 1 << iterateN;
        for (int imask = 0; imask < iterateTotal; imask++) {
          Map<String, Object> paramCopy = new LinkedHashMap<>(param);
          for (int j = 0; j < iterateN; j++) {
            String iprop = iterateProps.get(j);
            boolean nonEmpty = ((imask >> j) & 1) == 1;
            if (nonEmpty) {
              paramCopy.put(iprop, sampleValue(iprop, '#', true, 0));
            } else {
              paramCopy.put(iprop, new ArrayList<>());
            }
          }
          variants.add(paramCopy);
        }
      } else {
        variants.add(param);
      }
    }
    return variants;
  }
}
