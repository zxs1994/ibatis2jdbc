package com.blackbox.ibatis2jdbc;

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
}
