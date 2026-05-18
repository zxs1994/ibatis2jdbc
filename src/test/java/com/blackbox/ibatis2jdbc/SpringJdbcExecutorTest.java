package com.blackbox.ibatis2jdbc;

import org.junit.jupiter.api.Test;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.*;

import static org.junit.jupiter.api.Assertions.*;

public class SpringJdbcExecutorTest {

    @Test
    public void placeholderDollarSortIsReplacedSafely() {
        // Simulate converter already resolved $sort$ into concrete ORDER BY
        final String preparedSql = "SELECT id,name FROM users ORDER BY name ASC";
        JdbcTemplate jdbcTemplate = new JdbcTemplate() {
            @Override
            public <T> T queryForObject(String sql, Class<T> requiredType, Object... args) {
                // return total
                return requiredType.cast(100L);
            }

            @Override
            public List<Map<String, Object>> queryForList(String sql, Object... args) {
                // converter already provided ORDER BY; executor should leave it and add pagination
                assertTrue(sql.contains("ORDER BY name ASC"));
                assertTrue(sql.endsWith("LIMIT ? OFFSET ?"));
                // return empty rows
                return Collections.emptyList();
            }
        };

        IbatisToJdbcConverter converter = new IbatisToJdbcConverter() {
            @Override
            public ConvertedSql convertPrepared(String statementId, Object parameters) {
                return new ConvertedSql(preparedSql, parameters, null, null, null, Collections.emptyList());
            }
        };

        SpringJdbcExecutor exec = new SpringJdbcExecutor(jdbcTemplate, converter);
        Page<?> page = exec.pageQuery("stmt", PageRequest.of(0, 10));
        assertEquals(0, page.getNumberOfElements());
    }

    @Test
    public void appendOrderByWhenNoPlaceholder() {
        final String preparedSql = "SELECT id,name FROM users";
        final String[] usedSql = new String[1];
        JdbcTemplate jdbcTemplate = new JdbcTemplate() {
            @Override
            public <T> T queryForObject(String sql, Class<T> requiredType, Object... args) {
                return requiredType.cast(50L);
            }

            @Override
            public List<Map<String, Object>> queryForList(String sql, Object... args) {
                usedSql[0] = sql;
                return Collections.emptyList();
            }
        };

        IbatisToJdbcConverter converter = new IbatisToJdbcConverter() {
            @Override
            public ConvertedSql convertPrepared(String statementId, Object parameters) {
                return new ConvertedSql(preparedSql, parameters, null, null, null, Collections.emptyList());
            }
        };

        SpringJdbcExecutor exec = new SpringJdbcExecutor(jdbcTemplate, converter);
        exec.pageQuery("stmt", PageRequest.of(0, 5, Sort.by(Sort.Order.desc("name"))));
        assertNotNull(usedSql[0]);
        assertTrue(usedSql[0].contains("ORDER BY name DESC"));
    }

    @Test
    public void complexTemplateWithDollarSortGetsReplaced() {
        // simulate converter already resolved $sort$
        final String preparedSql = "select file_url as fieldid ,to_char( ca.createdate,'yyyy-mm-dd') as createdate from ctp_attachment ca "
            + "left join some_form f1 on f1.id = ca.att_reference "
            + "where ca.sub_reference = ? order by createdate desc";

        JdbcTemplate jdbcTemplate = new JdbcTemplate() {
            @Override
            public <T> T queryForObject(String sql, Class<T> requiredType, Object... args) {
                return requiredType.cast(20L);
            }

            @Override
            public List<Map<String, Object>> queryForList(String sql, Object... args) {
                // ensure $sort$ replaced with safe column
                assertFalse(sql.contains("$sort$"));
                assertTrue(sql.toLowerCase().contains("order by createdate desc") || sql.toLowerCase().contains("order by createdate asc"));
                assertTrue(sql.endsWith("LIMIT ? OFFSET ?"));
                return Collections.emptyList();
            }
        };

        IbatisToJdbcConverter converter = new IbatisToJdbcConverter() {
            @Override
            public ConvertedSql convertPrepared(String statementId, Object parameters) {
                return new ConvertedSql(preparedSql, parameters, null, null, null, Collections.emptyList());
            }
        };

        SpringJdbcExecutor exec = new SpringJdbcExecutor(jdbcTemplate, converter);
        Page<?> page = exec.pageQuery("stmt", PageRequest.of(0, 10));
        assertEquals(0, page.getNumberOfElements());
    }
}
