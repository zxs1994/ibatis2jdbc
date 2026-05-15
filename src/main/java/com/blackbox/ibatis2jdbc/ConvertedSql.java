package com.blackbox.ibatis2jdbc;

public final class ConvertedSql {
  private final String sql;
  private final Object parameters;
  private final String statementType;
  private final String resultClass;

  public ConvertedSql(String sql, Object parameters) {
    this(sql, parameters, null, null);
  }

  public ConvertedSql(String sql, Object parameters, String statementType, String resultClass) {
    this.sql = sql;
    this.parameters = parameters;
    this.statementType = statementType;
    this.resultClass = resultClass;
  }

  public String sql() {
    return sql;
  }

  public Object parameters() {
    return parameters;
  }

  public String statementType() {
    return statementType;
  }

  public String resultClass() {
    return resultClass;
  }
}
