package com.blackbox.ibatis2jdbc;

import org.junit.jupiter.api.Test;

import com.blackbox.ibatis2jdbc.TestParameterUtils.StatementMeta;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.lang.management.ManagementFactory;
import java.lang.management.ThreadMXBean;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import static org.junit.jupiter.api.Assertions.assertTrue;
import static com.blackbox.ibatis2jdbc.TestParameterUtils.resolveStatementMeta;
import static com.blackbox.ibatis2jdbc.TestParameterUtils.buildParameters;

class SqlMapClasspathScanPerformanceTest {
  private static final String REPORT_PROPERTY = "sqlmap.performance.report";
  private static final String DEFAULT_REPORT = "sqlmap-classpath-scan-full-report.md";
  private static final DateTimeFormatter DATETIME_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

  private final IbatisToJdbcConverter converter = new IbatisToJdbcConverter();

  @Test
  void scanAndTestAllLoadedStatementsWithPerformanceMetrics() throws Exception {
    String scanTarget = "classpath(java.class.path)";
    String testStartAt = LocalDateTime.now().format(DATETIME_FORMATTER);
    Path reportPath = resolveReportPath(System.getProperty(REPORT_PROPERTY));
    Path sqlPath = resolveSqlScriptPath(reportPath);

    // 采集机器参数
    String osName = System.getProperty("os.name", "");
    String osArch = System.getProperty("os.arch", "");
    String osVersion = System.getProperty("os.version", "");
    String javaVersion = System.getProperty("java.version", "");
    String javaVendor = System.getProperty("java.vendor", "");
    String javaHome = System.getProperty("java.home", "");
    int jvmAvailableProcessors = Runtime.getRuntime().availableProcessors();
    int hostLogicalProcessors = detectHostLogicalCpuCount();
    long jvmMaxMemory = Runtime.getRuntime().maxMemory();
    long hostTotalMemory = detectHostTotalMemoryBytes();
    String cpuInfo = getCpuInfo();

    ThreadMXBean threadMXBean = ManagementFactory.getThreadMXBean();
    boolean cpuSupported = threadMXBean.isCurrentThreadCpuTimeSupported();
    if (cpuSupported && !threadMXBean.isThreadCpuTimeEnabled()) {
      threadMXBean.setThreadCpuTimeEnabled(true);
    }

    System.gc();
    long memoryBefore = usedMemoryBytes();
    long scanWallStart = System.nanoTime();
    long scanCpuStart = cpuSupported ? threadMXBean.getCurrentThreadCpuTime() : -1L;

    converter.clearLoadedSqlMaps();
    int loadedStatementCount = converter.loadSqlMapsFromClasspath();

    long scanWallEnd = System.nanoTime();
    long scanCpuEnd = cpuSupported ? threadMXBean.getCurrentThreadCpuTime() : -1L;
    long memoryAfterScan = usedMemoryBytes();

    List<IbatisToJdbcConverter.LoadedStatementInfo> infos = converter.getLoadedStatementInfos();
    Set<String> scannedSources = new LinkedHashSet<>();
    for (IbatisToJdbcConverter.LoadedStatementInfo info : infos) {
      scannedSources.add(info.getSource());
    }
    long fileCount = scannedSources.size();

    // 不再需要documentCache
    List<CaseResult> results = new ArrayList<>();
    Map<String, XmlAggregate> xmlAggregates = new LinkedHashMap<>();

    long testWallStart = System.nanoTime();
    long testCpuStart = cpuSupported ? threadMXBean.getCurrentThreadCpuTime() : -1L;

    for (IbatisToJdbcConverter.LoadedStatementInfo info : infos) {
      String finalSql = null;
      String statementType = "unknown";
      long perStatementStart = System.nanoTime();
      boolean success = false;
      Throwable throwable = null;
      StatementMeta meta = null;
      Object parameters = null;
      try {
        meta = resolveStatementMeta(info);
        parameters = buildParameters(meta, true, 0);

        ConvertedSql convertedSql = converter.convertPrepared(info.getStatementId(), parameters);
        finalSql = convertedSql.toPreviewSql();
        statementType = convertedSql.getStatementType();

        assertTrue(finalSql != null && !finalSql.trim().isEmpty(), info.getStatementId() + " generated blank SQL");
        assertTrue(!IbatisXmlSupport.containsDynamicTagMarkup(finalSql) && !finalSql.contains("<![CDATA["),
            info.getStatementId() + " still contains XML/dynamic tags");
        assertSqlStructure(info.getStatementId(), finalSql);
        success = true;
      } catch (Throwable t) {
        throwable = t;
      } finally {
        long elapsed = Math.max(0L, System.nanoTime() - perStatementStart);
        XmlAggregate aggregate = xmlAggregates.get(info.getSource());
        if (aggregate == null) {
          aggregate = new XmlAggregate(info.getSource());
          xmlAggregates.put(info.getSource(), aggregate);
        }
        if (success) {
          results
              .add(CaseResult.success(info, statementType, parameters, info.getSqlMapXml(), finalSql,
                  elapsed));
        } else {
          results.add(CaseResult.failure(info, statementType, finalSql, throwable, elapsed));
        }
        CaseResult latest = results.get(results.size() - 1);
        aggregate.record(latest.success, elapsed);
      }
    }

    long testWallEnd = System.nanoTime();
    long testCpuEnd = cpuSupported ? threadMXBean.getCurrentThreadCpuTime() : -1L;

    System.gc();
    long memoryAfterAll = usedMemoryBytes();

    PerformanceMetrics scanMetrics = PerformanceMetrics.of(scanWallStart, scanWallEnd, scanCpuStart, scanCpuEnd,
        memoryBefore, memoryAfterScan, cpuSupported, jvmAvailableProcessors);
    PerformanceMetrics testMetrics = PerformanceMetrics.of(testWallStart, testWallEnd, testCpuStart, testCpuEnd,
        memoryAfterScan, memoryAfterAll, cpuSupported, jvmAvailableProcessors);

    writeReport(reportPath, sqlPath, scanTarget, fileCount, scannedSources.size(), loadedStatementCount,
        infos.size(), scanMetrics, testMetrics, xmlAggregates, results, testStartAt,
        LocalDateTime.now().format(DATETIME_FORMATTER),
        osName, osArch, osVersion, javaVersion, javaVendor, javaHome,
        jvmAvailableProcessors, hostLogicalProcessors, jvmMaxMemory, hostTotalMemory, cpuInfo);

    assertTrue(loadedStatementCount > 0, "No statementId loaded from classpath.");
    assertTrue(!results.isEmpty(), "No statementId was tested from classpath.");
  }

