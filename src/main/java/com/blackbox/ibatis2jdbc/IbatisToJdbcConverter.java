package com.blackbox.ibatis2jdbc;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import javax.xml.XMLConstants;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.StringReader;
import java.lang.reflect.Array;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.xml.sax.InputSource;

public class IbatisToJdbcConverter {
  private static final Pattern CDATA_OPERATOR_PATTERN = Pattern.compile("<!\\[CDATA\\[(\\W+)]]>");
  private static final Pattern PLACEHOLDER_PATTERN = Pattern.compile("([#$])([\\w.\\[\\]]+)\\1");

  public ConvertedSql convert(String xml, String statementId, Object parameters) {
    Objects.requireNonNull(xml, "xml");
    String normalizedXml = preprocessXml(xml);

    try {
      DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
      factory.setFeature(XMLConstants.FEATURE_SECURE_PROCESSING, true);
      factory.setNamespaceAware(false);

      Document document = factory.newDocumentBuilder().parse(new InputSource(new StringReader(normalizedXml)));
      Element statement = findStatement(document, statementId);
      if (statement == null) {
        throw new IllegalArgumentException("Cannot find statement: " + statementId);
      }
      String statementType = statement.getTagName();
      String resultClass = statement.getAttribute("resultClass");

      // 所有参数均内联为字面量,直接输出最终SQL
      if (parameters instanceof Map) {
        @SuppressWarnings("unchecked")
        Map<String, Object> paramMap = (Map<String, Object>) parameters;
        String sql = renderNode(statement, RenderContext.inline(paramMap));
        return new ConvertedSql(normalizeSql(postprocessSql(sql)), parameters, statementType, resultClass);
      } else if (parameters instanceof List<?>) {
        List<?> list = (List<?>) parameters;
        String sql = renderNode(statement, RenderContext.inline(buildListContext(list)));
        return new ConvertedSql(normalizeSql(postprocessSql(sql)), parameters, statementType, resultClass);
      } else {
        String sql = renderNode(statement, RenderContext.inlineScalar(parameters));
        return new ConvertedSql(normalizeSql(postprocessSql(sql)), parameters, statementType, resultClass);
      }
    } catch (Exception exception) {
      throw new IllegalStateException("Failed to convert iBatis XML", exception);
    }
  }

  public ConvertedSql convertForExecution(String xml, String statementId, Object parameters) {
    Objects.requireNonNull(xml, "xml");
    String normalizedXml = preprocessXml(xml);
    try {
      DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
      factory.setFeature(XMLConstants.FEATURE_SECURE_PROCESSING, true);
      factory.setNamespaceAware(false);
      Document document = factory.newDocumentBuilder().parse(new InputSource(new StringReader(normalizedXml)));
      Element statement = findStatement(document, statementId);
      if (statement == null) {
        throw new IllegalArgumentException("Cannot find statement: " + statementId);
      }
      String statementType = statement.getTagName();
      String resultClass = statement.getAttribute("resultClass");
      List<Object> executionParams = new ArrayList<>();
      if (parameters instanceof Map) {
        @SuppressWarnings("unchecked")
        Map<String, Object> paramMap = (Map<String, Object>) parameters;
        String sql = renderNode(statement, RenderContext.execution(paramMap, executionParams));
        return new ConvertedSql(normalizeSql(postprocessSql(sql)), executionParams, statementType, resultClass);
      } else if (parameters instanceof List<?>) {
        List<?> list = (List<?>) parameters;
        String sql = renderNode(statement, RenderContext.execution(buildListContext(list), executionParams));
        return new ConvertedSql(normalizeSql(postprocessSql(sql)), executionParams, statementType, resultClass);
      } else {
        String sql = renderNode(statement, RenderContext.executionScalar(parameters, executionParams));
        return new ConvertedSql(normalizeSql(postprocessSql(sql)), executionParams, statementType, resultClass);
      }
    } catch (Exception exception) {
      throw new IllegalStateException("Failed to convert iBatis XML", exception);
    }
  }

