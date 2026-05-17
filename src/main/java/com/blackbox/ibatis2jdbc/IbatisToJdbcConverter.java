package com.blackbox.ibatis2jdbc;

import org.springframework.stereotype.Component;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import javax.xml.XMLConstants;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.StringWriter;
import java.io.StringReader;
import java.lang.reflect.Array;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.jar.JarEntry;
import java.util.jar.JarFile;

import org.xml.sax.InputSource;

/**
 * 核心转换器类，负责将 iBatis SQL Map XML 中的 statement 元素转换为 JDBC 可执行的 SQL 语句。
 * <p>
 * 设计目标：
 * 1. 提供一个线程安全的实现，允许在多线程环境中同时加载 SQL Maps 和执行转换。
 * 2. 支持从 classpath 中扫描并加载多个 SQL Map XML 文件，建立高效的内存索引以快速定位 statement。
 * 3. 实现核心的 prepared 模式转换逻辑，将 iBatis 的 #{} 占位符替换为 JDBC 的 ?，并按顺序收集绑定值。
 * 4. 预留对动态 SQL 标签（如 <if>、<choose> 等）的支持，以便未来扩展更复杂的转换功能。
 */
@Component
public class IbatisToJdbcConverter {
	private volatile IndexSnapshot activeSnapshot = IndexSnapshot.empty();

	// 先调用 loadSqlMapsFromClasspath 后，可仅传 statementId + parameters 生成
	// PreparedStatement SQL。
	public ConvertedSql convertPrepared(String statementId, Object parameters) {
		IndexSnapshot snapshot = activeSnapshot;
		StatementReference statementReference = snapshot.statementIndex.get(statementId);
		if (statementReference == null) {
			throw new IllegalStateException(
					"Cannot find statementId in memory index: " + statementId
							+ ". Please call loadSqlMapsFromClasspath() first.");
		}
		Object normalizedParameters = normalizeParametersForIbatis2(statementReference.parameterClass, parameters,
				statementReference.lookupStatementId);
		List<Object> bindingCollector = new ArrayList<>();
		ConvertedSql result = convertCore(statementReference.sqlMapXml, statementReference.lookupStatementId,
				snapshot.sqlFragmentIndex,
				snapshot.resultMapIndex,
				normalizedParameters,
				bindingCollector);
		return new ConvertedSql(result.getSql(), normalizedParameters, result.getStatementType(),
				result.getResultClass(), result.getResultMapId(), Collections.unmodifiableList(bindingCollector));
	}

	/**
	 * 在执行 SQL 渲染前，对入参按 iBatis2 的 parameterClass 做类型校验与归一化。
	 * 目的：将类型错配尽早在应用层 fail-fast，避免在 JDBC/数据库阶段才暴露异常。
	 * 规则：
	 * 1) 未声明 parameterClass 或参数为 null 时直接放行；
	 * 2) map/collection/array 按契约严格校验；
	 * 3) string/number/boolean/char 支持有限可控的类型转换；
	 * 4) 不可转换时抛出带 statementId 的 IllegalArgumentException。
	 */
	private Object normalizeParametersForIbatis2(String declaredParameterClass, Object parameters, String statementId) {
		if (isBlank(declaredParameterClass) || parameters == null) {
			return parameters;
		}

		Class<?> expectedType = resolveIbatisParameterClass(declaredParameterClass);
		if (expectedType == null) {
			return parameters;
		}

		if (Map.class.isAssignableFrom(expectedType)) {
			if (parameters instanceof Map<?, ?>) {
				return parameters;
			}
			if (isSimpleParameterValue(parameters) || parameters instanceof Collection<?>
					|| parameters.getClass().isArray()) {
				throw new IllegalArgumentException("Parameter type mismatch for statement '" + statementId
						+ "': expected map-like object but got " + parameters.getClass().getName());
			}
			// iBatis2 兼容：parameterClass=map 时仍允许 Bean 参数，按属性路径读取。
			return parameters;
		}

		if (Collection.class.isAssignableFrom(expectedType)) {
			if (parameters instanceof Collection<?>) {
				return parameters;
			}
			throw new IllegalArgumentException("Parameter type mismatch for statement '" + statementId
					+ "': expected collection but got " + parameters.getClass().getName());
		}

		if (expectedType.isArray()) {
			if (parameters.getClass().isArray()) {
				return coerceArray(parameters, expectedType.getComponentType(), statementId);
			}
			throw new IllegalArgumentException("Parameter type mismatch for statement '" + statementId
					+ "': expected array but got " + parameters.getClass().getName());
		}

		if (expectedType == String.class) {
			return String.valueOf(parameters);
		}

		if (isNumericType(expectedType)) {
			return coerceNumber(parameters, expectedType, statementId);
		}

		if (expectedType == Boolean.class) {
			return coerceBoolean(parameters, statementId);
		}

		if (expectedType == Character.class) {
			return coerceCharacter(parameters, statementId);
		}

		if (!expectedType.isInstance(parameters)) {
			throw new IllegalArgumentException("Parameter type mismatch for statement '" + statementId
					+ "': expected " + expectedType.getName() + " but got " + parameters.getClass().getName());
		}

		return parameters;
	}

	/**
	 * 解析 iBatis parameterClass 声明的类型，支持常见别名和数组语法。
	 * 
	 * @param declaredType 声明的类型字符串
	 * @return 对应的 Class 对象，如果无法解析则返回 null（保持与 iBatis2 兼容：未知别名不强制校验）。
	 */
	private Class<?> resolveIbatisParameterClass(String declaredType) {
		String normalized = declaredType == null ? "" : declaredType.trim();
		if (normalized.isEmpty()) {
			return null;
		}
		String lower = normalized.toLowerCase(Locale.ROOT);
		switch (lower) {
			case "map":
			case "java.util.map":
			case "hashmap":
			case "java.util.hashmap":
				return Map.class;
			case "list":
			case "java.util.list":
			case "arraylist":
			case "java.util.arraylist":
				return List.class;
			case "collection":
			case "java.util.collection":
				return Collection.class;
			case "string":
			case "java.lang.string":
				return String.class;
			case "long":
			case "java.lang.long":
				return Long.class;
			case "int":
			case "integer":
			case "java.lang.integer":
				return Integer.class;
			case "short":
			case "java.lang.short":
				return Short.class;
			case "byte":
			case "java.lang.byte":
				return Byte.class;
			case "double":
			case "java.lang.double":
				return Double.class;
			case "float":
			case "java.lang.float":
				return Float.class;
			case "boolean":
			case "java.lang.boolean":
				return Boolean.class;
			case "char":
			case "character":
			case "java.lang.character":
				return Character.class;
			default:
				break;
		}

		if (normalized.endsWith("[]")) {
			Class<?> componentType = resolveIbatisParameterClass(normalized.substring(0, normalized.length() - 2));
			if (componentType == null) {
				try {
					componentType = Class.forName(normalized.substring(0, normalized.length() - 2));
				} catch (ClassNotFoundException ignored) {
					return null;
				}
			}
			return Array.newInstance(componentType, 0).getClass();
		}

		try {
			if ("long".equals(normalized)) {
				return Long.class;
			}
			if ("int".equals(normalized)) {
				return Integer.class;
			}
			if ("short".equals(normalized)) {
				return Short.class;
			}
			if ("byte".equals(normalized)) {
				return Byte.class;
			}
			if ("double".equals(normalized)) {
				return Double.class;
			}
			if ("float".equals(normalized)) {
				return Float.class;
			}
			if ("boolean".equals(normalized)) {
				return Boolean.class;
			}
			if ("char".equals(normalized)) {
				return Character.class;
			}
			return Class.forName(normalized);
		} catch (ClassNotFoundException ignored) {
			// 保持与 iBatis2 兼容：无法解析的别名不强制校验。
			return null;
		}
	}