  private Path resolveReportPath(String reportProperty) {
    if (reportProperty == null || reportProperty.trim().isEmpty()) {
      return Paths.get(DEFAULT_REPORT);
    }
    return Paths.get(reportProperty.trim());
  }

  private Path resolveSqlScriptPath(Path markdownPath) {
    String fileName = markdownPath.getFileName().toString();
    String sqlName = fileName.endsWith(".md") ? fileName.substring(0, fileName.length() - 3) + ".sql"
        : fileName + ".sql";
    Path parent = markdownPath.getParent();
    return parent == null ? Paths.get(sqlName) : parent.resolve(sqlName);
  }

  private long usedMemoryBytes() {
    Runtime runtime = Runtime.getRuntime();
    return runtime.totalMemory() - runtime.freeMemory();
  }

  private void assertSqlStructure(String statementId, String sql) {
    String issue = findSqlStructureIssue(sql);
    assertTrue(issue == null, statementId + " generated SQL with " + issue + ": " + sql);
  }

  // 获取 CPU 信息（仅支持部分平台，macOS/Linux）
  private static String getCpuInfo() {
    String os = System.getProperty("os.name", "").toLowerCase(Locale.ROOT);
    if (os.contains("mac")) {
      try {
        Process p = Runtime.getRuntime().exec(new String[] { "sysctl", "-n", "machdep.cpu.brand_string" });
        java.io.BufferedReader r = new java.io.BufferedReader(new java.io.InputStreamReader(p.getInputStream()));
        String line = r.readLine();
        r.close();
        return line != null ? line.trim() : "";
      } catch (Exception ignored) {
        return "";
      }
    } else if (os.contains("linux")) {
      try {
        java.util.List<String> lines = java.nio.file.Files.readAllLines(java.nio.file.Paths.get("/proc/cpuinfo"));
        for (String line : lines) {
          if (line.toLowerCase(Locale.ROOT).contains("model name")) {
            return line.split(":", 2)[1].trim();
          }
        }
      } catch (Exception ignored) {
        return "";
      }
    }
    return "";
  }

