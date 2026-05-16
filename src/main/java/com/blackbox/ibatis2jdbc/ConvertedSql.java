package com.blackbox.ibatis2jdbc;

public final class ConvertedSql {
  private final String sql;
  private final Object parameters;
  private final String statementType;
  private final String resultClass;
  private final String resultMapId;
  // PreparedStatement 模式：按占位符顺序排列的绑定值，null 表示非 prepared 模式。
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
    this.preparedBindings = preparedBindings;
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
   * 返回按 ? 顺序排列的 JDBC 绑定值列表，仅在通过 convertPrepared 系列方法生成时非 null。
   */
  public java.util.List<Object> getPreparedBindings() {
    return preparedBindings;
  }
}
