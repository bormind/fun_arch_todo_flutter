abstract class ILens<A, B> {
  B get(A a);
  A set(A a, B b);
  A update(A a, B f(B b)) => this.set(a, f(this.get(a)));

  ILens<A, C> combine<C>(ILens<B, C> l) => CombinedLens(this, l);
}

class Lens<A, B> extends ILens<A, B> {
  final B Function(A a) _get;
  final A Function(A a, B b) _set;

  Lens(this._get, this._set);

  @override
  B get(A a) => _get(a);

  @override
  A set(A a, B b) => _set(a, b);
}

class CombinedLens<A, B, C> extends ILens<A, C> {
  final ILens<A, B> l1;
  final ILens<B, C> l2;

  CombinedLens(this.l1, this.l2);

  @override
  C get(A t) => l2.get(l1.get(t));

  @override
  A set(A a, C c) => l1.set(a, l2.set(l1.get(a), c));
}

class ListLens<A> extends ILens<List<A>, A> {
  final bool Function(A item) _match;

  ListLens(
    this._match,
  );

  @override
  A get(List<A> list) {
    return list.firstWhere(_match, orElse: null);
  }

  @override
  List<A> set(List<A> list, A b) {
    return list.map((item) => _match(item) ? b : item);
  }
}