  private static int detectHostLogicalCpuCount() {
    String os = System.getProperty("os.name", "").toLowerCase(Locale.ROOT);
    try {
      if (os.contains("mac")) {
        Process p = Runtime.getRuntime().exec(new String[] { "sysctl", "-n", "hw.logicalcpu" });
        java.io.BufferedReader r = new java.io.BufferedReader(new java.io.InputStreamReader(p.getInputStream()));
        String line = r.readLine();
        r.close();
        if (line != null && !line.trim().isEmpty()) {
          return Integer.parseInt(line.trim());
        }
      } else if (os.contains("linux")) {
        return Runtime.getRuntime().availableProcessors();
      }
    } catch (Exception ignored) {
      return -1;
    }
    return -1;
  }

  private static long detectHostTotalMemoryBytes() {
    String os = System.getProperty("os.name", "").toLowerCase(Locale.ROOT);
    try {
      if (os.contains("mac")) {
        Process p = Runtime.getRuntime().exec(new String[] { "sysctl", "-n", "hw.memsize" });
        java.io.BufferedReader r = new java.io.BufferedReader(new java.io.InputStreamReader(p.getInputStream()));
        String line = r.readLine();
        r.close();
        if (line != null && !line.trim().isEmpty()) {
          return Long.parseLong(line.trim());
        }
      } else if (os.contains("linux")) {
        java.util.List<String> lines = java.nio.file.Files.readAllLines(java.nio.file.Paths.get("/proc/meminfo"));
        for (String line : lines) {
          if (line.startsWith("MemTotal:")) {
            String[] parts = line.trim().split("\\s+");
            if (parts.length >= 2) {
              return Long.parseLong(parts[1]) * 1024L;
            }
          }
        }
      }
    } catch (Exception ignored) {
      return -1L;
    }
    return -1L;
  }

  private String findSqlStructureIssue(String sql) {
    int parenthesesDepth = 0;
    boolean inSingleQuote = false;
    boolean inDoubleQuote = false;
    for (int i = 0; i < sql.length(); i++) {
      char current = sql.charAt(i);
      if (current == '\'' && !inDoubleQuote) {
        if (inSingleQuote && i + 1 < sql.length() && sql.charAt(i + 1) == '\'') {
          i++;
          continue;
        }
        inSingleQuote = !inSingleQuote;
        continue;
      }
      if (current == '"' && !inSingleQuote) {
        inDoubleQuote = !inDoubleQuote;
        continue;
      }
      if (inSingleQuote || inDoubleQuote) {
        continue;
      }
      if (current == '(') {
        parenthesesDepth++;
        continue;
      }
      if (current == ')') {
        parenthesesDepth--;
        if (parenthesesDepth < 0) {
          return "extra closing parenthesis";
        }
      }
    }

    if (inSingleQuote) {
      return "unclosed single quote";
    }
    if (inDoubleQuote) {
      return "unclosed double quote";
    }
    if (parenthesesDepth != 0) {
      return "unbalanced parentheses";
    }
    return null;
  }

