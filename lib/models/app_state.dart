import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:fun_arch_todo_flutter/models/app_tab.dart';
import 'package:fun_arch_todo_flutter/models/todos_state.dart';

part 'app_state.freezed.dart';

@freezed
abstract class AppState with _$AppState {
  factory AppState({
    @required TodosState todosState,
    @required AppTab activeTab,
  }) = _AppState;

  factory AppState.initial() => AppState(
        todosState: TodosState.initial(),
        activeTab: AppTab.todos,
      );
}
