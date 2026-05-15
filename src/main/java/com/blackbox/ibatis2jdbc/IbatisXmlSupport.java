package com.blackbox.ibatis2jdbc;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

final class IbatisXmlSupport {
  static final Pattern DOCTYPE_PATTERN = Pattern.compile("(?is)<!DOCTYPE[^>]*>");
  static final Pattern CDATA_OPERATOR_PATTERN = Pattern.compile("<!\\[CDATA\\[(\\W+)]]>");
  static final Pattern PLACEHOLDER_PATTERN = Pattern.compile("([#$])(?:\\{([\\w.\\[\\]]+)\\}|([\\w.\\[\\]]+))\\1");
  static final List<String> STATEMENT_TAGS = Collections.unmodifiableList(
      Arrays.asList("select", "insert", "update", "delete", "statement"));
  static final List<String> CONTAINER_TAGS = Collections.unmodifiableList(
      Arrays.asList("sqlMap", "mapper", "sql", "select", "insert", "update", "delete", "statement"));
  static final List<String> BINARY_CONDITIONAL_TAGS = Collections.unmodifiableList(
      Arrays.asList("isEqual", "isNotEqual", "isGreaterThan", "isGreaterEqual", "isLessThan", "isLessEqual"));
  static final List<String> DYNAMIC_TAGS = Collections.unmodifiableList(Arrays.asList(
      "isNotEmpty", "isEmpty", "isNull", "isNotNull", "isPropertyAvailable", "isNotPropertyAvailable",
      "isParameterPresent", "isNotParameterPresent", "isEqual", "isNotEqual", "isGreaterThan",
      "isGreaterEqual", "isLessThan", "isLessEqual", "iterate", "dynamic", "trim"));

  private IbatisXmlSupport() {
  }

  static boolean isStatementTag(String tagName) {
    return STATEMENT_TAGS.contains(tagName);
  }

  static boolean isContainerTag(String tagName) {
    return CONTAINER_TAGS.contains(tagName);
  }

  static boolean isBinaryConditionalTag(String tagName) {
    return BINARY_CONDITIONAL_TAGS.contains(tagName);
  }

  static boolean isDynamicTag(String tagName) {
    return DYNAMIC_TAGS.contains(tagName);
  }

  static boolean containsDynamicTagMarkup(String text) {
    if (text == null || text.isEmpty()) {
      return false;
    }
    for (String tagName : DYNAMIC_TAGS) {
      if (text.contains("<" + tagName)) {
        return true;
      }
    }
    return false;
  }

  static String extractPlaceholderExpression(Matcher matcher) {
    String braceWrapped = matcher.groupCount() >= 2 ? matcher.group(2) : null;
    if (braceWrapped != null && !braceWrapped.trim().isEmpty()) {
      return braceWrapped;
    }
    String plain = matcher.groupCount() >= 3 ? matcher.group(3) : null;
    return plain == null ? "" : plain;
  }
}