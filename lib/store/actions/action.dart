import 'package:fun_arch_todo_flutter/models/app_state.dart';

typedef AppState UpdateState(AppState appState);

abstract class Action {
  AppState updateState(AppState appState);
}
