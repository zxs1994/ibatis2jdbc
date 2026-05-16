package com.blackbox.ibatis2jdbc;

public final class ConvertedSql {
  private final String sql;
  private final Object parameters;
  private final String statementType;
  private final String resultClass;
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