  private void writeReport(Path reportPath, Path sqlPath, String scanRoot, long fileCount, int sourceCount,
      int loadedStatementCount, int testedStatementCount, PerformanceMetrics scanMetrics,
      PerformanceMetrics testMetrics,
      Map<String, XmlAggregate> xmlAggregates,
      List<CaseResult> results, String testStartAt, String testEndAt,
      String osName, String osArch, String osVersion, String javaVersion, String javaVendor, String javaHome,
      int jvmAvailableProcessors, int hostLogicalProcessors, long jvmMaxMemory, long hostTotalMemory,
      String cpuInfo) throws IOException {
    long passed = 0;
    long failed = 0;
    for (CaseResult result : results) {
      if (result.success) {
        passed++;
      } else {
        failed++;
      }
    }

    StringBuilder md = new StringBuilder();
    StringBuilder sql = new StringBuilder();

    md.append("# SQLMap 全量扫描与转换性能报告\n\n");
    md.append("## 测试时间\n\n");
    md.append("- 开始时间：").append(testStartAt).append("\n");
    md.append("- 结束时间：").append(testEndAt).append("\n\n");
    md.append("## 机器参数\n\n");
    md.append("- 操作系统：").append(osName).append(" ").append(osArch).append(" ").append(osVersion).append("\n");
    md.append("- Java 版本：").append(javaVersion).append(" (" + javaVendor + ")\n");
    md.append("- Java Home：").append(javaHome).append("\n");
    md.append("- JVM 可见 CPU 核心数：").append(jvmAvailableProcessors).append("\n");
    if (hostLogicalProcessors > 0) {
      md.append("- 机器逻辑 CPU 核心数：").append(hostLogicalProcessors).append("\n");
    }
    md.append("- JVM 最大堆内存(MB)：").append(String.format("%.2f", jvmMaxMemory / (1024.0 * 1024.0))).append("\n");
    if (hostTotalMemory > 0) {
      md.append("- 机器物理内存(MB)：").append(String.format("%.2f", hostTotalMemory / (1024.0 * 1024.0))).append("\n");
    }
    if (cpuInfo != null && !cpuInfo.isEmpty()) {
      md.append("- CPU 信息：").append(cpuInfo).append("\n");
    }
    md.append("\n");
    md.append("## 扫描与测试统计\n\n");
    md.append("- 扫描根路径：").append(scanRoot).append("\n");
    md.append("- 扫描到 sqlmap 文件数：").append(fileCount).append("\n");
    md.append("- 实际加载来源数：").append(sourceCount).append("\n");
    md.append("- 存储 statementId 数：").append(loadedStatementCount).append("\n");
    md.append("- 实际测试 statementId 数：").append(testedStatementCount).append("\n");
    md.append("- 通过：").append(passed).append("\n");
    md.append("- 失败：").append(failed).append("\n\n");

    md.append("## 扫描阶段性能\n\n");
    md.append("- 耗时(ms)：").append(scanMetrics.wallMillis).append("\n");
    md.append("- CPU 时间(ms)：").append(scanMetrics.cpuMillis).append("\n");
    md.append("- 线程CPU占用(%)：").append(scanMetrics.cpuPercentText).append(" （当前测试线程口径）\n");
    md.append("- 折算整机CPU占用(%)：").append(scanMetrics.cpuHostPercentText)
        .append(" （线程CPU占用/可见核心数）\n");
    md.append("- 内存变化(MB)：").append(scanMetrics.memoryDeltaMbText).append("\n\n");

    md.append("## 按 XML 维度转换统计\n\n");
    md.append("| XML 来源 | statement 数 | 通过 | 失败 | 转换耗时(ms) |\n");
    md.append("|---|---:|---:|---:|---:|\n");
    for (XmlAggregate aggregate : xmlAggregates.values()) {
      md.append("|").append(escapeMarkdownCell(displaySource(aggregate.source)))
          .append("|").append(aggregate.total)
          .append("|").append(aggregate.passed)
          .append("|").append(aggregate.failed)
          .append("|").append(aggregate.elapsedNanos / 1_000_000L)
          .append("|\n");
    }
    md.append("\n");

    sql.append("-- SQLMap 全量扫描与转换测试 SQL\n");
    sql.append("-- test start: ").append(testStartAt).append("\n");
    sql.append("-- test end: ").append(testEndAt).append("\n");
    sql.append("-- scan root: ").append(scanRoot).append("\n");
    sql.append("-- file count: ").append(fileCount).append("\n");
    sql.append("-- source count: ").append(sourceCount).append("\n");
    sql.append("-- statementId count: ").append(loadedStatementCount).append("\n");
    sql.append("-- tested statementId count: ").append(testedStatementCount).append("\n");
    sql.append("-- pass: ").append(passed).append("\n");
    sql.append("-- fail: ").append(failed).append("\n\n");

    sql.append("-- per-xml conversion summary\n");
    for (XmlAggregate aggregate : xmlAggregates.values()) {
      sql.append("-- source: ").append(displaySource(aggregate.source)).append("\n");
      sql.append("-- statement count: ").append(aggregate.total).append("\n");
      sql.append("-- pass: ").append(aggregate.passed).append("\n");
      sql.append("-- fail: ").append(aggregate.failed).append("\n");
      sql.append("-- elapsed(ms): ").append(aggregate.elapsedNanos / 1_000_000L).append("\n\n");
    }

    for (CaseResult result : results) {
      md.append("## ").append(result.statementId).append("\n\n");
      md.append("- lookupStatementId：").append(result.lookupStatementId).append("\n");
      md.append("- source：").append(displaySource(result.source)).append("\n");
      md.append("- statement 类型：").append(result.statementType).append("\n");
      md.append("- 转换耗时(ms)：").append(result.elapsedNanos / 1_000_000L).append("\n");
      md.append("- 入参：\n\n```text\n").append(result.parametersText).append("\n```\n");
      md.append("- 结果：").append(result.success ? "通过" : "失败").append("\n");
      md.append("- 原始 XML：\n\n```xml\n").append(result.originalXml).append("\n```\n");
      if (result.finalSql != null && !result.finalSql.trim().isEmpty()) {
        md.append("- 最终 SQL：\n\n```sql\n").append(result.finalSql).append("\n```\n");
      }
      if (!result.success) {
        md.append("- 错误：\n\n```text\n").append(result.errorMessage).append("\n```\n");
      }
      md.append("\n");

      sql.append("-- statementId: ").append(result.statementId).append("\n");
      sql.append("-- lookupStatementId: ").append(result.lookupStatementId).append("\n");
      sql.append("-- source: ").append(displaySource(result.source)).append("\n");
      sql.append("-- type: ").append(result.statementType).append("\n");
      appendSqlCommentBlock(sql, "-- params: ", result.parametersText);
      if (result.finalSql != null && !result.finalSql.trim().isEmpty()) {
        sql.append(ensureSqlTerminator(result.finalSql)).append("\n");
      }
      if (!result.success) {
        appendSqlCommentBlock(sql, "-- error: ", result.errorMessage);
      }
      sql.append("\n");
    }

    Files.write(reportPath, md.toString().getBytes(StandardCharsets.UTF_8));
    Files.write(sqlPath, sql.toString().getBytes(StandardCharsets.UTF_8));
  }

