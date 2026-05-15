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

import org.xml.sax.InputSource;

public class IbatisToJdbcConverter {
  // 生成可直接查看/排查的最终 SQL，# 会被内联成字面量。
  public ConvertedSql convert(String xml, String statementId, Object parameters) {
    return convertInternal(xml, statementId, parameters, true);
  }

  // 生成可执行的 JDBC SQL，# 会替换为 ?，并收集对应参数列表。
  public ConvertedSql convertForExecution(String xml, String statementId, Object parameters) {
    return convertInternal(xml, statementId, parameters, false);
  }

  private ConvertedSql convertInternal(String xml, String statementId, Object parameters, boolean inlineMode) {
    Objects.requireNonNull(xml, "xml");
    // 预留 XML 预处理钩子，后续如果需要统一剥离 DOCTYPE、命名空间或做兼容修复，可集中放在这里。
    String normalizedXml = preprocessXml(xml);

    try {
      // 这里按 DOM 解析而不是直接做字符串替换，是因为动态标签、本体文本、CDATA 都需要结构化遍历。
      DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
      factory.setFeature(XMLConstants.FEATURE_SECURE_PROCESSING, true);
      factory.setNamespaceAware(false);

      Document document = factory.newDocumentBuilder().parse(new InputSource(new StringReader(normalizedXml)));
      // statementId 对应 XML 中的 <select>/<update>/... 节点，后续所有渲染都以该节点为根展开。
      Element statement = findStatement(document, statementId);
      if (statement == null) {
        throw new IllegalArgumentException("Cannot find statement: " + statementId);
      }
      Map<String, Element> sqlFragments = collectSqlFragments(document);
      Map<String, Map<String, String>> resultMaps = collectResultMaps(document);
      String statementType = statement.getTagName();
      String resultClass = statement.getAttribute("resultClass");
      String resultMapId = normalizeResultMapId(statement.getAttribute("resultMap"), resultMaps);

      List<Object> executionParams = inlineMode ? null : new ArrayList<>();
      RenderContext renderContext;
      Object convertedParameters;

      // List 参数在 iBatis 的 iterate 语义里通常以 ids/list 两个入口被访问，
      // 这里先统一包装成 Map，再复用同一套属性解析逻辑。
      // inline 模式返回原始参数，execution 模式返回 JDBC 参数列表。
      if (parameters instanceof Map) {
        @SuppressWarnings("unchecked")
        Map<String, Object> paramMap = (Map<String, Object>) parameters;
        renderContext = inlineMode
            ? RenderContext.inline(paramMap, sqlFragments, resultMaps)
            : RenderContext.execution(paramMap, executionParams, sqlFragments, resultMaps);
        convertedParameters = inlineMode ? parameters : executionParams;
      } else if (parameters instanceof Collection<?> || (parameters != null && parameters.getClass().isArray())) {
        Map<String, Object> collectionContext = buildCollectionContext(parameters);
        renderContext = inlineMode
            ? RenderContext.inline(collectionContext, sqlFragments, resultMaps)
            : RenderContext.execution(collectionContext, executionParams, sqlFragments, resultMaps);
        convertedParameters = inlineMode ? parameters : executionParams;
      } else if (isSimpleParameterValue(parameters)) {
        renderContext = inlineMode
            ? RenderContext.inlineScalar(parameters, sqlFragments, resultMaps)
            : RenderContext.executionScalar(parameters, executionParams, sqlFragments, resultMaps);
        convertedParameters = inlineMode ? parameters : executionParams;
      } else {
        renderContext = inlineMode
            ? RenderContext.inlineBean(parameters, sqlFragments, resultMaps)
            : RenderContext.executionBean(parameters, executionParams, sqlFragments, resultMaps);
        convertedParameters = inlineMode ? parameters : executionParams;
      }

      // renderNode 会递归展开动态标签和占位符，最后得到一条纯 SQL 字符串。
      String sql = renderNode(statement, renderContext);
        return new ConvertedSql(normalizeSql(postprocessSql(sql)), convertedParameters, statementType, resultClass,
          resultMapId);
    } catch (Exception exception) {
      throw new IllegalStateException("Failed to convert iBatis XML", exception);
    }
  }

