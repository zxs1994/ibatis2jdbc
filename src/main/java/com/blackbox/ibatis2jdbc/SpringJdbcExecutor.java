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
import java.util.Arrays;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.util.regex.Pattern;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;

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
// TODO：resultClass 还没处理
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

	private static final Pattern SORT_PROPERTY_PATTERN = Pattern.compile("[A-Za-z0-9_\\.]+");

	private static final Pattern ORDER_BY_PATTERN = Pattern.compile("(?i)\\border\\s+by\\b");

	private String buildSortClause(Sort sort) {
		if (sort == null || sort.isUnsorted()) {
			return "";
		}
		StringBuilder sb = new StringBuilder();
		sb.append("ORDER BY ");
		boolean first = true;
		for (Sort.Order order : sort) {
			String prop = order.getProperty();
			if (prop == null || !SORT_PROPERTY_PATTERN.matcher(prop).matches()) {
				throw new IllegalArgumentException("Invalid sort property: " + prop);
			}
			if (!first) {
				sb.append(", ");
			}
			sb.append(prop).append(order.isAscending() ? " ASC" : " DESC");
			first = false;
		}
		return sb.toString();
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

	@Override
	public Page<Map<String, Object>> pageQuery(String statementId, Pageable pageable) {
		return pageQuery(statementId, pageable, null);
	}

	@Override
	public Page<Map<String, Object>> pageQuery(String statementId, Pageable pageable, Object params) {
		if (pageable == null) {
			throw new IllegalArgumentException("pageable must not be null");
		}
		if (pageable.getPageSize() < 1) {
			throw new IllegalArgumentException("pageSize must be >= 1");
		}
		PreparedExecution prepared = prepare(statementId, params);

		// 1) 总数查询：包一层 count
		String countSql = "SELECT COUNT(1) FROM (" + prepared.sql + ") tmp_count";
		Long total = jdbcTemplate.queryForObject(countSql, Long.class, prepared.args);
		if (total == null) {
			total = 0L;
		}

		// 2) 分页查询：根据数据库方言选择分页语法。
		long offset = pageable.getOffset();
		int pageSize = pageable.getPageSize();

		// 处理排序：converter 已负责模板内占位符替换（如 $sort$），这里仅在 SQL 中没有显式 ORDER BY 时追加由 Pageable
		// 提供的排序。
		String sourceSql = prepared.sql == null ? "" : prepared.sql;
		String orderByClause = buildSortClause(pageable.getSort());
		if (!orderByClause.isEmpty() && !ORDER_BY_PATTERN.matcher(sourceSql).find()) {
			sourceSql = sourceSql + " " + orderByClause;
		}

		String dbProduct = "";
		int dbMajor = 0;
		try {
			if (jdbcTemplate.getDataSource() != null) {
				try (Connection conn = jdbcTemplate.getDataSource().getConnection()) {
					DatabaseMetaData md = conn.getMetaData();
					dbProduct = md.getDatabaseProductName() == null ? "" : md.getDatabaseProductName().toLowerCase();
					dbMajor = md.getDatabaseMajorVersion();
				}
			}
		} catch (Exception ignored) {
		}

		boolean isOceanbase = dbProduct.contains("oceanbase");
		boolean isOracle = dbProduct.contains("oracle") || isOceanbase;

		// Oracle / OceanBase (Oracle 模式) 使用 ROWNUM 包裹的通用写法
		if (isOracle) {
			String pagedSql = "SELECT * FROM (SELECT a.*, ROWNUM rnum FROM (" + sourceSql
					+ ") a WHERE ROWNUM <= ?) WHERE rnum > ?";
			Object[] pagedArgs = Arrays.copyOf(prepared.args, prepared.args.length + 2);
			pagedArgs[pagedArgs.length - 2] = offset + pageSize; // maxRow = offset + limit
			pagedArgs[pagedArgs.length - 1] = offset;
			List<Map<String, Object>> rows = jdbcTemplate.queryForList(pagedSql, pagedArgs);
			return new PageImpl<>(rows, pageable, total);
		}

		// Oracle 12+（非 OceanBase）支持 OFFSET ... FETCH
		if (dbProduct.contains("oracle") && dbMajor >= 12) {
			String pagedSql = sourceSql + " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
			Object[] pagedArgs = Arrays.copyOf(prepared.args, prepared.args.length + 2);
			pagedArgs[pagedArgs.length - 2] = offset;
			pagedArgs[pagedArgs.length - 1] = pageSize;
			List<Map<String, Object>> rows = jdbcTemplate.queryForList(pagedSql, pagedArgs);
			return new PageImpl<>(rows, pageable, total);
		}

		// 默认（MySQL/Postgres）
		String pagedSql = sourceSql + " LIMIT ? OFFSET ?";
		Object[] pagedArgs = Arrays.copyOf(prepared.args, prepared.args.length + 2);
		pagedArgs[pagedArgs.length - 2] = pageSize;
		pagedArgs[pagedArgs.length - 1] = offset;

		List<Map<String, Object>> rows = jdbcTemplate.queryForList(pagedSql, pagedArgs);
		return new PageImpl<>(rows, pageable, total);
	}
}