  private String escapeMarkdownCell(String value) {
    if (value == null) {
      return "";
    }
    return value.replace("|", "\\|");
  }

  private void appendSqlCommentBlock(StringBuilder sqlBuilder, String prefix, String value) {
    String normalized = value == null ? "" : value.replace("\r\n", "\n").replace('\r', '\n');
    String[] lines = normalized.split("\n", -1);
    for (String line : lines) {
      sqlBuilder.append(prefix).append(line).append("\n");
      prefix = "-- ";
    }
  }

  private String ensureSqlTerminator(String sql) {
    String trimmed = sql == null ? "" : sql.trim();
    if (trimmed.isEmpty() || trimmed.endsWith(";")) {
      return trimmed;
    }
    return trimmed + ";";
  }

  private String displaySource(String source) {
    if (source == null || source.trim().isEmpty()) {
      return "";
    }

    String normalized = source.trim();
    int bangIndex = normalized.lastIndexOf('!');
    if (bangIndex >= 0 && bangIndex < normalized.length() - 1) {
      normalized = normalized.substring(bangIndex + 1);
    }

    normalized = normalized.replace('\\', '/');
    int slashIndex = normalized.lastIndexOf('/');
    if (slashIndex >= 0 && slashIndex < normalized.length() - 1) {
      return normalized.substring(slashIndex + 1);
    }
    return normalized;
  }

