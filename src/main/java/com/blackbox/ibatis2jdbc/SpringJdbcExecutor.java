package com.blackbox.ibatis2jdbc;

import org.springframework.jdbc.core.JdbcTemplate;
import java.util.List;
import java.util.Map;

/**
 * Spring JdbcTemplate 实现的 JDBC 执行器。
 * <p>
 * 开箱即用，无需额外配置。接收 iBatis 语句 ID 和参数，内部完成转换并通过 JdbcTemplate 执行。
 */
public class SpringJdbcExecutor implements JdbcExecutor {
  private final JdbcTemplate jdbcTemplate;
  private final IbatisToJdbcConverter converter;

  /**
   * 创建执行器实例。
   * @param jdbcTemplate Spring 的 JdbcTemplate 实例
   * @param converter iBatis 转换器实例
   */
  public SpringJdbcExecutor(JdbcTemplate jdbcTemplate, IbatisToJdbcConverter converter) {
    if (jdbcTemplate == null) {
      throw new IllegalArgumentException("JdbcTemplate cannot be null");
    }
    if (converter == null) {
      throw new IllegalArgumentException("Converter cannot be null");
    }
    this.jdbcTemplate = jdbcTemplate;
    this.converter = converter;
  }

  @Override
  public List<Map<String, Object>> queryForList(String statementId, Object params) {
    ConvertedSql converted = converter.convertPrepared(statementId, params);
    String sql = converted.getSql();
    List<Object> bindings = converted.getPreparedBindings();
    return jdbcTemplate.queryForList(sql, bindings.toArray());
  }

  @Override
  public Map<String, Object> queryForMap(String statementId, Object params) {
    ConvertedSql converted = converter.convertPrepared(statementId, params);
    String sql = converted.getSql();
    List<Object> bindings = converted.getPreparedBindings();
    try {
      return jdbcTemplate.queryForMap(sql, bindings.toArray());
    } catch (org.springframework.dao.EmptyResultDataAccessException e) {
      return null;
    }
  }

  @Override
  public int update(String statementId, Object params) {
    ConvertedSql converted = converter.convertPrepared(statementId, params);
    String sql = converted.getSql();
    List<Object> bindings = converted.getPreparedBindings();
    return jdbcTemplate.update(sql, bindings.toArray());
  }
}
