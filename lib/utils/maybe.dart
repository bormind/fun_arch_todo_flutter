abstract class Maybe<T> {
  factory Maybe.none() {
    return _None<T>();
  }

  factory Maybe.some(T value) {
    if (value == null) {
      throw ArgumentError("Value can't be null");
    }

    return _Some(value);
  }

  factory Maybe.maybe(T value) {
    return value == null ? _None() : _Some(value);
  }

  T get value;
  Maybe<R> map<R>(R mapper(T t));
  T orElse(T defVal);
  Maybe<R> flatMap<R>(Maybe<R> mapper(T t));

  bool get inSome;
  bool get isNone;
}

class _Some<T> implements Maybe<T> {
  final T _value;

  _Some(this._value);

  T get value => _value;
  T orElse(T defVal) => _value;

  Maybe<R> map<R>(R mapper(T t)) {
    return Maybe.maybe(mapper(_value));
  }

  Maybe<R> flatMap<R>(Maybe<R> mapper(T t)) {
    return mapper(_value);
  }

  bool get inSome => true;
  bool get isNone => false;

  @override
  bool operator ==(Object other) {
    if (other is T) {
      return this._value == other;
    } else if (other is _Some<T>) {
      return other._value == _value;
    } else {
      assert(false, "wrong type eqality");
      return false;
    }
  }

  @override
  int get hashCode {
    return _value.hashCode;
  }

  @override
  String toString() {
    return "Some($_value)";
  }
}

class _None<T> implements Maybe<T> {
  T get value {
    throw Exception("Value does not exists");
  }

  T orElse(T defVal) => defVal;

  Maybe<R> map<R>(R mapper(T t)) {
    return Maybe.none();
  }

  Maybe<R> flatMap<R>(Maybe<R> mapper(T t)) {
    return Maybe.none();
  }

  bool get inSome => false;
  bool get isNone => true;

  @override
  bool operator ==(Object other) {
    if (other is T) {
      return other == null;
    } else if (other is _None<T>) {
      return true;
    } else {
      assert(false, "wrong type eqality");
      return false;
    }
  }

  @override
  int get hashCode {
    return null;
  }

  @override
  String toString() {
    return "None";
  }
}