  private static final class Placeholder {
    private final String name;
    private final char marker;

    private Placeholder(String name, char marker) {
      this.name = name;
      this.marker = marker;
    }
  }

  private static final class CaseResult {
    private final String statementId;
    private final String lookupStatementId;
    private final String source;
    private final String statementType;
    private final String parametersText;
    private final boolean success;
    private final String originalXml;
    private final String finalSql;
    private final String errorMessage;
    private final long elapsedNanos;

    private CaseResult(String statementId, String lookupStatementId, String source, String statementType,
        String parametersText, boolean success, String originalXml, String finalSql, String errorMessage,
        long elapsedNanos) {
      this.statementId = statementId;
      this.lookupStatementId = lookupStatementId;
      this.source = source;
      this.statementType = statementType;
      this.parametersText = parametersText;
      this.success = success;
      this.originalXml = originalXml;
      this.finalSql = finalSql;
      this.errorMessage = errorMessage;
      this.elapsedNanos = elapsedNanos;
    }

    private static CaseResult success(IbatisToJdbcConverter.LoadedStatementInfo info, String statementType,
        Object parameters, String originalXml, String finalSql, long elapsedNanos) {
      return new CaseResult(info.getStatementId(), info.getLookupStatementId(), info.getSource(), statementType,
          stringify(parameters), true, originalXml, finalSql, null, elapsedNanos);
    }

    private static CaseResult failure(IbatisToJdbcConverter.LoadedStatementInfo info, String statementType,
        String finalSql, Throwable throwable, long elapsedNanos) {
      return new CaseResult(info.getStatementId(), info.getLookupStatementId(), info.getSource(), statementType,
          "", false, "", finalSql, throwable == null ? "" : throwable.toString(), elapsedNanos);
    }

    private static String stringify(Object value) {
      return formatValue(value, 0);
    }

    private static String formatValue(Object v, int depth) {
      if (v == null) {
        return "null";
      }
      if (v instanceof String) {
        return '"' + escapeJson(v.toString()) + '"';
      }
      if (v instanceof Number || v instanceof Boolean) {
        return String.valueOf(v);
      }
      if (v instanceof Map<?, ?>) {
        return formatMap((Map<?, ?>) v, depth);
      }
      if (v instanceof Collection<?>) {
        return formatCollection((Collection<?>) v, depth);
      }
      if (v.getClass().isArray()) {
        return formatArray(v, depth);
      }
      return '"' + escapeJson(String.valueOf(v)) + '"';
    }

    private static String formatMap(Map<?, ?> map, int depth) {
      if (map.isEmpty()) {
        return "{}";
      }
      StringBuilder sb = new StringBuilder("{\n");
      boolean first = true;
      for (Map.Entry<?, ?> entry : map.entrySet()) {
        if (!first) {
          sb.append(",\n");
        }
        first = false;
        sb.append(indent(depth + 1))
            .append('"').append(escapeJson(String.valueOf(entry.getKey()))).append('"')
            .append(": ")
            .append(formatValue(entry.getValue(), depth + 1));
      }
      sb.append('\n').append(indent(depth)).append('}');
      return sb.toString();
    }

