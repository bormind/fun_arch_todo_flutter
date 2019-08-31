//abstract class ILens<O, P> {
//  P get(O a);
//  O set(O a, P b);
//  O update(O a, P f(P b)) => this.set(a, f(this.get(a)));
//
//  ILens<O, C> combine<C>(ILens<P, C> l) => CombinedLens(this, l);
//}

abstract class ILens<O, P> {
  P get(O o);

  O Function(O) set(P b);

  O Function(O) update(P f(P p)) => (o) => this.set(f(this.get(o)))(o);

  ILens<O, C> combine<C>(ILens<P, C> l) => CombinedLens(this, l);
}

class Lens<O, P> extends ILens<O, P> {
  final P Function(O) _get;
  final O Function(O) Function(P p) _set;

  Lens(this._get, this._set);

  @override
  P get(O o) => _get(o);

  @override
  O Function(O) set(P p) => _set(p);
}

class CombinedLens<O, P1, P2> extends ILens<O, P2> {
  final ILens<O, P1> l1;
  final ILens<P1, P2> l2;

  CombinedLens(this.l1, this.l2);

  @override
  P2 get(O o) => l2.get(l1.get(o));

  @override
  O Function(O) set(P2 p2) => (o) => l1.set(l2.set(p2)(l1.get(o)))(o);
}