  private Element findStatement(Document document, String statementId) {
    if (isBlank(statementId)) {
      return document.getDocumentElement();
    }

    NodeList nodes = document.getElementsByTagName("*");
    for (int index = 0; index < nodes.getLength(); index++) {
      Node node = nodes.item(index);
      if (node instanceof Element) {
        Element element = (Element) node;
        if (statementId.equals(element.getAttribute("id"))) {
          return element;
        }
      }
    }

    return null;
  }

  private String preprocessXml(String xml) {
    return xml;
  }

  private String postprocessSql(String sql) {
    if (sql == null) {
      return "";
    }
    sql = sql.replaceAll("，", ",").trim();
    return CDATA_OPERATOR_PATTERN.matcher(sql).replaceAll("$1");
  }

  private String renderNode(Node node, RenderContext context) {
    if (node.getNodeType() == Node.TEXT_NODE || node.getNodeType() == Node.CDATA_SECTION_NODE) {
      return renderText(node.getNodeValue(), context);
    }

    if (node.getNodeType() != Node.ELEMENT_NODE) {
      return "";
    }

    Element element = (Element) node;
    String tagName = element.getTagName();

    if (isContainerTag(tagName)) {
      return renderChildren(element, context);
    }

    if ("isNotEmpty".equals(tagName)) {
      if (!shouldRender(element, context))
        return "";
      String prepend = element.getAttribute("prepend");
      String body = renderChildren(element, context);
      return isBlank(prepend) ? body : prepend.trim() + " " + body;
    }

    if ("isEmpty".equals(tagName)) {
      if (shouldRender(element, context))
        return "";
      String prepend = element.getAttribute("prepend");
      String body = renderChildren(element, context);
      return isBlank(prepend) ? body : prepend.trim() + " " + body;
    }

    if ("iterate".equals(tagName)) {
      return renderIterate(element, context);
    }

    if ("dynamic".equals(tagName) || "trim".equals(tagName)) {
      String body = renderChildren(element, context);
      if (isBlank(body)) {
        return "";
      }
      String prepend = element.getAttribute("prepend");
      String suffixOverrides = element.getAttribute("suffixOverrides");
      if (!isBlank(suffixOverrides)) {
        body = stripSuffixOverrides(body, suffixOverrides);
      } else if ("SET".equalsIgnoreCase(prepend)) {
        body = stripTrailingComma(body);
      }
      if (!isBlank(prepend)) {
        return prepend.trim() + " " + stripLeadingConjunction(body);
      }
      return body;
    }

    return renderChildren(element, context);
  }

  private boolean isContainerTag(String tagName) {
    return "sqlMap".equals(tagName)
        || "mapper".equals(tagName)
        || "select".equals(tagName)
        || "insert".equals(tagName)
        || "update".equals(tagName)
        || "delete".equals(tagName)
        || "statement".equals(tagName);
  }

  private String renderChildren(Element element, RenderContext context) {
    StringBuilder builder = new StringBuilder();
    NodeList children = element.getChildNodes();
    for (int index = 0; index < children.getLength(); index++) {
      builder.append(renderNode(children.item(index), context));
    }
    return builder.toString();
  }

  private boolean shouldRender(Element element, RenderContext context) {
    String property = element.getAttribute("property");
    Object value = resolveExpression(property, context);
    return hasValue(value);
  }

  private String renderIterate(Element element, RenderContext context) {
    String property = element.getAttribute("property");
    Object value = resolveExpression(property, context);
    List<Object> items = asList(value);
    String open = element.getAttribute("open");
    String close = element.getAttribute("close");
    String conjunction = element.getAttribute("conjunction");

    if (items.isEmpty()) {
      // Keep generated SQL valid across databases for IN ()-like constructs.
      return open + "null" + close;
    }

    List<String> fragments = new ArrayList<>();
    for (int index = 0; index < items.size(); index++) {
      Object item = items.get(index);
      RenderContext itemContext = context.forIteration(property, item, index);
      fragments.add(renderChildren(element, itemContext).trim());
    }

    String joined = String.join(conjunction.isEmpty() ? "," : conjunction, fragments);
    return open + joined + close;
  }

