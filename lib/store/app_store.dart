import 'package:fun_arch_todo_flutter/models/app_state.dart';
import 'package:rxdart/rxdart.dart';

import 'actions.dart';

class AppStore {
  final BehaviorSubject<AppState> _stateSubject;

  AppStore(AppState initialState)
      : _stateSubject = BehaviorSubject.seeded(initialState);

  AppState get state {
    return _stateSubject.value;
  }

  Stream<AppState> get state$ {
    return _stateSubject;
  }

  void dispatch(Action action) {
    print(">> Dispatching ${action.runtimeType}");
    _stateSubject.add(action.updateState(_stateSubject.value));
  }
}