	private boolean isNumericType(Class<?> type) {
		return type == Byte.class || type == Short.class || type == Integer.class || type == Long.class
				|| type == Float.class || type == Double.class || type == BigDecimal.class || type == BigInteger.class;
	}

	private Object coerceNumber(Object value, Class<?> targetType, String statementId) {
		if (value instanceof Number) {
			Number number = (Number) value;
			if (targetType == Byte.class) {
				return number.byteValue();
			}
			if (targetType == Short.class) {
				return number.shortValue();
			}
			if (targetType == Integer.class) {
				return number.intValue();
			}
			if (targetType == Long.class) {
				return number.longValue();
			}
			if (targetType == Float.class) {
				return number.floatValue();
			}
			if (targetType == Double.class) {
				return number.doubleValue();
			}
			if (targetType == BigDecimal.class) {
				return new BigDecimal(String.valueOf(number));
			}
			if (targetType == BigInteger.class) {
				return BigInteger.valueOf(number.longValue());
			}
		}

		if (value instanceof CharSequence) {
			String text = String.valueOf(value).trim();
			if (text.isEmpty()) {
				throw new IllegalArgumentException("Parameter type mismatch for statement '" + statementId
						+ "': empty string cannot be converted to number");
			}
			try {
				if (targetType == Byte.class) {
					return Byte.valueOf(text);
				}
				if (targetType == Short.class) {
					return Short.valueOf(text);
				}
				if (targetType == Integer.class) {
					return Integer.valueOf(text);
				}
				if (targetType == Long.class) {
					return Long.valueOf(text);
				}
				if (targetType == Float.class) {
					return Float.valueOf(text);
				}
				if (targetType == Double.class) {
					return Double.valueOf(text);
				}
				if (targetType == BigDecimal.class) {
					return new BigDecimal(text);
				}
				if (targetType == BigInteger.class) {
					return new BigInteger(text);
				}
			} catch (NumberFormatException exception) {
				throw new IllegalArgumentException("Parameter type mismatch for statement '" + statementId
						+ "': cannot convert value '" + value + "' to " + targetType.getSimpleName(), exception);
			}
		}

		throw new IllegalArgumentException("Parameter type mismatch for statement '" + statementId
				+ "': expected numeric value for " + targetType.getSimpleName() + " but got "
				+ value.getClass().getName());
	}

	private Boolean coerceBoolean(Object value, String statementId) {
		if (value instanceof Boolean) {
			return (Boolean) value;
		}
		if (value instanceof Number) {
			return ((Number) value).intValue() != 0;
		}
		if (value instanceof CharSequence) {
			String text = String.valueOf(value).trim().toLowerCase(Locale.ROOT);
			if ("true".equals(text) || "1".equals(text) || "y".equals(text) || "yes".equals(text)) {
				return true;
			}
			if ("false".equals(text) || "0".equals(text) || "n".equals(text) || "no".equals(text)) {
				return false;
			}
		}
		throw new IllegalArgumentException("Parameter type mismatch for statement '" + statementId
				+ "': cannot convert value '" + value + "' to Boolean");
	}

	private Character coerceCharacter(Object value, String statementId) {
		if (value instanceof Character) {
			return (Character) value;
		}
		if (value instanceof CharSequence) {
			String text = String.valueOf(value);
			if (text.length() == 1) {
				return text.charAt(0);
			}
		}
		throw new IllegalArgumentException("Parameter type mismatch for statement '" + statementId
				+ "': cannot convert value '" + value + "' to Character");
	}

	private Object coerceArray(Object sourceArray, Class<?> componentType, String statementId) {
		int length = Array.getLength(sourceArray);
		Object targetArray = Array.newInstance(componentType, length);
		for (int i = 0; i < length; i++) {
			Object value = Array.get(sourceArray, i);
			if (value == null) {
				Array.set(targetArray, i, null);
				continue;
			}
			Object converted = value;
			if (componentType == String.class) {
				converted = String.valueOf(value);
			} else if (isNumericType(componentType)) {
				converted = coerceNumber(value, componentType, statementId);
			} else if (componentType == Boolean.class) {
				converted = coerceBoolean(value, statementId);
			} else if (componentType == Character.class) {
				converted = coerceCharacter(value, statementId);
			} else if (!componentType.isInstance(value)) {
				throw new IllegalArgumentException("Parameter type mismatch for statement '" + statementId
						+ "': array element expected " + componentType.getName() + " but got "
						+ value.getClass().getName());
			}
			Array.set(targetArray, i, converted);
		}
		return targetArray;
	}

	/**
	 * 扫描 classpath 内所有 *_sqlmap.xml 资源并建立 statementId 索引。
	 * 如果 fileOrDirPaths 为空，则默认扫描 classpath。
	 * 否则只扫描指定的文件或目录（可为单个 xml 文件、目录、jar 包）。
	 * 目录/jar 扫描只匹配 *_sqlmap.xml；仅在显式传入单个文件时允许任意 .xml。
	 */
	public synchronized int loadSqlMapsFromClasspath(String... fileOrDirPaths) {
		Map<String, StatementReference> nextStatementIndex = new LinkedHashMap<>();
		Map<String, Element> nextSqlFragmentIndex = new LinkedHashMap<>();
		Map<String, Map<String, String>> nextResultMapIndex = new LinkedHashMap<>();
		Set<String> visitedSources = new HashSet<>();
		if (fileOrDirPaths == null || fileOrDirPaths.length == 0) {
			String classPath = System.getProperty("java.class.path", "");
			if (isBlank(classPath)) {
				activeSnapshot = IndexSnapshot.empty();
				return 0;
			}
			String[] entries = classPath.split(File.pathSeparator);
			for (String entry : entries) {
				if (isBlank(entry)) {
					continue;
				}
				Path path = Paths.get(entry);
				if (Files.isDirectory(path)) {
					loadSqlMapsFromDirectory(path, visitedSources, nextStatementIndex, nextSqlFragmentIndex,
							nextResultMapIndex);
				} else if (Files.isRegularFile(path) && entry.toLowerCase(Locale.ROOT).endsWith(".jar")) {
					loadSqlMapsFromJar(path, visitedSources, nextStatementIndex, nextSqlFragmentIndex,
							nextResultMapIndex);
				}
			}
		} else {
			for (String fileOrDir : fileOrDirPaths) {
				if (isBlank(fileOrDir))
					continue;
				Path path = Paths.get(fileOrDir);
				if (Files.isDirectory(path)) {
					loadSqlMapsFromDirectory(path, visitedSources, nextStatementIndex, nextSqlFragmentIndex,
							nextResultMapIndex);
				} else if (Files.isRegularFile(path)) {
					String name = path.getFileName().toString().toLowerCase(Locale.ROOT);
					if (name.endsWith(".xml")) {
						try {
							String xml = new String(Files.readAllBytes(path), StandardCharsets.UTF_8);
							registerStatements(xml, path.toAbsolutePath().toString(), nextStatementIndex,
									nextSqlFragmentIndex,
									nextResultMapIndex);
						} catch (IOException exception) {
							throw new IllegalStateException("Failed to read sqlmap xml: " + path, exception);
						}
					} else if (name.endsWith(".jar")) {
						loadSqlMapsFromJar(path, visitedSources, nextStatementIndex, nextSqlFragmentIndex,
								nextResultMapIndex);
					}
				}
			}
		}
		activeSnapshot = IndexSnapshot.of(nextStatementIndex, nextSqlFragmentIndex, nextResultMapIndex);
		return nextStatementIndex.size();
	}