  private String renderText(String text, RenderContext context) {
    if (text == null || text.isEmpty()) {
      return "";
    }

    Matcher matcher = PLACEHOLDER_PATTERN.matcher(text);
    StringBuffer buffer = new StringBuffer();
    while (matcher.find()) {
      String marker = matcher.group(1);
      String expression = matcher.group(2).trim();
      Object value = resolvePlaceholder(expression, context);
      if ("$".equals(marker)) {
        // iBatis $...$ is raw text substitution, not prepared-statement binding.
        matcher.appendReplacement(buffer, Matcher.quoteReplacement(toSqlRawText(value)));
      } else if (context.inlineMode) {
        matcher.appendReplacement(buffer, Matcher.quoteReplacement(toSqlLiteral(value)));
      } else {
        context.executionParams.add(value);
        matcher.appendReplacement(buffer, "?");
      }
    }
    matcher.appendTail(buffer);
    return buffer.toString();
  }

  private String toSqlLiteral(Object value) {
    if (value == null) {
      return "null";
    }
    if (value instanceof Number || value instanceof Boolean) {
      return value.toString();
    }
    String text = String.valueOf(value).replace("'", "''");
    return "'" + text + "'";
  }

  private String toSqlRawText(Object value) {
    if (value == null) {
      return "null";
    }
    return String.valueOf(value);
  }

  private Object resolvePlaceholder(String expression, RenderContext context) {
    if (context.iterationProperty != null) {
      String normalizedExpression = expression.replace("[]", "");
      if (normalizedExpression.equals(context.iterationProperty)) {
        return context.iterationValue;
      }
    }

    return resolveExpression(expression, context);
  }

  private Object resolveExpression(String expression, RenderContext context) {
    if (isBlank(expression)) {
      return null;
    }

    Object current = context.parameters.get(expression);
    if (current != null) {
      return current;
    }

    if (context.iterationProperty != null) {
      String normalizedExpression = expression.replace("[]", "");
      if (normalizedExpression.equals(context.iterationProperty)) {
        return context.iterationValue;
      }
    }

    String[] parts = expression.split("\\.");
    Object value = context.parameters.get(parts[0]);
    for (int index = 1; index < parts.length && value != null; index++) {
      value = readProperty(value, parts[index]);
    }
    return value != null ? value : context.defaultValue;
  }

  private Object readProperty(Object target, String name) {
    if (target instanceof Map<?, ?>) {
      Map<?, ?> map = (Map<?, ?>) target;
      return map.get(name);
    }

    try {
      String suffix = Character.toUpperCase(name.charAt(0)) + name.substring(1);
      for (String methodName : Arrays.asList("get" + suffix, "is" + suffix)) {
        try {
          Method method = target.getClass().getMethod(methodName);
          return method.invoke(target);
        } catch (NoSuchMethodException ignored) {
          // Try next lookup.
        }
      }

      Field field = target.getClass().getDeclaredField(name);
      field.setAccessible(true);
      return field.get(target);
    } catch (Exception exception) {
      return null;
    }
  }

  private boolean hasValue(Object value) {
    if (value == null) {
      return false;
    }

    if (value instanceof CharSequence) {
      CharSequence sequence = (CharSequence) value;
      return !sequence.toString().trim().isEmpty();
    }

    if (value instanceof Collection<?>) {
      Collection<?> collection = (Collection<?>) value;
      return !collection.isEmpty();
    }

    if (value instanceof Map<?, ?>) {
      Map<?, ?> map = (Map<?, ?>) value;
      return !map.isEmpty();
    }

    if (value instanceof Optional<?>) {
      Optional<?> optional = (Optional<?>) value;
      return optional.isPresent();
    }

    if (value.getClass().isArray()) {
      return Array.getLength(value) > 0;
    }

    return true;
  }

