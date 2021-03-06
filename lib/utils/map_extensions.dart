import 'package:kt_dart/collection.dart';

extension MapExtensions<K, T> on Map<K, T> {
  Map<K, T> clone() {
    return Map.of(this);
  }
}

extension KtMapExtensions<K, V> on KtMap<K, V> {
  KtMap<K, V> put(K key, V val) {
    return (this.toMutableMap()..[key] = val).toMap();
  }

  KtMap<K, V> update(K key, V update(V v)) {
    if (!this.containsKey(key)) {
      return this;
    }

    return put(key, update(this[key]));
  }

  KtMap<K, V> delete(K key) {
    return (this.toMutableMap()..remove(key)).toMap();
  }

  KtMap<K, V> putAll(KtMap<K, V> other) {
    return (this.toMutableMap()..putAll(other)).toMap();
  }
}
