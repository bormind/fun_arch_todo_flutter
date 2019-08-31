import 'package:fun_arch_todo_flutter/models/app_state.dart';
import 'package:rxdart/rxdart.dart';

typedef ActionFunction = AppState Function(AppState);

class AppStore {
  final BehaviorSubject<AppState> _stateSubject;

  AppStore(AppState initialState)
      : _stateSubject = BehaviorSubject.seeded(initialState);

  AppState get state {
    return _stateSubject.value;
  }

  Observable<AppState> get state$ {
    return _stateSubject;
  }

  void dispatch(ActionFunction action) {
    _stateSubject.add(action(_stateSubject.value));
  }
}