  private Element findStatement(Document document, String statementId) {
    if (isBlank(statementId)) {
      // 未指定 statementId 时，直接把根节点当作渲染入口，兼容只传单条 statement 片段的场景。
      return document.getDocumentElement();
    }

    // 这里不限定标签类型，直接扫描所有元素并按 id 匹配，兼容 select/update/delete/statement 等多种节点。
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
    if (xml == null || xml.isEmpty()) {
      return "";
    }
    return IbatisXmlSupport.DOCTYPE_PATTERN.matcher(xml).replaceAll("");
  }

  private String postprocessSql(String sql) {
    if (sql == null) {
      return "";
    }
    // 处理中文逗号等全角标点，避免干扰 SQL 解析与执行
    sql = sql.replaceAll("，", ",").trim();
    // 对只包裹操作符的 CDATA 做一次轻量清理，其它文本仍保留原始内容。
    return IbatisXmlSupport.CDATA_OPERATOR_PATTERN.matcher(sql).replaceAll("$1");
  }

  private Map<String, Element> collectSqlFragments(Document document) {
    Map<String, Element> fragments = new LinkedHashMap<>();
    NodeList nodes = document.getElementsByTagName("sql");
    for (int index = 0; index < nodes.getLength(); index++) {
      Node node = nodes.item(index);
      if (!(node instanceof Element)) {
        continue;
      }
      Element element = (Element) node;
      String id = element.getAttribute("id");
      if (!isBlank(id)) {
        fragments.put(id, element);
      }
    }
    return fragments;
  }

  private Map<String, Map<String, String>> collectResultMaps(Document document) {
    Map<String, Map<String, String>> resultMaps = new LinkedHashMap<>();
    NodeList nodes = document.getElementsByTagName("resultMap");
    for (int index = 0; index < nodes.getLength(); index++) {
      Node node = nodes.item(index);
      if (!(node instanceof Element)) {
        continue;
      }
      Element element = (Element) node;
      String id = element.getAttribute("id");
      if (!isBlank(id)) {
        Map<String, String> propertyMappings = new LinkedHashMap<>();
        NodeList resultChildren = element.getChildNodes();
        for (int childIndex = 0; childIndex < resultChildren.getLength(); childIndex++) {
          Node childNode = resultChildren.item(childIndex);
          if (childNode instanceof Element) {
            Element childElement = (Element) childNode;
            String property = childElement.getAttribute("property");
            String column = childElement.getAttribute("column");
            if (!isBlank(property) && !isBlank(column)) {
              propertyMappings.put(column, property);
            }
          }
        }
        resultMaps.put(id, propertyMappings);
      }
    }
    return resultMaps;
  }

