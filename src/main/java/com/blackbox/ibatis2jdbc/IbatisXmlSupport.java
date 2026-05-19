package com.blackbox.ibatis2jdbc;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * iBatis SQL Map XML 相关的静态工具类，提供常用的正则表达式模式和标签分类方法。
 * <p>
 * 设计目标：
 * 1. 集中管理与 iBatis XML 结构相关的常量和工具方法，避免散布在代码中的硬编码字符串。
 * 2. 提供清晰的标签分类方法，便于在转换过程中快速判断标签类型和处理逻辑。
 * 3. 包含一个实用方法用于检测文本中是否包含任何动态 SQL 标签的标记，以优化转换流程。
 */
final class IbatisXmlSupport {
    static final Pattern DOCTYPE_PATTERN = Pattern.compile("(?is)<!DOCTYPE[^>]*>");
    static final Pattern CDATA_OPERATOR_PATTERN = Pattern.compile("<!\\[CDATA\\[(\\W+)]]>");
    static final Pattern PLACEHOLDER_PATTERN = Pattern.compile("([#$])(?:\\{([\\w.\\[\\]]+)}|([\\w.\\[\\]]+))\\1");
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