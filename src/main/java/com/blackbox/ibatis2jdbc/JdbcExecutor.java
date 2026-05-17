package com.blackbox.ibatis2jdbc;

import java.util.List;
import java.util.Map;

/**
 * JDBC 执行器接口，定义了执行 iBatis SQL 的方法。
 * <p>
 * 设计目标：
 * 1. 提供一个抽象层，接受 iBatis 语句 ID 和参数，内部完成转换并执行。
 * 2. 允许不同的 JDBC 实现（如直接使用 java.sql.Connection 或通过 Spring JdbcTemplate）。
 * 3. 支持未来扩展，如添加批量执行、事务管理等功能。
 */
public interface JdbcExecutor {
  /**
   * 执行查询 SQL，返回结果集映射到 Map 列表。
   * 
   * @param statementId iBatis 语句 ID（如 "selectUsersByStatus"）
   * @param params 查询参数（可以是 Map、POJO 对象或任何类型）
   * @return 结果集映射到 Map 的列表
   */
  List<Map<String, Object>> queryForList(String statementId, Object params);

  /**
   * 执行单行查询，返回结果映射到 Map。
   * 
   * @param statementId iBatis 语句 ID
   * @param params 查询参数（可以是 Map、POJO 对象或任何类型）
   * @return 结果映射到 Map，若无结果则返回 null
   */
  Map<String, Object> queryForMap(String statementId, Object params);

  /**
   * 执行更新操作（INSERT/UPDATE/DELETE），返回受影响行数。
   * 
   * @param statementId iBatis 语句 ID
   * @param params 更新参数（可以是 Map、POJO 对象或任何类型）
   * @return 受影响的行数
   */
  int update(String statementId, Object params);
}