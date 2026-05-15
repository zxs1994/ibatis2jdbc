package com.blackbox.ibatis2jdbc;

public final class ConvertedSql {
  private final String sql;
  private final Object parameters;
  private final String statementType;
  private final String resultClass;
  private final String resultMapId;

  public ConvertedSql(String sql, Object parameters) {
    this(sql, parameters, null, null, null);
  }

  public ConvertedSql(String sql, Object parameters, String statementType, String resultClass) {
    this(sql, parameters, statementType, resultClass, null);
  }

  public ConvertedSql(String sql, Object parameters, String statementType, String resultClass, String resultMapId) {
    this.sql = sql;
    this.parameters = parameters;
    this.statementType = statementType;
    this.resultClass = resultClass;
    this.resultMapId = resultMapId;
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
}
