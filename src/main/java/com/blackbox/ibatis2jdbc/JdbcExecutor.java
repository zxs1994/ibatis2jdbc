package com.blackbox.ibatis2jdbc;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class JdbcExecutor {
  private static final Pattern NAMED_PARAM_PATTERN = Pattern.compile(":([A-Za-z_][A-Za-z0-9_]*)");

  public Object execute(Connection connection, ConvertedSql convertedSql) throws SQLException {
    String statementType = convertedSql.getStatementType();
    if (isBlank(statementType)) {
      return executeBySqlPrefix(connection, convertedSql);
    }

    String normalizedStatementType = statementType.toLowerCase(Locale.ROOT);
    switch (normalizedStatementType) {
      case "select":
        return queryForList(connection, convertedSql);
      case "insert":
      case "update":
      case "delete":
        return executeUpdate(connection, convertedSql);
      default:
        return executeBySqlPrefix(connection, convertedSql);
    }
  }

  public int executeUpdate(Connection connection, ConvertedSql convertedSql) throws SQLException {
    PreparedSql preparedSql = toPreparedSql(convertedSql);
    try (PreparedStatement statement = connection.prepareStatement(preparedSql.getSql())) {
      bind(statement, preparedSql.getParams());
      return statement.executeUpdate();
    }
  }

  public List<Map<String, Object>> queryForList(Connection connection, ConvertedSql convertedSql) throws SQLException {
    PreparedSql preparedSql = toPreparedSql(convertedSql);
    try (PreparedStatement statement = connection.prepareStatement(preparedSql.getSql())) {
      bind(statement, preparedSql.getParams());
      try (ResultSet resultSet = statement.executeQuery()) {
        return readRows(resultSet);
      }
    }
  }

  public <T> T queryForObject(Connection connection, ConvertedSql convertedSql, Class<T> targetType)
      throws SQLException {
    List<Map<String, Object>> rows = queryForList(connection, convertedSql);
    if (rows.isEmpty()) {
      return null;
    }
    if (rows.size() > 1) {
      throw new IllegalStateException("Expected one row but got " + rows.size());
    }
    return mapRow(rows.get(0), targetType);
  }

  public PreparedSql toPreparedSql(ConvertedSql convertedSql) {
    String sql = convertedSql.getSql();
    Object params = convertedSql.getParameters();

    if (sql.contains(":")) {
      if (!(params instanceof Map<?, ?>)) {
        throw new IllegalArgumentException("Named parameters require Map input");
      }
      Map<?, ?> map = (Map<?, ?>) params;
      return convertNamedSql(sql, map);
    }

    int placeholderCount = countPlaceholders(sql);
    if (params instanceof List<?>) {
      List<?> list = (List<?>) params;
      if (placeholderCount != list.size()) {
        throw new IllegalArgumentException(
            "Placeholder count " + placeholderCount + " does not match list size " + list.size());
      }
      return new PreparedSql(sql, new ArrayList<>(list));
    }

    if (placeholderCount == 0) {
      return new PreparedSql(sql, Collections.emptyList());
    }

    if (placeholderCount == 1) {
      return new PreparedSql(sql, Collections.singletonList(params));
    }

    throw new IllegalArgumentException("Multiple placeholders require List params");
  }

  private Object executeBySqlPrefix(Connection connection, ConvertedSql convertedSql) throws SQLException {
    String trimmedSql = convertedSql.getSql() == null ? "" : convertedSql.getSql().trim().toLowerCase(Locale.ROOT);
    if (trimmedSql.startsWith("select")) {
      return queryForList(connection, convertedSql);
    }
    return executeUpdate(connection, convertedSql);
  }

  private PreparedSql convertNamedSql(String sql, Map<?, ?> params) {
    Matcher matcher = NAMED_PARAM_PATTERN.matcher(sql);
    StringBuffer positionalSql = new StringBuffer();
    List<Object> orderedParams = new ArrayList<>();

    while (matcher.find()) {
      String key = matcher.group(1);
      if (!params.containsKey(key)) {
        throw new IllegalArgumentException("Missing named parameter: " + key);
      }
      orderedParams.add(params.get(key));
      matcher.appendReplacement(positionalSql, "?");
    }
    matcher.appendTail(positionalSql);

    return new PreparedSql(positionalSql.toString(), orderedParams);
  }

  private int countPlaceholders(String sql) {
    int count = 0;
    boolean inSingleQuote = false;
    for (int i = 0; i < sql.length(); i++) {
      char current = sql.charAt(i);
      if (current == '\'') {
        // SQL escaped quote: '' inside a string literal.
        if (inSingleQuote && i + 1 < sql.length() && sql.charAt(i + 1) == '\'') {
          i++;
          continue;
        }
        inSingleQuote = !inSingleQuote;
        continue;
      }

      if (!inSingleQuote && current == '?') {
        count++;
      }
    }
    return count;
  }

  private void bind(PreparedStatement statement, List<Object> params) throws SQLException {
    for (int i = 0; i < params.size(); i++) {
      statement.setObject(i + 1, params.get(i));
    }
  }

  private List<Map<String, Object>> readRows(ResultSet resultSet) throws SQLException {
    List<Map<String, Object>> rows = new ArrayList<>();
    ResultSetMetaData metaData = resultSet.getMetaData();
    int columnCount = metaData.getColumnCount();

    while (resultSet.next()) {
      Map<String, Object> row = new LinkedHashMap<>();
      for (int column = 1; column <= columnCount; column++) {
        row.put(metaData.getColumnLabel(column), resultSet.getObject(column));
      }
      rows.add(row);
    }
    return rows;
  }

  @SuppressWarnings("unchecked")
  private <T> T mapRow(Map<String, Object> row, Class<T> targetType) {
    if (targetType == null || targetType == Map.class) {
      return (T) row;
    }

    if (isSimpleValueType(targetType)) {
      if (row.size() != 1) {
        throw new IllegalStateException("Simple type mapping requires exactly one column");
      }
      Object value = row.values().iterator().next();
      return castSimpleValue(value, targetType);
    }

    try {
      T bean = targetType.getDeclaredConstructor().newInstance();
      for (Map.Entry<String, Object> entry : row.entrySet()) {
        Field field = findField(targetType, toCamelCase(entry.getKey()));
        if (field != null) {
          field.setAccessible(true);
          field.set(bean, entry.getValue());
        }
      }
      return bean;
    } catch (Exception exception) {
      throw new IllegalStateException("Failed to map row to " + targetType.getName(), exception);
    }
  }

  @SuppressWarnings("unchecked")
  private <T> T castSimpleValue(Object value, Class<T> targetType) {
    if (value == null || targetType.isInstance(value)) {
      return (T) value;
    }
    if (targetType == String.class) {
      return (T) String.valueOf(value);
    }
    if (value instanceof Number) {
      Number number = (Number) value;
      if (targetType == Integer.class || targetType == int.class) {
        return (T) Integer.valueOf(number.intValue());
      }
      if (targetType == Long.class || targetType == long.class) {
        return (T) Long.valueOf(number.longValue());
      }
      if (targetType == Double.class || targetType == double.class) {
        return (T) Double.valueOf(number.doubleValue());
      }
    }
    throw new IllegalArgumentException("Cannot cast value to " + targetType.getName());
  }

  private boolean isSimpleValueType(Class<?> type) {
    return type.isPrimitive() || Number.class.isAssignableFrom(type) || type == String.class || type == Boolean.class;
  }

  private Field findField(Class<?> type, String name) {
    Class<?> current = type;
    while (current != null && current != Object.class) {
      try {
        return current.getDeclaredField(name);
      } catch (NoSuchFieldException ignored) {
        current = current.getSuperclass();
      }
    }
    return null;
  }

  private String toCamelCase(String text) {
    String lower = text.toLowerCase(Locale.ROOT);
    String[] parts = lower.split("_");
    if (parts.length == 0) {
      return lower;
    }
    StringBuilder builder = new StringBuilder(parts[0]);
    for (int i = 1; i < parts.length; i++) {
      if (!parts[i].isEmpty()) {
        builder.append(Character.toUpperCase(parts[i].charAt(0))).append(parts[i].substring(1));
      }
    }
    return builder.toString();
  }

  private boolean isBlank(String value) {
    return value == null || value.trim().isEmpty();
  }

  public static final class PreparedSql {
    private final String sql;
    private final List<Object> params;

    public PreparedSql(String sql, List<Object> params) {
      this.sql = sql;
      this.params = params;
    }

    public String getSql() {
      return sql;
    }

    public List<Object> getParams() {
      return params;
    }
  }
}
