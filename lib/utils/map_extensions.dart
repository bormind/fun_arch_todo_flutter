extension MapExtensions<K, T> on Map<K, T> {
  Map<K, T> clone() {
    return Map.of(this);
  }
}
