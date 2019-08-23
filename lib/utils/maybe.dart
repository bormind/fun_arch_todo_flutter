import 'package:meta/meta.dart';

class Maybe<T> {
  final T _value;

  Maybe._(this._value);

  Maybe.nothing() : _value = null;

  factory Maybe(T value) {
    return Maybe._(value);
  }

  T get value {
    if (_value == null) {
      throw Exception("Value does not exists");
    }

    return _value;
  }

  Maybe<R> map<R>(R mapper(T t)) {
    return _value == null ? Maybe(null) : Maybe(mapper(_value));
  }

  R mapOrElse<R>(R mapper(T t), {@required R orElse}) {
    return _value == null ? orElse : mapper(_value);
  }

  Future<Maybe<R>> mapAsync<R>(Future<R> mapper(T t)) {
    return _value == null
        ? Future.value(Maybe(null))
        : mapper(_value).then((r) => Maybe(r));
  }

  Future<R> mapOrElseAsync<R>(Future<R> mapper(T t), {@required R orElse}) {
    return _value == null ? Future.value(orElse) : mapper(_value);
  }

  Maybe<R> flatMap<R>(Maybe<R> mapper(T t)) {
    if (_value == null) {
      return Maybe(null);
    }

    return mapper(_value);
  }

  bool get hasValue => _value != null;

  @override
  bool operator ==(Object other) {
    if (other is T) {
      return this._value == other;
    } else if (other is Maybe<T>) {
      return (identical(other._value, _value) || other._value == _value);
    } else {
      assert(false, "wrong type eqality");
      return false;
    }
  }

  @override
  int get hashCode {
    return this.map((t) => t.hashCode).orElse(null);
  }

  T orElse(T defVal) {
    return _value ?? defVal;
  }

  @override
  String toString() {
    return hasValue ? "Just($_value)" : "Nothing";
  }
}