	public synchronized void clearLoadedSqlMaps() {
		activeSnapshot = IndexSnapshot.empty();
	}

	public synchronized int getLoadedStatementCount() {
		return activeSnapshot.statementIndex.size();
	}

	public synchronized int getLoadedSqlMapSourceCount() {
		IndexSnapshot snapshot = activeSnapshot;
		Set<String> sources = new LinkedHashSet<>();
		for (StatementReference reference : snapshot.statementIndex.values()) {
			sources.add(reference.source);
		}
		return sources.size();
	}

	public synchronized Set<String> getLoadedStatementIds() {
		return new LinkedHashSet<>(activeSnapshot.statementIndex.keySet());
	}

	public synchronized List<LoadedStatementInfo> getLoadedStatementInfos() {
		IndexSnapshot snapshot = activeSnapshot;
		List<LoadedStatementInfo> infos = new ArrayList<>();
		for (Map.Entry<String, StatementReference> entry : snapshot.statementIndex.entrySet()) {
			StatementReference reference = entry.getValue();
			infos.add(new LoadedStatementInfo(entry.getKey(), reference.lookupStatementId, reference.source,
					reference.sqlMapXml, reference.parameterClass, reference.resultClass));
		}
		return Collections.unmodifiableList(infos);
	}

	private void loadSqlMapsFromDirectory(Path root, Set<String> visitedSources,
			Map<String, StatementReference> targetStatementIndex,
			Map<String, Element> targetSqlFragmentIndex,
			Map<String, Map<String, String>> targetResultMapIndex) {
		try {
			Files.walk(root)
					.filter(Files::isRegularFile)
					.filter(path -> path.getFileName().toString().toLowerCase(Locale.ROOT).endsWith("_sqlmap.xml"))
					.forEach(path -> {
						String source = path.toAbsolutePath().toString();
						if (!visitedSources.add(source)) {
							return;
						}
						try {
							String xml = new String(Files.readAllBytes(path), StandardCharsets.UTF_8);
							registerStatements(xml, source, targetStatementIndex, targetSqlFragmentIndex,
									targetResultMapIndex);
						} catch (IOException exception) {
							throw new IllegalStateException("Failed to read sqlmap xml: " + source, exception);
						}
					});
		} catch (IOException exception) {
			throw new IllegalStateException("Failed to scan classpath directory: " + root, exception);
		}
	}

	private void loadSqlMapsFromJar(Path jarPath, Set<String> visitedSources,
			Map<String, StatementReference> targetStatementIndex,
			Map<String, Element> targetSqlFragmentIndex,
			Map<String, Map<String, String>> targetResultMapIndex) {
		try (JarFile jarFile = new JarFile(jarPath.toFile())) {
			Enumeration<JarEntry> entries = jarFile.entries();
			while (entries.hasMoreElements()) {
				JarEntry jarEntry = entries.nextElement();
				if (jarEntry.isDirectory()) {
					continue;
				}
				String name = jarEntry.getName();
				String lowerName = name.toLowerCase(Locale.ROOT);
				if (!lowerName.endsWith("_sqlmap.xml")) {
					continue;
				}

				String source = jarPath.toAbsolutePath() + "!" + name;
				if (!visitedSources.add(source)) {
					continue;
				}

				try (InputStream inputStream = jarFile.getInputStream(jarEntry)) {
					String xml = new String(readAllBytes(inputStream), StandardCharsets.UTF_8);
					registerStatements(xml, source, targetStatementIndex, targetSqlFragmentIndex,
							targetResultMapIndex);
				}
			}
		} catch (IOException exception) {
			throw new IllegalStateException("Failed to scan classpath jar: " + jarPath, exception);
		}
	}

	private byte[] readAllBytes(InputStream inputStream) throws IOException {
		byte[] buffer = new byte[8192];
		int read;
		List<byte[]> chunks = new ArrayList<>();
		int total = 0;
		while ((read = inputStream.read(buffer)) != -1) {
			byte[] chunk = Arrays.copyOf(buffer, read);
			chunks.add(chunk);
			total += read;
		}
		byte[] all = new byte[total];
		int offset = 0;
		for (byte[] chunk : chunks) {
			System.arraycopy(chunk, 0, all, offset, chunk.length);
			offset += chunk.length;
		}
		return all;
	}

	private void registerStatements(String xml, String source,
			Map<String, StatementReference> targetStatementIndex,
			Map<String, Element> targetSqlFragmentIndex,
			Map<String, Map<String, String>> targetResultMapIndex) {
		Document document;
		try {
			String normalizedXml = preprocessXml(xml);
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			factory.setFeature(XMLConstants.FEATURE_SECURE_PROCESSING, true);
			factory.setNamespaceAware(false);
			document = factory.newDocumentBuilder().parse(new InputSource(new StringReader(normalizedXml)));
		} catch (Exception exception) {
			throw new IllegalStateException("Failed to parse sqlmap xml: " + source, exception);
		}

		registerSqlFragments(document, source, targetSqlFragmentIndex);
		registerResultMaps(document, source, targetResultMapIndex);

		Element root = document.getDocumentElement();
		String namespace = root == null ? "" : root.getAttribute("namespace");
		NodeList nodes = document.getElementsByTagName("*");
		for (int index = 0; index < nodes.getLength(); index++) {
			Node node = nodes.item(index);
			if (!(node instanceof Element)) {
				continue;
			}
			Element element = (Element) node;
			if (!IbatisXmlSupport.isStatementTag(element.getTagName())) {
				continue;
			}
			String localId = element.getAttribute("id");
			if (isBlank(localId)) {
				continue;
			}

			StatementReference reference = new StatementReference(
					nodeToXml(element),
					localId,
					source,
					element.getAttribute("parameterClass"),
					element.getAttribute("resultClass"));
			// 无 namespace 的 statementId 必须全局唯一。
			registerStatementId(localId, reference, isBlank(namespace), targetStatementIndex);
			if (!isBlank(namespace)) {
				registerStatementId(namespace + "." + localId, reference, true, targetStatementIndex);
			}
		}
	}

