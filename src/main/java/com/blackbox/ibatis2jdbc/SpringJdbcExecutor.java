package com.blackbox.ibatis2jdbc;

import org.springframework.stereotype.Component;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Spring JdbcTemplate 实现的 JDBC 执行器。
 * <p>
 * 开箱即用，无需额外配置。接收 iBatis 语句 ID 和参数，内部完成转换并通过 JdbcTemplate 执行。
 * <p>
 * 典型用法（Spring 托管后可直接注入）：
 * 
 * <pre>
 * &#64;Service
 * public class UserService {
 * 	&#64;Autowired
 * 	private SpringJdbcExecutor executor;
 *
 * 	public List&lt;String&gt; findUsers() {
 * 		return executor.queryForList("selectUsers", String.class);
 * 	}
 * }
 * </pre>
 * 
 * 若查询没有参数，可直接使用无参重载；有参数时继续传参数即可。
 */
@Component
public class SpringJdbcExecutor implements JdbcExecutor {
	private static final Object[] EMPTY_ARGS = new Object[0];

	private final JdbcTemplate jdbcTemplate;
	private final IbatisToJdbcConverter converter;

	private static final class PreparedExecution {
		private final String sql;
		private final Object[] args;

		private PreparedExecution(String sql, Object[] args) {
			this.sql = sql != null ? sql : "";
			this.args = args != null ? args : EMPTY_ARGS;
		}
	}

	/**
	 * 创建执行器实例。
	 *
	 * @param jdbcTemplate Spring 的 JdbcTemplate 实例
	 * @param converter    iBatis 转换器实例
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

	/**
	 * 确保 SQL 映射已加载。
	 */
	private void ensureSqlMapsLoaded() {
		if (converter.getLoadedStatementCount() == 0) {
			converter.loadSqlMapsFromClasspath();
		}
	}

	public List<Map<String, Object>> queryForList(String statementId) {
		return queryForList(statementId, null);
	}

	public List<Map<String, String>> queryForStringMapList(String statementId) {
		return queryForStringMapList(statementId, null);
	}

	public <T> List<T> queryForList(String statementId, Class<T> elementType) {
		return queryForList(statementId, null, elementType);
	}

	public Map<String, Object> queryForMap(String statementId) {
		return queryForMap(statementId, null);
	}

	public Map<String, String> queryForStringMap(String statementId) {
		return queryForStringMap(statementId, null);
	}

	public <T> T queryForObject(String statementId, Class<T> requiredType) {
		return queryForObject(statementId, null, requiredType);
	}

	public <T> List<T> query(String statementId, RowMapper<T> rowMapper) {
		return query(statementId, null, rowMapper);
	}

	public int update(String statementId) {
		return update(statementId, null);
	}

	private PreparedExecution prepare(String statementId, Object params) {
		ensureSqlMapsLoaded();
		ConvertedSql converted = converter.convertPrepared(statementId, params);
		List<Object> bindings = converted.getPreparedBindings();
		Object[] args = bindings == null || bindings.isEmpty() ? EMPTY_ARGS : bindings.toArray();
		return new PreparedExecution(converted.getSql(), args);
	}

	@Override
	public List<Map<String, Object>> queryForList(String statementId, Object params) {
		PreparedExecution prepared = prepare(statementId, params);
		return jdbcTemplate.queryForList(prepared.sql, prepared.args);
	}

	@Override
	public List<Map<String, String>> queryForStringMapList(String statementId, Object params) {
		List<Map<String, Object>> rows = queryForList(statementId, params);
		List<Map<String, String>> stringRows = new ArrayList<>(rows.size());
		for (Map<String, Object> row : rows) {
			stringRows.add(toStringMap(row));
		}
		return stringRows;
	}

	@Override
	public <T> List<T> queryForList(String statementId, Object params, Class<T> elementType) {
		PreparedExecution prepared = prepare(statementId, params);
		return jdbcTemplate.query(prepared.sql, new BeanPropertyRowMapper<>(elementType), prepared.args);
	}

	@Override
	public Map<String, Object> queryForMap(String statementId, Object params) {
		PreparedExecution prepared = prepare(statementId, params);
		try {
			return jdbcTemplate.queryForMap(prepared.sql, prepared.args);
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	@Override
	public Map<String, String> queryForStringMap(String statementId, Object params) {
		Map<String, Object> row = queryForMap(statementId, params);
		return row == null ? null : toStringMap(row);
	}

	@Override
	public <T> T queryForObject(String statementId, Object params, Class<T> requiredType) {
		PreparedExecution prepared = prepare(statementId, params);
		try {
			return jdbcTemplate.queryForObject(prepared.sql, requiredType, prepared.args);
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	@Override
	public <T> List<T> query(String statementId, Object params, RowMapper<T> rowMapper) {
		PreparedExecution prepared = prepare(statementId, params);
		return jdbcTemplate.query(prepared.sql, rowMapper, prepared.args);
	}

	@Override
	public int update(String statementId, Object params) {
		PreparedExecution prepared = prepare(statementId, params);
		return jdbcTemplate.update(prepared.sql, prepared.args);
	}

	private Map<String, String> toStringMap(Map<String, Object> source) {
		Map<String, String> target = new LinkedHashMap<>();
		for (Map.Entry<String, Object> entry : source.entrySet()) {
			target.put(entry.getKey(), entry.getValue() == null ? null : String.valueOf(entry.getValue()));
		}
		return target;
	}
}
