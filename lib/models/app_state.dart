import 'package:functional_data/functional_data.dart';
import 'package:meta/meta.dart';
import 'package:fun_arch_todo_flutter/models/app_tab.dart';
import 'package:fun_arch_todo_flutter/models/todos_state.dart';

part 'app_state.g.dart';

@FunctionalData()
class AppState extends $AppState {
  final TodosState todosState;
  final AppTab activeTab;

  AppState({
    @required TodosState this.todosState,
    @required AppTab this.activeTab,
  });

  factory AppState.initial() => AppState(
        todosState: TodosState.initial(),
        activeTab: AppTab.todos,
      );
}