	private void registerSqlFragments(Document document, String source, Map<String, Element> targetSqlFragmentIndex) {
		NodeList nodes = document.getElementsByTagName("sql");
		for (int index = 0; index < nodes.getLength(); index++) {
			Node node = nodes.item(index);
			if (!(node instanceof Element)) {
				continue;
			}
			Element element = (Element) node;
			String id = element.getAttribute("id");
			if (isBlank(id)) {
				continue;
			}
			Element existing = targetSqlFragmentIndex.get(id);
			if (existing != null) {
				throw new IllegalStateException("Duplicate <sql id> detected while loading sqlmap.xml: " + id
						+ " (source: " + source + ")");
			}
			targetSqlFragmentIndex.put(id, (Element) element.cloneNode(true));
		}
	}

	private void registerResultMaps(Document document, String source,
			Map<String, Map<String, String>> targetResultMapIndex) {
		NodeList nodes = document.getElementsByTagName("resultMap");
		for (int index = 0; index < nodes.getLength(); index++) {
			Node node = nodes.item(index);
			if (!(node instanceof Element)) {
				continue;
			}
			Element element = (Element) node;
			String id = element.getAttribute("id");
			if (isBlank(id)) {
				continue;
			}
			if (targetResultMapIndex.containsKey(id)) {
				throw new IllegalStateException("Duplicate <resultMap id> detected while loading sqlmap.xml: " + id
						+ " (source: " + source + ")");
			}

			Map<String, String> propertyMappings = new LinkedHashMap<>();
			NodeList resultChildren = element.getChildNodes();
			for (int childIndex = 0; childIndex < resultChildren.getLength(); childIndex++) {
				Node childNode = resultChildren.item(childIndex);
				if (childNode instanceof Element) {
					Element childElement = (Element) childNode;
					String property = childElement.getAttribute("property");
					String column = childElement.getAttribute("column");
					if (!isBlank(property) && !isBlank(column)) {
						propertyMappings.put(column, property);
					}
				}
			}
			targetResultMapIndex.put(id, propertyMappings);
		}
	}

	private void registerStatementId(String statementId, StatementReference reference, boolean strict,
			Map<String, StatementReference> targetStatementIndex) {
		StatementReference existing = targetStatementIndex.get(statementId);
		if (existing == null) {
			targetStatementIndex.put(statementId, reference);
			return;
		}
		if (existing.source.equals(reference.source)
				&& existing.lookupStatementId.equals(reference.lookupStatementId)) {
			return;
		}
		if (strict) {
			throw new IllegalStateException(
					"Duplicate statementId detected while loading sqlmap.xml: " + statementId + " (" + existing.source
							+ " vs " + reference.source + ")");
		}
	}

	private static final class IndexSnapshot {
		private final Map<String, StatementReference> statementIndex;
		private final Map<String, Element> sqlFragmentIndex;
		private final Map<String, Map<String, String>> resultMapIndex;

		private IndexSnapshot(Map<String, StatementReference> statementIndex,
				Map<String, Element> sqlFragmentIndex,
				Map<String, Map<String, String>> resultMapIndex) {
			this.statementIndex = statementIndex;
			this.sqlFragmentIndex = sqlFragmentIndex;
			this.resultMapIndex = resultMapIndex;
		}

		private static IndexSnapshot empty() {
			return new IndexSnapshot(Collections.emptyMap(), Collections.emptyMap(), Collections.emptyMap());
		}

		private static IndexSnapshot of(Map<String, StatementReference> statementIndex,
				Map<String, Element> sqlFragmentIndex,
				Map<String, Map<String, String>> resultMapIndex) {
			Map<String, StatementReference> frozenStatementIndex = Collections
					.unmodifiableMap(new LinkedHashMap<>(statementIndex));
			Map<String, Element> frozenSqlFragmentIndex = Collections
					.unmodifiableMap(new LinkedHashMap<>(sqlFragmentIndex));
			Map<String, Map<String, String>> frozenResultMapIndex = freezeResultMapIndex(resultMapIndex);
			return new IndexSnapshot(frozenStatementIndex, frozenSqlFragmentIndex, frozenResultMapIndex);
		}

		private static Map<String, Map<String, String>> freezeResultMapIndex(
				Map<String, Map<String, String>> source) {
			Map<String, Map<String, String>> frozen = new LinkedHashMap<>();
			for (Map.Entry<String, Map<String, String>> entry : source.entrySet()) {
				frozen.put(entry.getKey(), Collections.unmodifiableMap(new LinkedHashMap<>(entry.getValue())));
			}
			return Collections.unmodifiableMap(frozen);
		}
	}

	// 核心实现：prepared 模式（# 替换为 ? 并将绑定值按顺序收集至列表）。
	private ConvertedSql convertCore(String xml, String statementId, Map<String, Element> sqlFragments,
			Map<String, Map<String, String>> resultMaps, Object parameters,
			List<Object> bindingCollector) {
		Objects.requireNonNull(xml, "xml");
		String normalizedXml = preprocessXml(xml);
		try {
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			factory.setFeature(XMLConstants.FEATURE_SECURE_PROCESSING, true);
			factory.setNamespaceAware(false);
			Document document = factory.newDocumentBuilder().parse(new InputSource(new StringReader(normalizedXml)));
			Element statement = findStatement(document, statementId);
			if (statement == null) {
				throw new IllegalArgumentException("Cannot find statement: " + statementId);
			}
			String statementType = statement.getTagName();
			String resultClass = statement.getAttribute("resultClass");
			String resultMapId = normalizeResultMapId(statement.getAttribute("resultMap"), resultMaps);

			RenderContext renderContext;
			if (parameters instanceof Map) {
				@SuppressWarnings("unchecked")
				Map<String, Object> paramMap = (Map<String, Object>) parameters;
				renderContext = RenderContext.prepared(paramMap, sqlFragments, resultMaps, bindingCollector);
			} else if (parameters instanceof Collection<?> || (parameters != null && parameters.getClass().isArray())) {
				Map<String, Object> collectionContext = buildCollectionContext(parameters);
				renderContext = RenderContext.prepared(collectionContext, sqlFragments, resultMaps, bindingCollector);
			} else if (isSimpleParameterValue(parameters)) {
				renderContext = RenderContext.preparedScalar(parameters, sqlFragments, resultMaps, bindingCollector);
			} else {
				renderContext = RenderContext.preparedBean(parameters, sqlFragments, resultMaps, bindingCollector);
			}
			String sql = renderNode(statement, renderContext);
			return new ConvertedSql(normalizeSql(postprocessSql(sql)), parameters, statementType, resultClass,
					resultMapId);
		} catch (Exception exception) {
			throw new IllegalStateException("Failed to convert iBatis XML", exception);
		}
	}

	private Element findStatement(Document document, String statementId) {
		if (isBlank(statementId)) {
			// 未指定 statementId 时，直接把根节点当作渲染入口，兼容只传单条 statement 片段的场景。
			return document.getDocumentElement();
		}

		// 这里不限定标签类型，直接扫描所有元素并按 id 匹配，兼容 select/update/delete/statement 等多种节点。
		NodeList nodes = document.getElementsByTagName("*");
		for (int index = 0; index < nodes.getLength(); index++) {
			Node node = nodes.item(index);
			if (node instanceof Element) {
				Element element = (Element) node;
				if (statementId.equals(element.getAttribute("id"))) {
					return element;
				}
			}
		}

		return null;
	}

