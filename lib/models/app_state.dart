import 'package:functional_data/functional_data.dart';
import 'package:meta/meta.dart';
import 'package:fun_arch_todo_flutter/models/app_tab.dart';
import 'package:fun_arch_todo_flutter/models/stats_state.dart';
import 'package:fun_arch_todo_flutter/models/todos_state.dart';

part 'app_state.g.dart';

@FunctionalData()
class AppState extends $AppState {
  final TodosState todosState;
  final StatsState statsState;
  final AppTab activeTab;

  AppState({
    @required this.todosState,
    @required this.statsState,
    @required this.activeTab,
  });

  factory AppState.initial() {
    return AppState(
      todosState: TodosState.initial(),
      statsState: StatsState.initial(),
      activeTab: AppTab.todos,
    );
  }
}