  private List<Object> asList(Object value) {
    if (value == null) {
      return Collections.emptyList();
    }

    if (value instanceof Collection<?>) {
      Collection<?> collection = (Collection<?>) value;
      return new ArrayList<Object>(collection);
    }

    if (value.getClass().isArray()) {
      int length = Array.getLength(value);
      List<Object> items = new ArrayList<>(length);
      for (int index = 0; index < length; index++) {
        items.add(Array.get(value, index));
      }
      return items;
    }

    return Collections.singletonList(value);
  }

  private boolean isBlank(String value) {
    return value == null || value.trim().isEmpty();
  }

  private String normalizeSql(String sql) {
    return sql == null ? "" : sql.replaceAll("\\s+", " ").trim();
  }

  private String stripLeadingConjunction(String sql) {
    String trimmed = sql.trim();
    String upper = trimmed.toUpperCase(Locale.ROOT);
    if (upper.startsWith("AND ")) {
      return trimmed.substring(4).trim();
    }
    if (upper.startsWith("OR ")) {
      return trimmed.substring(3).trim();
    }
    if (upper.startsWith("WHERE ")) {
      return trimmed.substring(6).trim();
    }
    return trimmed;
  }

  private String stripTrailingComma(String sql) {
    String trimmed = sql.trim();
    if (trimmed.endsWith(",")) {
      return trimmed.substring(0, trimmed.length() - 1).trim();
    }
    return trimmed;
  }

  private String stripSuffixOverrides(String sql, String suffixOverrides) {
    String result = sql.trim();
    for (String override : suffixOverrides.split("\\|")) {
      String token = override.trim();
      if (token.isEmpty()) {
        continue;
      }
      while (result.endsWith(token)) {
        result = result.substring(0, result.length() - token.length()).trim();
      }
    }
    return result;
  }

  private Map<String, Object> buildListContext(List<?> list) {
    Map<String, Object> context = new LinkedHashMap<>();
    context.put("ids", list);
    context.put("list", list);
    return context;
  }

  private static final class RenderContext {
    private final Map<String, Object> parameters;
    private final Object defaultValue;
    private final boolean inlineMode;
    private final List<Object> executionParams;
    private final String iterationProperty;
    private final Object iterationValue;
    private final int iterationIndex;

    private static RenderContext inline(Map<String, Object> parameters) {
      return new RenderContext(parameters, null, true, null, null, null, -1);
    }

    private static RenderContext inlineScalar(Object scalarValue) {
      return new RenderContext(Collections.emptyMap(), scalarValue, true, null, null, null, -1);
    }

    private static RenderContext execution(Map<String, Object> parameters, List<Object> executionParams) {
      return new RenderContext(parameters, null, false, executionParams, null, null, -1);
    }

    private static RenderContext executionScalar(Object scalarValue, List<Object> executionParams) {
      return new RenderContext(Collections.emptyMap(), scalarValue, false, executionParams, null, null, -1);
    }

    private RenderContext(Map<String, Object> parameters, Object defaultValue, boolean inlineMode,
        List<Object> executionParams, String iterationProperty, Object iterationValue, int iterationIndex) {
      this.parameters = parameters;
      this.defaultValue = defaultValue;
      this.inlineMode = inlineMode;
      this.executionParams = executionParams;
      this.iterationProperty = iterationProperty;
      this.iterationValue = iterationValue;
      this.iterationIndex = iterationIndex;
    }

    private RenderContext forIteration(String property, Object value, int iterationIndex) {
      return new RenderContext(parameters, defaultValue, inlineMode, executionParams, property, value, iterationIndex);
    }
  }
}
