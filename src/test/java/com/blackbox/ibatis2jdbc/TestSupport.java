package com.blackbox.ibatis2jdbc;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

final class TestSupport {
  private TestSupport() {
  }

  @SafeVarargs
  static <T> List<T> listOf(T... values) {
    return Arrays.asList(values);
  }

  @SuppressWarnings("unchecked")
  static <K, V> Map<K, V> mapOf(Object... pairs) {
    if (pairs.length % 2 != 0) {
      throw new IllegalArgumentException("Map entries require key/value pairs");
    }
    Map<K, V> map = new LinkedHashMap<>();
    for (int index = 0; index < pairs.length; index += 2) {
      map.put((K) pairs[index], (V) pairs[index + 1]);
    }
    return map;
  }

  static String readResource(Class<?> type, String resourcePath) throws IOException {
    InputStream inputStream = type.getResourceAsStream(resourcePath);
    if (inputStream == null) {
      throw new IOException("Resource not found: " + resourcePath);
    }
    try {
      ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
      byte[] buffer = new byte[4096];
      int read;
      while ((read = inputStream.read(buffer)) != -1) {
        outputStream.write(buffer, 0, read);
      }
      return new String(outputStream.toByteArray(), StandardCharsets.UTF_8);
    } finally {
      inputStream.close();
    }
  }
}
