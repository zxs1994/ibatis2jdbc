package com.blackbox.ibatis2jdbc;

/**
 * 封装 iBatis SQL 转换后的结果，包括最终可执行的 SQL、原始参数对象、语句类型、结果映射信息，以及按占位符顺序排列的 JDBC 绑定值列表。
 * <p>
 * 设计目标：
 * 1. 提供一个不可变的对象来承载转换结果，确保线程安全和数据完整性。
 * 2. 包含原始参数对象以便在需要时回溯上下文信息，支持更复杂的转换逻辑。
 * 3. 提供一个方法将带 ? 占位符的 SQL 渲染为仅用于预览的最终 SQL，方便调试和日志记录。
 * 4. 预留语句类型和结果映射信息字段，以支持未来可能的功能扩展，如基于语句类型的执行优化或结果映射自动化。
 */
public final class ConvertedSql {
    // JDBC 可执行 SQL（使用 ? 占位符）。
    private final String sql;
    // 转换时传入的原始参数对象（用于回溯上下文）。
    private final Object parameters;
    // 语句类型，如 select/insert/update/delete。
    private final String statementType;
    // iBatis 声明的 resultClass 元数据。
    private final String resultClass;
    // iBatis 声明的 resultMap id。
    private final String resultMapId;
    // 单一模式：按占位符顺序排列的 PreparedStatement 绑定值（永远非 null）。
    private final java.util.List<Object> preparedBindings;

    public ConvertedSql(String sql, Object parameters) {
        this(sql, parameters, null, null, null);
    }

    public ConvertedSql(String sql, Object parameters, String statementType, String resultClass) {
        this(sql, parameters, statementType, resultClass, null);
    }

    public ConvertedSql(String sql, Object parameters, String statementType, String resultClass, String resultMapId) {
        this(sql, parameters, statementType, resultClass, resultMapId, null);
    }

    public ConvertedSql(String sql, Object parameters, String statementType, String resultClass, String resultMapId,
                        java.util.List<Object> preparedBindings) {
        this.sql = sql;
        this.parameters = parameters;
        this.statementType = statementType;
        this.resultClass = resultClass;
        this.resultMapId = resultMapId;
        this.preparedBindings = preparedBindings == null ? java.util.Collections.<Object>emptyList() : preparedBindings;
    }

    public String getSql() {
        return sql;
    }

    public Object getParameters() {
        return parameters;
    }

    public String getStatementType() {
        return statementType;
    }

    public String getResultClass() {
        return resultClass;
    }

    public String getResultMapId() {
        return resultMapId;
    }

    /**
     * 返回按 ? 顺序排列的 JDBC 绑定值列表（永远非 null）。
     */
    public java.util.List<Object> getPreparedBindings() {
        return preparedBindings;
    }

    /**
     * 将带 ? 占位符的 SQL 渲染为仅用于预览的最终 SQL。
     */
    public String toPreviewSql() {
        StringBuilder builder = new StringBuilder(sql.length() + 32);
        int bindIndex = 0;
        boolean inSingleQuote = false;

        for (int i = 0; i < sql.length(); i++) {
            char ch = sql.charAt(i);
            if (ch == '\'') {
                builder.append(ch);
                if (inSingleQuote && i + 1 < sql.length() && sql.charAt(i + 1) == '\'') {
                    // SQL 字符串内的转义单引号 ''，保持在字符串上下文中。
                    builder.append(sql.charAt(i + 1));
                    i++;
                    continue;
                }
                inSingleQuote = !inSingleQuote;
                continue;
            }

            if (ch == '?' && !inSingleQuote) {
                if (bindIndex >= preparedBindings.size()) {
                    throw new IllegalStateException("Not enough bindings for SQL placeholders");
                }
                builder.append(toSqlLiteral(preparedBindings.get(bindIndex++)));
            } else {
                builder.append(ch);
            }
        }

        if (bindIndex != preparedBindings.size()) {
            throw new IllegalStateException("Too many bindings for SQL placeholders");
        }
        return builder.toString();
    }

    private static String toSqlLiteral(Object value) {
        if (value == null) {
            return "null";
        }
        if (value instanceof Number || value instanceof Boolean) {
            return value.toString();
        }
        String text = String.valueOf(value).replace("'", "''");
        return "'" + text + "'";
    }
}
