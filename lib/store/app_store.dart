import 'package:redurx_light_starter/models/app_state.dart';
import 'package:rxdart/rxdart.dart';

abstract class AppAction {
  AppState reduce(AppState state);
}

class _Store {
  final BehaviorSubject<AppState> subject;

  _Store(AppState initialState)
      : subject = BehaviorSubject.seeded(initialState);

  AppState get state {
    return subject.value;
  }

  void dispatch(AppAction action) {
//    Logger("AppStore").info("Action: $action");
    subject.add(action.reduce(subject.value));
  }
}

class AppStore {
  final _Store _store;

  AppStore(AppState initialState) : _store = _Store(initialState);

  Observable<AppState> get state$ {
    return _store.subject;
  }

  AppState get state {
    return _store.state;
  }

  void dispatch(AppAction action) {
    _store.dispatch(action);
  }
}
