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
  // 用于把 <![CDATA[ >= ]]> 这类只包住操作符的片段还原成普通 SQL 运算符。
  private static final Pattern CDATA_OPERATOR_PATTERN = Pattern.compile("<!\\[CDATA\\[(\\W+)]]>");
  // 同时匹配 #property# / #{property}# 和 $property$ / ${property}$ 两类占位符。
  private static final Pattern PLACEHOLDER_PATTERN = Pattern.compile("([#$])(?:\\{([\\w.\\[\\]]+)\\}|([\\w.\\[\\]]+))\\1");

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
      String statementType = statement.getTagName();
      String resultClass = statement.getAttribute("resultClass");

      List<Object> executionParams = inlineMode ? null : new ArrayList<>();
      RenderContext renderContext;
      Object convertedParameters;

      // List 参数在 iBatis 的 iterate 语义里通常以 ids/list 两个入口被访问，
      // 这里先统一包装成 Map，再复用同一套属性解析逻辑。
      // inline 模式返回原始参数，execution 模式返回 JDBC 参数列表。
      if (parameters instanceof Map) {
        @SuppressWarnings("unchecked")
        Map<String, Object> paramMap = (Map<String, Object>) parameters;
        renderContext = inlineMode ? RenderContext.inline(paramMap)
            : RenderContext.execution(paramMap, executionParams);
        convertedParameters = inlineMode ? parameters : executionParams;
      } else if (parameters instanceof List<?>) {
        List<?> list = (List<?>) parameters;
        Map<String, Object> listContext = buildListContext(list);
        renderContext = inlineMode ? RenderContext.inline(listContext)
            : RenderContext.execution(listContext, executionParams);
        convertedParameters = inlineMode ? parameters : executionParams;
      } else {
        renderContext = inlineMode ? RenderContext.inlineScalar(parameters)
            : RenderContext.executionScalar(parameters, executionParams);
        convertedParameters = inlineMode ? parameters : executionParams;
      }

      // renderNode 会递归展开动态标签和占位符，最后得到一条纯 SQL 字符串。
      String sql = renderNode(statement, renderContext);
      return new ConvertedSql(normalizeSql(postprocessSql(sql)), convertedParameters, statementType, resultClass);
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
    return xml;
  }

  private String postprocessSql(String sql) {
    if (sql == null) {
      return "";
    }
    // 处理中文逗号等全角标点，避免干扰 SQL 解析与执行
    sql = sql.replaceAll("，", ",").trim();
    // 对只包裹操作符的 CDATA 做一次轻量清理，其它文本仍保留原始内容。
    return CDATA_OPERATOR_PATTERN.matcher(sql).replaceAll("$1");
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

    if ("isNotEmpty".equals(tagName)) {
      // property 有值才展开 body；prepend 的处理保持 iBatis 的行为习惯。
      if (!shouldRender(element, context))
        return "";
      String prepend = element.getAttribute("prepend");
      String body = renderChildren(element, context);
      return isBlank(prepend) ? body : prepend.trim() + " " + body;
    }

    if ("isEmpty".equals(tagName)) {
      // isEmpty 与 isNotEmpty 相反：property 为空时才输出内部 SQL。
      if (shouldRender(element, context))
        return "";
      String prepend = element.getAttribute("prepend");
      String body = renderChildren(element, context);
      return isBlank(prepend) ? body : prepend.trim() + " " + body;
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
        return prepend.trim() + " " + stripLeadingConjunction(body);
      }
      return body;
    }

    return renderChildren(element, context);
  }

  private boolean isContainerTag(String tagName) {
    // 这些标签只是语义容器，不直接修改 SQL 结构规则。
    return "sqlMap".equals(tagName)
        || "mapper".equals(tagName)
        || "select".equals(tagName)
        || "insert".equals(tagName)
        || "update".equals(tagName)
        || "delete".equals(tagName)
        || "statement".equals(tagName);
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

  private boolean shouldRender(Element element, RenderContext context) {
    // 动态标签统一通过 property -> value -> hasValue 三段式判断是否命中。
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

    // 每个元素都会获得一个“迭代上下文”，从而支持 #list[]# 这类写法取到当前项。
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

    // 只对 XML 模板本身做一轮占位符解析；替换进来的原始文本不会再次递归展开。
    Matcher matcher = PLACEHOLDER_PATTERN.matcher(text);
    StringBuffer buffer = new StringBuffer();
    while (matcher.find()) {
      String marker = matcher.group(1);
      String expression = firstNonBlank(matcher.group(2), matcher.group(3));
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

    // 再按 a.b.c 逐段向下读取属性，兼容 bean / 嵌套 map / 组合对象。
    String[] parts = expression.split("\\.");
    Object value = context.parameters.get(parts[0]);
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

  private Map<String, Object> buildListContext(List<?> list) {
    // 常见 iBatis XML 会把集合参数命名成 ids 或 list，这里同时提供两个别名以提升兼容性。
    Map<String, Object> context = new LinkedHashMap<>();
    context.put("ids", list);
    context.put("list", list);
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
    private final String iterationProperty;
    private final Object iterationValue;

    private static RenderContext inline(Map<String, Object> parameters) {
      return new RenderContext(parameters, null, true, null, null, null);
    }

    private static RenderContext inlineScalar(Object scalarValue) {
      return new RenderContext(Collections.emptyMap(), scalarValue, true, null, null, null);
    }

    private static RenderContext execution(Map<String, Object> parameters, List<Object> executionParams) {
      return new RenderContext(parameters, null, false, executionParams, null, null);
    }

    private static RenderContext executionScalar(Object scalarValue, List<Object> executionParams) {
      return new RenderContext(Collections.emptyMap(), scalarValue, false, executionParams, null, null);
    }

    private RenderContext(Map<String, Object> parameters, Object defaultValue, boolean inlineMode,
        List<Object> executionParams, String iterationProperty, Object iterationValue) {
      this.parameters = parameters;
      this.defaultValue = defaultValue;
      this.inlineMode = inlineMode;
      this.executionParams = executionParams;
      this.iterationProperty = iterationProperty;
      this.iterationValue = iterationValue;
    }

    private RenderContext forIteration(String property, Object value, int iterationIndex) {
      // 迭代时复用原上下文，只替换“当前项相关”的两个槽位。
      return new RenderContext(parameters, defaultValue, inlineMode, executionParams, property, value);
    }
  }
}
