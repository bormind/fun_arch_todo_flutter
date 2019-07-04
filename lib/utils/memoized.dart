bool _validateParams(List<Object> oldParams, List<Object> newParams) {
  if (oldParams.length != newParams.length) {
    return false;
  }

  for (int i = 0; i < newParams.length; i++) {
    if (oldParams[i] != newParams[i]) {
      return false;
    }
  }

  return true;
}

// Calculation with two parameters
class Memoized2<T, P1, P2> {
  final T Function(P1 p1, P2 p2) calculate;

  T _value;
  List<Object> _params = [];

  Memoized2(this.calculate);

  T getOrCalculate(P1 p1, P2 p2) {
    List<Object> newParams = [p1, p2];
    if (!_validateParams(_params, newParams)) {
      _value = calculate(p1, p2);
      _params = newParams;
    }

    return _value;
  }
}