  private String renderNode(Node node, RenderContext context) {
    // 文本节点和 CDATA 节点最终都会走同一套占位符渲染逻辑。
    if (node.getNodeType() == Node.TEXT_NODE || node.getNodeType() == Node.CDATA_SECTION_NODE) {
      return renderText(node.getNodeValue(), context);
    }

    // 注释、空白之外的其它非元素节点统一忽略。
    if (node.getNodeType() != Node.ELEMENT_NODE) {
      return "";
    }

    Element element = (Element) node;
    String tagName = element.getTagName();

    if (isContainerTag(tagName)) {
      // 容器标签本身不产生 SQL，只负责把子节点按顺序展开并拼接。
      return renderChildren(element, context);
    }

    if ("include".equals(tagName)) {
      return renderInclude(element, context);
    }

    if ("isNotEmpty".equals(tagName)) {
      // property 有值才展开 body；prepend 的处理保持 iBatis 的行为习惯。
      return renderConditionalBody(element, context, shouldRender(element, context));
    }

    if ("isEmpty".equals(tagName)) {
      // isEmpty 与 isNotEmpty 相反：property 为空时才输出内部 SQL。
      return renderConditionalBody(element, context, !shouldRender(element, context));
    }

    if ("isNull".equals(tagName)) {
      return renderConditionalBody(element, context,
          resolveExpression(element.getAttribute("property"), context) == null);
    }

    if ("isNotNull".equals(tagName)) {
      return renderConditionalBody(element, context,
          resolveExpression(element.getAttribute("property"), context) != null);
    }

    if ("isPropertyAvailable".equals(tagName)) {
      return renderConditionalBody(element, context, isPropertyAvailable(element.getAttribute("property"), context));
    }

    if ("isNotPropertyAvailable".equals(tagName)) {
      return renderConditionalBody(element, context, !isPropertyAvailable(element.getAttribute("property"), context));
    }

    if ("isParameterPresent".equals(tagName)) {
      return renderConditionalBody(element, context, context.parameterPresent);
    }

    if ("isNotParameterPresent".equals(tagName)) {
      return renderConditionalBody(element, context, !context.parameterPresent);
    }

    if (IbatisXmlSupport.isBinaryConditionalTag(tagName)) {
      return renderConditionalBody(element, context, evaluateBinaryCondition(element, context, tagName));
    }

    if ("iterate".equals(tagName)) {
      // iterate 负责把集合参数按 open / close / conjunction 规则展开成片段。
      return renderIterate(element, context);
    }

    if ("dynamic".equals(tagName) || "trim".equals(tagName)) {
      // dynamic/trim 的核心工作是包装和清理内部片段，例如去掉多余 AND、逗号等。
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
        return " " + prepend.trim() + " " + stripLeadingConjunction(body);
      }
      return body;
    }

