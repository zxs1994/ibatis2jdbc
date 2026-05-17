package com.blackbox.ibatis2jdbc;

/**
 * JDBC 执行器接口，定义了执行转换后 SQL 的方法。
 * <p>
 * 设计目标：
 * 1. 提供一个抽象层，允许不同的 JDBC 实现（如直接使用 java.sql.Connection 或通过 Spring
 * JdbcTemplate）来执行转换后的 SQL。
 * 2. 定义一个统一的执行方法，接受 ConvertedSql 对象，并返回执行结果或抛出异常。
 * 3. 支持未来扩展，如添加批量执行、事务管理等功能。
 */
public class JdbcExecutor {

}