	private String preprocessXml(String xml) {
		if (xml == null || xml.isEmpty()) {
			return "";
		}
		// 剥离 UTF-8 BOM（\uFEFF），避免 XML 解析器报"前言中不允许有内容"。
		if (xml.charAt(0) == '\uFEFF') {
			xml = xml.substring(1);
		}
		return IbatisXmlSupport.DOCTYPE_PATTERN.matcher(xml).replaceAll("");
	}

	private String postprocessSql(String sql) {
		if (sql == null) {
			return "";
		}
		// 处理中文逗号等全角标点，避免干扰 SQL 解析与执行
		sql = sql.replaceAll("，", ",").trim();
		// 对只包裹操作符的 CDATA 做一次轻量清理，其它文本仍保留原始内容。
		return IbatisXmlSupport.CDATA_OPERATOR_PATTERN.matcher(sql).replaceAll("$1");
	}

	private Map<String, Element> collectSqlFragments(Document document) {
		Map<String, Element> fragments = new LinkedHashMap<>();
		NodeList nodes = document.getElementsByTagName("sql");
		for (int index = 0; index < nodes.getLength(); index++) {
			Node node = nodes.item(index);
			if (!(node instanceof Element)) {
				continue;
			}
			Element element = (Element) node;
			String id = element.getAttribute("id");
			if (!isBlank(id)) {
				fragments.put(id, element);
			}
		}
		return fragments;
	}

	private Map<String, Map<String, String>> collectResultMaps(Document document) {
		Map<String, Map<String, String>> resultMaps = new LinkedHashMap<>();
		NodeList nodes = document.getElementsByTagName("resultMap");
		for (int index = 0; index < nodes.getLength(); index++) {
			Node node = nodes.item(index);
			if (!(node instanceof Element)) {
				continue;
			}
			Element element = (Element) node;
			String id = element.getAttribute("id");
			if (!isBlank(id)) {
				Map<String, String> propertyMappings = new LinkedHashMap<>();
				NodeList resultChildren = element.getChildNodes();
				for (int childIndex = 0; childIndex < resultChildren.getLength(); childIndex++) {
					Node childNode = resultChildren.item(childIndex);
					if (childNode instanceof Element) {
						Element childElement = (Element) childNode;
						String property = childElement.getAttribute("property");
						String column = childElement.getAttribute("column");
						if (!isBlank(property) && !isBlank(column)) {
							propertyMappings.put(column, property);
						}
					}
				}
				resultMaps.put(id, propertyMappings);
			}
		}
		return resultMaps;
	}

	private String renderNode(Node node, RenderContext context) {
		// 文本节点和 CDATA 节点最终都会走同一套占位符渲染逻辑。
		if (node.getNodeType() == Node.TEXT_NODE || node.getNodeType() == Node.CDATA_SECTION_NODE) {
			return renderText(node.getNodeValue(), context);
		}

		// 注释、空白之外的其它非元素节点统一忽略。
		if (node.getNodeType() != Node.ELEMENT_NODE) {
			return "";
		}

		Element element = (Element) node;
		String tagName = element.getTagName();

		if (isContainerTag(tagName)) {
			// 容器标签本身不产生 SQL，只负责把子节点按顺序展开并拼接。
			return renderChildren(element, context);
		}

		if ("include".equals(tagName)) {
			return renderInclude(element, context);
		}

		if ("isNotEmpty".equals(tagName)) {
			// property 有值才展开 body；prepend 的处理保持 iBatis 的行为习惯。
			return renderConditionalBody(element, context, shouldRender(element, context));
		}

		if ("isEmpty".equals(tagName)) {
			// isEmpty 与 isNotEmpty 相反：property 为空时才输出内部 SQL。
			return renderConditionalBody(element, context, !shouldRender(element, context));
		}

		if ("isNull".equals(tagName)) {
			return renderConditionalBody(element, context,
					resolveExpression(element.getAttribute("property"), context) == null);
		}

		if ("isNotNull".equals(tagName)) {
			return renderConditionalBody(element, context,
					resolveExpression(element.getAttribute("property"), context) != null);
		}

		if ("isPropertyAvailable".equals(tagName)) {
			return renderConditionalBody(element, context,
					isPropertyAvailable(element.getAttribute("property"), context));
		}

		if ("isNotPropertyAvailable".equals(tagName)) {
			return renderConditionalBody(element, context,
					!isPropertyAvailable(element.getAttribute("property"), context));
		}

		if ("isParameterPresent".equals(tagName)) {
			return renderConditionalBody(element, context, context.parameterPresent);
		}

		if ("isNotParameterPresent".equals(tagName)) {
			return renderConditionalBody(element, context, !context.parameterPresent);
		}

		if (IbatisXmlSupport.isBinaryConditionalTag(tagName)) {
			return renderConditionalBody(element, context, evaluateBinaryCondition(element, context, tagName));
		}

		if ("iterate".equals(tagName)) {
			// iterate 负责把集合参数按 open / close / conjunction 规则展开成片段。
			return renderIterate(element, context);
		}

		if ("dynamic".equals(tagName) || "trim".equals(tagName)) {
			// dynamic/trim 的核心工作是包装和清理内部片段，例如去掉多余 AND、逗号等。
			String body = renderChildren(element, context);
			if (isBlank(body)) {
				return "";
			}
			String prepend = element.getAttribute("prepend");
			String suffixOverrides = element.getAttribute("suffixOverrides");
			if (!isBlank(suffixOverrides)) {
				body = stripSuffixOverrides(body, suffixOverrides);
			} else if ("SET".equalsIgnoreCase(prepend)) {
				body = stripTrailingComma(body);
			}
			if (!isBlank(prepend)) {
				return " " + prepend.trim() + " " + stripLeadingConjunction(body);
			}
			return body;
		}

		return renderChildren(element, context);
	}

	private boolean isContainerTag(String tagName) {
		// 这些标签只是语义容器，不直接修改 SQL 结构规则。
		return IbatisXmlSupport.isContainerTag(tagName);
	}

	private String renderChildren(Element element, RenderContext context) {
		// iBatis 的文本顺序是有意义的，所以这里严格按 DOM 子节点顺序串联结果。
		StringBuilder builder = new StringBuilder();
		NodeList children = element.getChildNodes();
		for (int index = 0; index < children.getLength(); index++) {
			builder.append(renderNode(children.item(index), context));
		}
		return builder.toString();
	}

	private String renderInclude(Element element, RenderContext context) {
		String refid = element.getAttribute("refid");
		Element fragment = context.sqlFragments.get(refid);
		if (fragment == null && refid.contains(".")) {
			fragment = context.sqlFragments.get(refid.substring(refid.lastIndexOf('.') + 1));
		}
		if (fragment == null) {
			throw new IllegalArgumentException("Cannot find sql fragment: " + refid);
		}
		return renderChildren(fragment, context);
	}

