import 'package:kt_dart/kt.dart';

extension KtListExtensions<T> on KtList<T> {
  KtList<T> takeWhile(bool Function(T) predicate) {
    final list = KtMutableList<T>.empty();
    for (T item in this.iter) {
      if (predicate(item)) {
        list.add(item);
      } else {
        break;
      }
    }
    return list;
  }

  KtList<T> push(T item) {
    return (this.toMutableList()..add(item)).toList();
  }

  KtList<T> pop() {
    return this.take(this.size - 1);
  }
}
