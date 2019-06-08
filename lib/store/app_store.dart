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
  static _Store _store;

  static Observable<AppState> get state$ {
    return _store.subject;
  }

  static AppState get state {
    return _store.state;
  }

  static void init(AppState initialState) {
    _store = _Store(initialState);
  }

  static void dispatch(AppAction action) {
    _store.dispatch(action);
  }
}