	private boolean shouldRender(Element element, RenderContext context) {
		// 动态标签统一通过 property -> value -> hasValue 三段式判断是否命中。
		String property = element.getAttribute("property");
		Object value = resolveExpression(property, context);
		return hasValue(value);
	}

	private String renderConditionalBody(Element element, RenderContext context, boolean matched) {
		if (!matched) {
			return "";
		}
		String prepend = element.getAttribute("prepend");
		String body = renderChildren(element, context);
		return isBlank(prepend) ? body : " " + prepend.trim() + " " + body;
	}

	private boolean evaluateBinaryCondition(Element element, RenderContext context, String tagName) {
		Object leftValue = resolveExpression(element.getAttribute("property"), context);
		Object rightValue = resolveComparisonTarget(element, context);
		int comparison = compareValues(leftValue, rightValue);

		switch (tagName) {
			case "isEqual":
				return comparison == 0;
			case "isNotEqual":
				return comparison != 0;
			case "isGreaterThan":
				return comparison > 0;
			case "isGreaterEqual":
				return comparison >= 0;
			case "isLessThan":
				return comparison < 0;
			case "isLessEqual":
				return comparison <= 0;
			default:
				return false;
		}
	}

	private Object resolveComparisonTarget(Element element, RenderContext context) {
		String compareProperty = element.getAttribute("compareProperty");
		if (!isBlank(compareProperty)) {
			return resolveExpression(compareProperty, context);
		}
		return normalizeComparisonValue(resolveExpression(element.getAttribute("property"), context),
				element.getAttribute("compareValue"));
	}

	private String normalizeResultMapId(String declaredResultMapId, Map<String, Map<String, String>> resultMaps) {
		if (isBlank(declaredResultMapId)) {
			return null;
		}
		if (resultMaps.containsKey(declaredResultMapId)) {
			return declaredResultMapId;
		}

		if (declaredResultMapId.contains(".")) {
			String localId = declaredResultMapId.substring(declaredResultMapId.lastIndexOf('.') + 1);
			if (resultMaps.containsKey(localId)) {
				return localId;
			}
		}

		throw new IllegalArgumentException("Cannot find resultMap: " + declaredResultMapId);
	}

	private Enum<?> parseEnumValue(Class<? extends Enum<?>> enumType, String name) {
		if (enumType == null || isBlank(name)) {
			return null;
		}
		for (Enum<?> enumConstant : enumType.getEnumConstants()) {
			if (enumConstant.name().equals(name.trim())) {
				return enumConstant;
			}
		}
		return null;
	}

	private int compareValues(Object leftValue, Object rightValue) {
		if (leftValue == null && rightValue == null) {
			return 0;
		}
		if (leftValue == null) {
			return -1;
		}
		if (rightValue == null) {
			return 1;
		}

		if (leftValue instanceof Number || rightValue instanceof Number) {
			Double leftNumber = toDouble(leftValue);
			Double rightNumber = toDouble(rightValue);
			if (leftNumber != null && rightNumber != null) {
				return Double.compare(leftNumber, rightNumber);
			}
		}

		if (leftValue instanceof Boolean || rightValue instanceof Boolean) {
			Boolean leftBoolean = toBoolean(leftValue);
			Boolean rightBoolean = toBoolean(rightValue);
			if (leftBoolean != null && rightBoolean != null) {
				return Boolean.compare(leftBoolean, rightBoolean);
			}
		}

		if (leftValue instanceof Comparable<?> && rightValue != null && leftValue.getClass().isInstance(rightValue)) {
			@SuppressWarnings("unchecked")
			Comparable<Object> leftComparable = (Comparable<Object>) leftValue;
			return leftComparable.compareTo(rightValue);
		}

		return String.valueOf(leftValue).compareTo(String.valueOf(rightValue));
	}

	private Object normalizeComparisonValue(Object leftValue, String compareValue) {
		if (leftValue == null || compareValue == null) {
			return compareValue;
		}

		if (leftValue instanceof Enum<?>) {
			Enum<?> parsed = parseEnumValue(((Enum<?>) leftValue).getDeclaringClass(), compareValue);
			return parsed != null ? parsed : compareValue;
		}

		if (leftValue instanceof Character && compareValue.length() == 1) {
			return compareValue.charAt(0);
		}

		return compareValue;
	}

	private Double toDouble(Object value) {
		if (value instanceof Number) {
			return ((Number) value).doubleValue();
		}
		try {
			return Double.valueOf(String.valueOf(value).trim());
		} catch (Exception exception) {
			return null;
		}
	}

	private Boolean toBoolean(Object value) {
		if (value instanceof Boolean) {
			return (Boolean) value;
		}
		String normalized = String.valueOf(value).trim().toLowerCase(Locale.ROOT);
		if ("true".equals(normalized) || "1".equals(normalized) || "y".equals(normalized)) {
			return true;
		}
		if ("false".equals(normalized) || "0".equals(normalized) || "n".equals(normalized)) {
			return false;
		}
		return null;
	}

	private boolean isPropertyAvailable(String expression, RenderContext context) {
		if (isBlank(expression)) {
			return false;
		}

		if (context.iterationProperty != null) {
			String normalizedExpression = expression.replace("[]", "");
			if (normalizedExpression.equals(context.iterationProperty)) {
				return true;
			}
		}

		if (context.parameters.containsKey(expression)) {
			return true;
		}

		String[] parts = expression.split("\\.");
		Object current = context.parameters.get(parts[0]);
		if (current == null && context.defaultValue != null && !isSimpleParameterValue(context.defaultValue)) {
			if (isRootParameterAlias(parts[0])) {
				current = context.defaultValue;
			} else if (hasReadableProperty(context.defaultValue, parts[0])) {
				current = readProperty(context.defaultValue, parts[0]);
			}
		}
		if (current == null) {
			return parts.length == 1 && context.defaultValue != null && isRootParameterAlias(parts[0]);
		}

		for (int index = 1; index < parts.length; index++) {
			if (!hasReadableProperty(current, parts[index])) {
				return false;
			}
			current = readProperty(current, parts[index]);
			if (current == null && index < parts.length - 1) {
				return false;
			}
		}
		return true;
	}

	private boolean hasReadableProperty(Object target, String name) {
		if (target instanceof Map<?, ?>) {
			return ((Map<?, ?>) target).containsKey(name);
		}

		String suffix = Character.toUpperCase(name.charAt(0)) + name.substring(1);
		for (String methodName : Arrays.asList("get" + suffix, "is" + suffix)) {
			try {
				target.getClass().getMethod(methodName);
				return true;
			} catch (NoSuchMethodException ignored) {
				// Try next lookup.
			}
		}

		try {
			target.getClass().getDeclaredField(name);
			return true;
		} catch (NoSuchFieldException ignored) {
			return false;
		}
	}

