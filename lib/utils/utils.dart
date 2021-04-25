List<T> updateListItem<T>(
  List<T> list, {
  required bool find(T item),
  required T update(T item),
}) {
  return list.map((item) => find(item) ? update(item) : item).toList();
}

bool notIdentical(Object lhs, Object rhs) {
  return !identical(lhs, rhs);
}

bool notEqual(Object lhs, Object rhs) {
  return lhs != rhs;
}