    private static String formatCollection(Collection<?> collection, int depth) {
      if (collection.isEmpty()) {
        return "[]";
      }
      StringBuilder sb = new StringBuilder("[\n");
      boolean first = true;
      for (Object item : collection) {
        if (!first) {
          sb.append(",\n");
        }
        first = false;
        sb.append(indent(depth + 1)).append(formatValue(item, depth + 1));
      }
      sb.append('\n').append(indent(depth)).append(']');
      return sb.toString();
    }

    private static String formatArray(Object array, int depth) {
      int length = java.lang.reflect.Array.getLength(array);
      if (length == 0) {
        return "[]";
      }
      StringBuilder sb = new StringBuilder("[\n");
      for (int i = 0; i < length; i++) {
        if (i > 0) {
          sb.append(",\n");
        }
        sb.append(indent(depth + 1)).append(formatValue(java.lang.reflect.Array.get(array, i), depth + 1));
      }
      sb.append('\n').append(indent(depth)).append(']');
      return sb.toString();
    }

    private static String indent(int depth) {
      int safeDepth = Math.max(0, depth);
      StringBuilder builder = new StringBuilder(safeDepth * 2);
      for (int i = 0; i < safeDepth; i++) {
        builder.append("  ");
      }
      return builder.toString();
    }

    private static String escapeJson(String text) {
      return text
          .replace("\\", "\\\\")
          .replace("\"", "\\\"")
          .replace("\n", "\\n")
          .replace("\r", "\\r")
          .replace("\t", "\\t");
    }
  }

  private static final class PerformanceMetrics {
    private final long wallMillis;
    private final long cpuMillis;
    private final String cpuPercentText;
    private final String cpuHostPercentText;
    private final String memoryDeltaMbText;

    private PerformanceMetrics(long wallMillis, long cpuMillis, String cpuPercentText,
        String cpuHostPercentText, String memoryDeltaMbText) {
      this.wallMillis = wallMillis;
      this.cpuMillis = cpuMillis;
      this.cpuPercentText = cpuPercentText;
      this.cpuHostPercentText = cpuHostPercentText;
      this.memoryDeltaMbText = memoryDeltaMbText;
    }

    private static PerformanceMetrics of(long wallStart, long wallEnd, long cpuStart, long cpuEnd,
        long memoryStart, long memoryEnd, boolean cpuSupported, int coreCount) {
      long wallNanos = Math.max(0L, wallEnd - wallStart);
      long wallMillis = wallNanos / 1_000_000L;

      long cpuNanos = 0L;
      if (cpuSupported && cpuStart >= 0L && cpuEnd >= cpuStart) {
        cpuNanos = cpuEnd - cpuStart;
      }
      long cpuMillis = cpuNanos / 1_000_000L;

      String cpuPercentText = "N/A";
      String cpuHostPercentText = "N/A";
      if (cpuSupported && wallNanos > 0L) {
        double percent = (cpuNanos * 100.0d) / wallNanos;
        cpuPercentText = String.format(Locale.ROOT, "%.2f", percent);
        if (coreCount > 0) {
          double hostPercent = percent / coreCount;
          cpuHostPercentText = String.format(Locale.ROOT, "%.2f", hostPercent);
        }
      }

      long memoryDelta = memoryEnd - memoryStart;
      double mb = memoryDelta / (1024.0d * 1024.0d);
      String memoryDeltaMbText = String.format(Locale.ROOT, "%.2f", mb);

      return new PerformanceMetrics(wallMillis, cpuMillis, cpuPercentText, cpuHostPercentText, memoryDeltaMbText);
    }
  }

  private static final class XmlAggregate {
    private final String source;
    private long total;
    private long passed;
    private long failed;
    private long elapsedNanos;

    private XmlAggregate(String source) {
      this.source = source;
      this.total = 0L;
      this.passed = 0L;
      this.failed = 0L;
      this.elapsedNanos = 0L;
    }

    private void record(boolean success, long elapsed) {
      total++;
      if (success) {
        passed++;
      } else {
        failed++;
      }
      elapsedNanos += elapsed;
    }
  }
}