	private String renderIterate(Element element, RenderContext context) {
		String property = element.getAttribute("property");
		Object value = resolveExpression(property, context);
		List<Object> items = asList(value);
		String open = element.getAttribute("open");
		String close = element.getAttribute("close");
		String conjunction = element.getAttribute("conjunction");
		String prepend = element.getAttribute("prepend");

		if (items.isEmpty()) {
			// Keep generated SQL valid across databases for IN ()-like constructs.
			String body = open + "null" + close;
			return isBlank(prepend) ? body : " " + prepend.trim() + " " + body;
		}

		// 每个元素都会获得一个“迭代上下文”，从而支持 #list[]# 这类写法取到当前项。
		List<String> fragments = new ArrayList<>();
		for (int index = 0; index < items.size(); index++) {
			Object item = items.get(index);
			RenderContext itemContext = context.forIteration(property, item, index);
			fragments.add(renderChildren(element, itemContext).trim());
		}

		String joined = String.join(conjunction.isEmpty() ? "," : conjunction, fragments);
		String body = open + joined + close;
		return isBlank(prepend) ? body : " " + prepend.trim() + " " + body;
	}

	private String renderText(String text, RenderContext context) {
		if (text == null || text.isEmpty()) {
			return "";
		}

		// 只对 XML 模板本身做一轮占位符解析；替换进来的原始文本不会再次递归展开。
		Matcher matcher = IbatisXmlSupport.PLACEHOLDER_PATTERN.matcher(text);
		StringBuffer buffer = new StringBuffer();
		while (matcher.find()) {
			String marker = matcher.group(1);
			String expression = firstNonBlank(IbatisXmlSupport.extractPlaceholderExpression(matcher));
			Object value = resolvePlaceholder(expression, context);
			if ("$".equals(marker)) {
				// iBatis $...$ is raw text substitution, not prepared-statement binding.
				matcher.appendReplacement(buffer, Matcher.quoteReplacement(toSqlRawText(value)));
			} else {
				// prepared 模式：#...# 输出 ? 并将绑定值按序追加到 collector。
				context.bindingCollector.add(value);
				matcher.appendReplacement(buffer, "?");
			}
		}
		matcher.appendTail(buffer);
		return buffer.toString();
	}

	private String toSqlRawText(Object value) {
		if (value == null) {
			return "null";
		}
		// $...$ 的定位就是“原样插入 SQL 片段”，因此这里只做 toString，不做转义。
		return String.valueOf(value);
	}

	private Object resolvePlaceholder(String expression, RenderContext context) {
		// iterate 内部的 list[] / ids[] 这类表达式优先命中当前迭代项，而不是外层参数对象。
		if (context.iterationProperty != null) {
			String normalizedExpression = expression.replace("[]", "");
			if (normalizedExpression.equals(context.iterationProperty)) {
				return context.iterationValue;
			}
		}

		return resolveExpression(expression, context);
	}

	private Object resolveExpression(String expression, RenderContext context) {
		if (isBlank(expression)) {
			return null;
		}

		// 先按完整 key 查一遍，兼容 Map 参数直接传入扁平字段名的情况。
		Object current = context.parameters.get(expression);
		if (current != null) {
			return current;
		}

		if (context.iterationProperty != null) {
			String normalizedExpression = expression.replace("[]", "");
			if (normalizedExpression.equals(context.iterationProperty)) {
				return context.iterationValue;
			}
		}

		if (context.defaultValue != null) {
			if (isRootParameterAlias(expression)) {
				return context.defaultValue;
			}
			if (isSimpleParameterValue(context.defaultValue)) {
				return context.defaultValue;
			}
		}

		// 再按 a.b.c 逐段向下读取属性，兼容 bean / 嵌套 map / 组合对象。
		String[] parts = expression.split("\\.");
		Object value = context.parameters.get(parts[0]);
		if (value == null && context.defaultValue != null && !isSimpleParameterValue(context.defaultValue)) {
			if (isRootParameterAlias(parts[0])) {
				value = context.defaultValue;
			} else {
				value = readProperty(context.defaultValue, parts[0]);
			}
		}
		for (int index = 1; index < parts.length && value != null; index++) {
			value = readProperty(value, parts[index]);
		}
		// 简单类型参数没有属性名时，最终退回 defaultValue，兼容 #value#/$value$ 这类场景。
		return value != null ? value : context.defaultValue;
	}

	private Object readProperty(Object target, String name) {
		if (target instanceof Map<?, ?>) {
			// Map 参数直接按 key 读取，不走反射。
			Map<?, ?> map = (Map<?, ?>) target;
			return map.get(name);
		}

		try {
			// 先按 JavaBean getter 约定读属性，再回退到字段反射，尽量兼容旧对象模型。
			String suffix = Character.toUpperCase(name.charAt(0)) + name.substring(1);
			for (String methodName : Arrays.asList("get" + suffix, "is" + suffix)) {
				try {
					Method method = target.getClass().getMethod(methodName);
					return method.invoke(target);
				} catch (NoSuchMethodException ignored) {
					// Try next lookup.
				}
			}

			Field field = target.getClass().getDeclaredField(name);
			field.setAccessible(true);
			return field.get(target);
		} catch (Exception exception) {
			// iBatis 对“属性不存在”的处理通常偏宽松，这里也统一回 null，由上层决定是否命中动态条件。
			return null;
		}
	}

	private boolean hasValue(Object value) {
		if (value == null) {
			return false;
		}

		if (value instanceof CharSequence) {
			// 字符串不仅要非 null，还要排除全空白场景。
			CharSequence sequence = (CharSequence) value;
			return !sequence.toString().trim().isEmpty();
		}

		if (value instanceof Collection<?>) {
			// 空集合在动态 SQL 里通常视为“没有值”。
			Collection<?> collection = (Collection<?>) value;
			return !collection.isEmpty();
		}

		if (value instanceof Map<?, ?>) {
			Map<?, ?> map = (Map<?, ?>) value;
			return !map.isEmpty();
		}

		if (value instanceof Optional<?>) {
			Optional<?> optional = (Optional<?>) value;
			return optional.isPresent();
		}

		if (value.getClass().isArray()) {
			// 数组与集合保持同样的“空即无值”规则。
			return Array.getLength(value) > 0;
		}

		// 其它对象只要非 null 就视为命中。
		return true;
	}

	private boolean isSimpleParameterValue(Object value) {
		return value == null || value instanceof CharSequence || value instanceof Number || value instanceof Boolean
				|| value instanceof Character || value.getClass().isEnum();
	}

	private boolean isRootParameterAlias(String expression) {
		return "value".equals(expression) || "_parameter".equals(expression) || "parameter".equals(expression)
				|| "parameterObject".equals(expression);
	}

	private List<Object> asList(Object value) {
		if (value == null) {
			return Collections.emptyList();
		}

		if (value instanceof Collection<?>) {
			Collection<?> collection = (Collection<?>) value;
			return new ArrayList<Object>(collection);
		}

		if (value.getClass().isArray()) {
			// 反射读取数组是为了同时兼容对象数组和基础类型数组。
			int length = Array.getLength(value);
			List<Object> items = new ArrayList<>(length);
			for (int index = 0; index < length; index++) {
				items.add(Array.get(value, index));
			}
			return items;
		}

		// 非集合值在 iterate 里退化成单元素列表，减少调用方的参数准备成本。
		return Collections.singletonList(value);
	}

