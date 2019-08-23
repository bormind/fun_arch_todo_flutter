bool _paramsChanged(List<Object> oldParams, List<Object> newParams) {
  if (oldParams.length != newParams.length) {
    return true;
  }

  for (int i = 0; i < newParams.length; i++) {
    if (oldParams[i] != newParams[i]) {
      return true;
    }
  }

  return false;
}

// Calculation with two parameters
class Memoized2<P1, P2, R> {
  final R Function(P1 p1, P2 p2) calculate;

  R _value;
  List<Object> _params = [];

  Memoized2(this.calculate);
  R getOrCalculate(P1 p1, P2 p2) {
    List<Object> newParams = [p1, p2];
    if (_paramsChanged(_params, newParams)) {
      _value = calculate(p1, p2);
      _params = newParams;
    }

    return _value;
  }
}