    return renderChildren(element, context);
  }

  private boolean isContainerTag(String tagName) {
    // 这些标签只是语义容器，不直接修改 SQL 结构规则。
    return IbatisXmlSupport.isContainerTag(tagName);
  }

  private String renderChildren(Element element, RenderContext context) {
    // iBatis 的文本顺序是有意义的，所以这里严格按 DOM 子节点顺序串联结果。
    StringBuilder builder = new StringBuilder();
    NodeList children = element.getChildNodes();
    for (int index = 0; index < children.getLength(); index++) {
      builder.append(renderNode(children.item(index), context));
    }
    return builder.toString();
  }

  private String renderInclude(Element element, RenderContext context) {
    String refid = element.getAttribute("refid");
    Element fragment = context.sqlFragments.get(refid);
    if (fragment == null && refid.contains(".")) {
      fragment = context.sqlFragments.get(refid.substring(refid.lastIndexOf('.') + 1));
    }
    if (fragment == null) {
      throw new IllegalArgumentException("Cannot find sql fragment: " + refid);
    }
    return renderChildren(fragment, context);
  }

  private boolean shouldRender(Element element, RenderContext context) {
    // 动态标签统一通过 property -> value -> hasValue 三段式判断是否命中。
    String property = element.getAttribute("property");
    Object value = resolveExpression(property, context);
    return hasValue(value);
  }

  private String renderConditionalBody(Element element, RenderContext context, boolean matched) {
    if (!matched) {
      return "";
    }
    String prepend = element.getAttribute("prepend");
    String body = renderChildren(element, context);
    return isBlank(prepend) ? body : " " + prepend.trim() + " " + body;
  }

  private boolean evaluateBinaryCondition(Element element, RenderContext context, String tagName) {
    Object leftValue = resolveExpression(element.getAttribute("property"), context);
    Object rightValue = resolveComparisonTarget(element, context);
    int comparison = compareValues(leftValue, rightValue);

    switch (tagName) {
      case "isEqual":
        return comparison == 0;
      case "isNotEqual":
        return comparison != 0;
      case "isGreaterThan":
        return comparison > 0;
      case "isGreaterEqual":
        return comparison >= 0;
      case "isLessThan":
        return comparison < 0;
      case "isLessEqual":
        return comparison <= 0;
      default:
        return false;
    }
  }

  private Object resolveComparisonTarget(Element element, RenderContext context) {
    String compareProperty = element.getAttribute("compareProperty");
    if (!isBlank(compareProperty)) {
      return resolveExpression(compareProperty, context);
    }
    return normalizeComparisonValue(resolveExpression(element.getAttribute("property"), context),
        element.getAttribute("compareValue"));
  }

  private String normalizeResultMapId(String declaredResultMapId, Map<String, Map<String, String>> resultMaps) {
    if (isBlank(declaredResultMapId)) {
      return null;
    }
    if (resultMaps.containsKey(declaredResultMapId)) {
      return declaredResultMapId;
    }

    if (declaredResultMapId.contains(".")) {
      String localId = declaredResultMapId.substring(declaredResultMapId.lastIndexOf('.') + 1);
      if (resultMaps.containsKey(localId)) {
        return localId;
      }
    }

    throw new IllegalArgumentException("Cannot find resultMap: " + declaredResultMapId);
  }

  private Enum<?> parseEnumValue(Class<? extends Enum<?>> enumType, String name) {
    if (enumType == null || isBlank(name)) {
      return null;
    }
    for (Enum<?> enumConstant : enumType.getEnumConstants()) {
      if (enumConstant.name().equals(name.trim())) {
        return enumConstant;
      }
    }
    return null;
  }

  private int compareValues(Object leftValue, Object rightValue) {
    if (leftValue == null && rightValue == null) {
      return 0;
    }
    if (leftValue == null) {
      return -1;
    }
    if (rightValue == null) {
      return 1;
    }

    if (leftValue instanceof Number || rightValue instanceof Number) {
      Double leftNumber = toDouble(leftValue);
      Double rightNumber = toDouble(rightValue);
      if (leftNumber != null && rightNumber != null) {
        return Double.compare(leftNumber, rightNumber);
      }
    }

    if (leftValue instanceof Boolean || rightValue instanceof Boolean) {
      Boolean leftBoolean = toBoolean(leftValue);
      Boolean rightBoolean = toBoolean(rightValue);
      if (leftBoolean != null && rightBoolean != null) {
        return Boolean.compare(leftBoolean, rightBoolean);
      }
    }

    if (leftValue instanceof Comparable<?> && rightValue != null && leftValue.getClass().isInstance(rightValue)) {
      @SuppressWarnings("unchecked")
      Comparable<Object> leftComparable = (Comparable<Object>) leftValue;
      return leftComparable.compareTo(rightValue);
    }

    return String.valueOf(leftValue).compareTo(String.valueOf(rightValue));
  }

  private Object normalizeComparisonValue(Object leftValue, String compareValue) {
    if (leftValue == null || compareValue == null) {
      return compareValue;
    }

    if (leftValue instanceof Enum<?>) {
      Enum<?> parsed = parseEnumValue(((Enum<?>) leftValue).getDeclaringClass(), compareValue);
      return parsed != null ? parsed : compareValue;
    }

    if (leftValue instanceof Character && compareValue.length() == 1) {
      return compareValue.charAt(0);
    }

    return compareValue;
  }

  private Double toDouble(Object value) {
    if (value instanceof Number) {
      return ((Number) value).doubleValue();
    }
    try {
      return Double.valueOf(String.valueOf(value).trim());
    } catch (Exception exception) {
      return null;
    }
  }

  private Boolean toBoolean(Object value) {
    if (value instanceof Boolean) {
      return (Boolean) value;
    }
    String normalized = String.valueOf(value).trim().toLowerCase(Locale.ROOT);
    if ("true".equals(normalized) || "1".equals(normalized) || "y".equals(normalized)) {
      return true;
    }
    if ("false".equals(normalized) || "0".equals(normalized) || "n".equals(normalized)) {
      return false;
    }
    return null;
  }

  private boolean isPropertyAvailable(String expression, RenderContext context) {
    if (isBlank(expression)) {
      return false;
    }

    if (context.iterationProperty != null) {
      String normalizedExpression = expression.replace("[]", "");
      if (normalizedExpression.equals(context.iterationProperty)) {
        return true;
      }
    }

    if (context.parameters.containsKey(expression)) {
      return true;
    }

    String[] parts = expression.split("\\.");
    Object current = context.parameters.get(parts[0]);
    if (current == null && context.defaultValue != null && !isSimpleParameterValue(context.defaultValue)) {
      if (isRootParameterAlias(parts[0])) {
        current = context.defaultValue;
      } else if (hasReadableProperty(context.defaultValue, parts[0])) {
        current = readProperty(context.defaultValue, parts[0]);
      }
    }
    if (current == null) {
      return parts.length == 1 && context.defaultValue != null && isRootParameterAlias(parts[0]);
    }

    for (int index = 1; index < parts.length; index++) {
      if (!hasReadableProperty(current, parts[index])) {
        return false;
      }
      current = readProperty(current, parts[index]);
      if (current == null && index < parts.length - 1) {
        return false;
      }
    }
    return true;
  }

  private boolean hasReadableProperty(Object target, String name) {
    if (target instanceof Map<?, ?>) {
      return ((Map<?, ?>) target).containsKey(name);
    }

    String suffix = Character.toUpperCase(name.charAt(0)) + name.substring(1);
    for (String methodName : Arrays.asList("get" + suffix, "is" + suffix)) {
      try {
        target.getClass().getMethod(methodName);
        return true;
      } catch (NoSuchMethodException ignored) {
        // Try next lookup.
      }
    }

    try {
      target.getClass().getDeclaredField(name);
      return true;
    } catch (NoSuchFieldException ignored) {
      return false;
    }
  }

  private String renderIterate(Element element, RenderContext context) {
    String property = element.getAttribute("property");
    Object value = resolveExpression(property, context);
    List<Object> items = asList(value);
    String open = element.getAttribute("open");
    String close = element.getAttribute("close");
    String conjunction = element.getAttribute("conjunction");
    String prepend = element.getAttribute("prepend");

    if (items.isEmpty()) {
      // Keep generated SQL valid across databases for IN ()-like constructs.
      String body = open + "null" + close;
      return isBlank(prepend) ? body : " " + prepend.trim() + " " + body;
    }

    // 每个元素都会获得一个“迭代上下文”，从而支持 #list[]# 这类写法取到当前项。
    List<String> fragments = new ArrayList<>();
    for (int index = 0; index < items.size(); index++) {
      Object item = items.get(index);
      RenderContext itemContext = context.forIteration(property, item, index);
      fragments.add(renderChildren(element, itemContext).trim());
    }

    String joined = String.join(conjunction.isEmpty() ? "," : conjunction, fragments);
    String body = open + joined + close;
    return isBlank(prepend) ? body : " " + prepend.trim() + " " + body;
  }

  private String renderText(String text, RenderContext context) {
    if (text == null || text.isEmpty()) {
      return "";
    }

    // 只对 XML 模板本身做一轮占位符解析；替换进来的原始文本不会再次递归展开。
    Matcher matcher = IbatisXmlSupport.PLACEHOLDER_PATTERN.matcher(text);
    StringBuffer buffer = new StringBuffer();
    while (matcher.find()) {
      String marker = matcher.group(1);
      String expression = firstNonBlank(IbatisXmlSupport.extractPlaceholderExpression(matcher));
      Object value = resolvePlaceholder(expression, context);
      if ("$".equals(marker)) {
        // iBatis $...$ is raw text substitution, not prepared-statement binding.
        matcher.appendReplacement(buffer, Matcher.quoteReplacement(toSqlRawText(value)));
      } else if (context.inlineMode) {
        // convert 模式下，#...# 直接内联成 SQL 字面量，便于生成“可读 SQL 报告”。
        matcher.appendReplacement(buffer, Matcher.quoteReplacement(toSqlLiteral(value)));
      } else {
        // convertForExecution 模式下，#...# 转成 ? 并把值收集到 executionParams，供 JDBC 绑定。
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
      // 数字和布尔值直接输出，避免被错误包成字符串字面量。
      return value.toString();
    }
    // 字符串场景只做单引号转义，不引入数据库方言相关的更激进处理。
    String text = String.valueOf(value).replace("'", "''");
    return "'" + text + "'";
  }

  private String toSqlRawText(Object value) {
    if (value == null) {
      return "null";
    }
    // $...$ 的定位就是“原样插入 SQL 片段”，因此这里只做 toString，不做转义。
    return String.valueOf(value);
  }

  private Object resolvePlaceholder(String expression, RenderContext context) {
    // iterate 内部的 list[] / ids[] 这类表达式优先命中当前迭代项，而不是外层参数对象。
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

    // 先按完整 key 查一遍，兼容 Map 参数直接传入扁平字段名的情况。
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

    if (context.defaultValue != null) {
      if (isRootParameterAlias(expression)) {
        return context.defaultValue;
      }
      if (isSimpleParameterValue(context.defaultValue)) {
        return context.defaultValue;
      }
    }

    // 再按 a.b.c 逐段向下读取属性，兼容 bean / 嵌套 map / 组合对象。
    String[] parts = expression.split("\\.");
    Object value = context.parameters.get(parts[0]);
    if (value == null && context.defaultValue != null && !isSimpleParameterValue(context.defaultValue)) {
      if (isRootParameterAlias(parts[0])) {
        value = context.defaultValue;
      } else {
        value = readProperty(context.defaultValue, parts[0]);
      }
    }
    for (int index = 1; index < parts.length && value != null; index++) {
      value = readProperty(value, parts[index]);
    }
    // 简单类型参数没有属性名时，最终退回 defaultValue，兼容 #value#/$value$ 这类场景。
    return value != null ? value : context.defaultValue;
  }

  private Object readProperty(Object target, String name) {
    if (target instanceof Map<?, ?>) {
      // Map 参数直接按 key 读取，不走反射。
      Map<?, ?> map = (Map<?, ?>) target;
      return map.get(name);
    }

    try {
      // 先按 JavaBean getter 约定读属性，再回退到字段反射，尽量兼容旧对象模型。
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
      // iBatis 对“属性不存在”的处理通常偏宽松，这里也统一回 null，由上层决定是否命中动态条件。
      return null;
    }
  }

  private boolean hasValue(Object value) {
    if (value == null) {
      return false;
    }

    if (value instanceof CharSequence) {
      // 字符串不仅要非 null，还要排除全空白场景。
      CharSequence sequence = (CharSequence) value;
      return !sequence.toString().trim().isEmpty();
    }

    if (value instanceof Collection<?>) {
      // 空集合在动态 SQL 里通常视为“没有值”。
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
      // 数组与集合保持同样的“空即无值”规则。
      return Array.getLength(value) > 0;
    }

    // 其它对象只要非 null 就视为命中。
    return true;
  }

  private boolean isSimpleParameterValue(Object value) {
    return value == null || value instanceof CharSequence || value instanceof Number || value instanceof Boolean
        || value instanceof Character || value.getClass().isEnum();
  }

  private boolean isRootParameterAlias(String expression) {
    return "value".equals(expression) || "_parameter".equals(expression) || "parameter".equals(expression)
        || "parameterObject".equals(expression);
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
      // 反射读取数组是为了同时兼容对象数组和基础类型数组。
      int length = Array.getLength(value);
      List<Object> items = new ArrayList<>(length);
      for (int index = 0; index < length; index++) {
        items.add(Array.get(value, index));
      }
      return items;
    }

    // 非集合值在 iterate 里退化成单元素列表，减少调用方的参数准备成本。
    return Collections.singletonList(value);
  }

  private boolean isBlank(String value) {
    return value == null || value.trim().isEmpty();
  }

  private String firstNonBlank(String... values) {
    for (String value : values) {
      if (!isBlank(value)) {
        return value.trim();
      }
    }
    return "";
  }

  private String normalizeSql(String sql) {
    // 统一压缩空白，方便测试断言和报告输出；不追求保留原始排版。
    return sql == null ? "" : sql.replaceAll("\\s+", " ").trim();
  }

  private String stripLeadingConjunction(String sql) {
    // dynamic/trim 场景下，外层 prepend 可能接管第一个 AND/OR/WHERE，需要把内部多余前缀剥掉。
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
    // 典型用于 SET 片段收尾，避免最后一个字段后面残留逗号。
    String trimmed = sql.trim();
    if (trimmed.endsWith(",")) {
      return trimmed.substring(0, trimmed.length() - 1).trim();
    }
    return trimmed;
  }

  private String stripSuffixOverrides(String sql, String suffixOverrides) {
    // 模拟 trim 的 suffixOverrides 语义，允许按多个 token 循环剥离尾部噪音。
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

  private Map<String, Object> buildCollectionContext(Object collectionValue) {
    List<Object> items = asList(collectionValue);
    Map<String, Object> context = new LinkedHashMap<>();
    context.put("ids", items);
    context.put("list", items);
    context.put("collection", items);
    if (collectionValue != null && collectionValue.getClass().isArray()) {
      context.put("array", items);
    }
    return context;
  }

  private static final class RenderContext {
    // parameters 保存命名参数；defaultValue 用于简单类型参数（如 String/Long）；
    // inlineMode 控制 #...# 是内联字面量还是 JDBC ?；
    // executionParams 只在 execution 模式下收集顺序参数；
    // iterationProperty / iterationValue 用于 iterate 当前项解析。
    private final Map<String, Object> parameters;
    private final Object defaultValue;
    private final boolean inlineMode;
    private final List<Object> executionParams;
    private final Map<String, Element> sqlFragments;
    private final Map<String, Map<String, String>> resultMaps;
    private final String iterationProperty;
    private final Object iterationValue;
    private final boolean parameterPresent;

    private static RenderContext inline(Map<String, Object> parameters, Map<String, Element> sqlFragments,
        Map<String, Map<String, String>> resultMaps) {
      return new RenderContext(parameters, null, true, null, sqlFragments, null, null, true, resultMaps);
    }

    private static RenderContext inlineScalar(Object scalarValue, Map<String, Element> sqlFragments,
        Map<String, Map<String, String>> resultMaps) {
      return new RenderContext(Collections.emptyMap(), scalarValue, true, null, sqlFragments, null, null,
          scalarValue != null, resultMaps);
    }

    private static RenderContext inlineBean(Object beanValue, Map<String, Element> sqlFragments,
        Map<String, Map<String, String>> resultMaps) {
      return new RenderContext(Collections.emptyMap(), beanValue, true, null, sqlFragments, null, null,
          beanValue != null, resultMaps);
    }

    private static RenderContext execution(Map<String, Object> parameters, List<Object> executionParams,
        Map<String, Element> sqlFragments, Map<String, Map<String, String>> resultMaps) {
      return new RenderContext(parameters, null, false, executionParams, sqlFragments, null, null, true, resultMaps);
    }

    private static RenderContext executionScalar(Object scalarValue, List<Object> executionParams,
        Map<String, Element> sqlFragments, Map<String, Map<String, String>> resultMaps) {
      return new RenderContext(Collections.emptyMap(), scalarValue, false, executionParams, sqlFragments, null, null,
          scalarValue != null, resultMaps);
    }

    private static RenderContext executionBean(Object beanValue, List<Object> executionParams,
        Map<String, Element> sqlFragments, Map<String, Map<String, String>> resultMaps) {
      return new RenderContext(Collections.emptyMap(), beanValue, false, executionParams, sqlFragments, null, null,
          beanValue != null, resultMaps);
    }

    private RenderContext(Map<String, Object> parameters, Object defaultValue, boolean inlineMode,
        List<Object> executionParams, Map<String, Element> sqlFragments, String iterationProperty,
        Object iterationValue, boolean parameterPresent, Map<String, Map<String, String>> resultMaps) {
      this.parameters = parameters;
      this.defaultValue = defaultValue;
      this.inlineMode = inlineMode;
      this.executionParams = executionParams;
      this.sqlFragments = sqlFragments;
      this.iterationProperty = iterationProperty;
      this.iterationValue = iterationValue;
      this.parameterPresent = parameterPresent;
      this.resultMaps = resultMaps;
    }

    private RenderContext forIteration(String property, Object value, int iterationIndex) {
      // 迭代时复用原上下文，只替换“当前项相关”的两个槽位。
      return new RenderContext(parameters, defaultValue, inlineMode, executionParams, sqlFragments, property, value,
          parameterPresent, resultMaps);
    }

  }
}