	private boolean isBlank(String value) {
		return value == null || value.trim().isEmpty();
	}

	private String firstNonBlank(String... values) {
		for (String value : values) {
			if (!isBlank(value)) {
				return value.trim();
			}
		}
		return "";
	}

	private String normalizeSql(String sql) {
		// 统一压缩空白，方便测试断言和报告输出；不追求保留原始排版。
		return sql == null ? "" : sql.replaceAll("\\s+", " ").trim();
	}

	private String stripLeadingConjunction(String sql) {
		// dynamic/trim 场景下，外层 prepend 可能接管第一个 AND/OR/WHERE，需要把内部多余前缀剥掉。
		String trimmed = sql.trim();
		String upper = trimmed.toUpperCase(Locale.ROOT);
		if (upper.startsWith("AND ")) {
			return trimmed.substring(4).trim();
		}
		if (upper.startsWith("OR ")) {
			return trimmed.substring(3).trim();
		}
		if (upper.startsWith("WHERE ")) {
			return trimmed.substring(6).trim();
		}
		return trimmed;
	}

	private String stripTrailingComma(String sql) {
		// 典型用于 SET 片段收尾，避免最后一个字段后面残留逗号。
		String trimmed = sql.trim();
		if (trimmed.endsWith(",")) {
			return trimmed.substring(0, trimmed.length() - 1).trim();
		}
		return trimmed;
	}

	private String stripSuffixOverrides(String sql, String suffixOverrides) {
		// 模拟 trim 的 suffixOverrides 语义，允许按多个 token 循环剥离尾部噪音。
		String result = sql.trim();
		for (String override : suffixOverrides.split("\\|")) {
			String token = override.trim();
			if (token.isEmpty()) {
				continue;
			}
			while (result.endsWith(token)) {
				result = result.substring(0, result.length() - token.length()).trim();
			}
		}
		return result;
	}

	private String extractStatementInnerXml(Element statementElement) {
		StringBuilder builder = new StringBuilder();
		NodeList children = statementElement.getChildNodes();
		for (int index = 0; index < children.getLength(); index++) {
			builder.append(nodeToXml(children.item(index)));
		}
		return builder.toString().trim();
	}

	private String nodeToXml(Node node) {
		try {
			TransformerFactory factory = TransformerFactory.newInstance();
			factory.setFeature(XMLConstants.FEATURE_SECURE_PROCESSING, true);
			Transformer transformer = factory.newTransformer();
			transformer.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "yes");
			transformer.setOutputProperty(OutputKeys.INDENT, "no");
			StringWriter writer = new StringWriter();
			transformer.transform(new DOMSource(node), new StreamResult(writer));
			return writer.toString();
		} catch (Exception exception) {
			throw new IllegalStateException("Failed to serialize statement xml node", exception);
		}
	}

	private Map<String, Object> buildCollectionContext(Object collectionValue) {
		List<Object> items = asList(collectionValue);
		Map<String, Object> context = new LinkedHashMap<>();
		context.put("ids", items);
		context.put("list", items);
		context.put("collection", items);
		if (collectionValue != null && collectionValue.getClass().isArray()) {
			context.put("array", items);
		}
		return context;
	}

	private static final class RenderContext {
		// parameters 保存命名参数；defaultValue 用于简单类型参数（如 String/Long）；
		// iterationProperty / iterationValue 用于 iterate 当前项解析。
		// bindingCollector 非 null 时为 prepared 模式，#...# 输出 ? 并将值追加至此列表。
		private final Map<String, Object> parameters;
		private final Object defaultValue;
		private final Map<String, Element> sqlFragments;
		private final Map<String, Map<String, String>> resultMaps;
		private final String iterationProperty;
		private final Object iterationValue;
		private final boolean parameterPresent;
		private final List<Object> bindingCollector;

		private static RenderContext prepared(Map<String, Object> parameters, Map<String, Element> sqlFragments,
				Map<String, Map<String, String>> resultMaps, List<Object> bindingCollector) {
			return new RenderContext(parameters, null, sqlFragments, null, null, true, resultMaps, bindingCollector);
		}

		private static RenderContext preparedScalar(Object scalarValue, Map<String, Element> sqlFragments,
				Map<String, Map<String, String>> resultMaps, List<Object> bindingCollector) {
			return new RenderContext(Collections.emptyMap(), scalarValue, sqlFragments, null, null,
					scalarValue != null, resultMaps, bindingCollector);
		}

		private static RenderContext preparedBean(Object beanValue, Map<String, Element> sqlFragments,
				Map<String, Map<String, String>> resultMaps, List<Object> bindingCollector) {
			return new RenderContext(Collections.emptyMap(), beanValue, sqlFragments, null, null,
					beanValue != null, resultMaps, bindingCollector);
		}

		private RenderContext(Map<String, Object> parameters, Object defaultValue, Map<String, Element> sqlFragments,
				String iterationProperty, Object iterationValue, boolean parameterPresent,
				Map<String, Map<String, String>> resultMaps, List<Object> bindingCollector) {
			this.parameters = parameters;
			this.defaultValue = defaultValue;
			this.sqlFragments = sqlFragments;
			this.iterationProperty = iterationProperty;
			this.iterationValue = iterationValue;
			this.parameterPresent = parameterPresent;
			this.resultMaps = resultMaps;
			this.bindingCollector = bindingCollector;
		}

		private RenderContext forIteration(String property, Object value, int iterationIndex) {
			// 迭代时复用原上下文，只替换“当前项相关”的两个槽位；bindingCollector 共享引用保持顺序一致。
			return new RenderContext(parameters, defaultValue, sqlFragments, property, value,
					parameterPresent, resultMaps, bindingCollector);
		}

	}

	private static final class StatementReference {
		private final String sqlMapXml;
		private final String lookupStatementId;
		private final String source;
		private final String parameterClass;
		private final String resultClass;

		private StatementReference(String sqlMapXml, String lookupStatementId, String source,
				String parameterClass, String resultClass) {
			this.sqlMapXml = sqlMapXml;
			this.lookupStatementId = lookupStatementId;
			this.source = source;
			this.parameterClass = parameterClass;
			this.resultClass = resultClass;
		}
	}

	public static final class LoadedStatementInfo {
		private final String statementId;
		private final String lookupStatementId;
		private final String source;
		private final String sqlMapXml;
		private final String parameterClass;
		private final String resultClass;

		private LoadedStatementInfo(String statementId, String lookupStatementId, String source, String sqlMapXml,
				String parameterClass, String resultClass) {
			this.statementId = statementId;
			this.lookupStatementId = lookupStatementId;
			this.source = source;
			this.sqlMapXml = sqlMapXml;
			this.parameterClass = parameterClass;
			this.resultClass = resultClass;
		}

		public String getStatementId() {
			return statementId;
		}

		public String getLookupStatementId() {
			return lookupStatementId;
		}

		public String getSource() {
			return source;
		}

		public String getSqlMapXml() {
			return sqlMapXml;
		}

		public String getParameterClass() {
			return parameterClass;
		}

		public String getResultClass() {
			return resultClass;
		}
	}
}
