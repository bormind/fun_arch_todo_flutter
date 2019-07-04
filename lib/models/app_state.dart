import 'package:meta/meta.dart';
import 'package:redurx_light_starter/models/app_tab.dart';
import 'package:redurx_light_starter/models/stats_state.dart';
import 'package:redurx_light_starter/models/todos_state.dart';
import 'package:redurx_light_starter/utils/lens.dart';

@immutable
class AppState {
  static ILens<AppState, TodosState> todosLens = Lens(
    (state) => state.todos,
    (state, todos) => state.copyWith(todos: todos),
  );

  static ILens<AppState, StatsState> statsLens = Lens(
    (state) => state.stats,
    (state, stats) => state.copyWith(stats: stats),
  );

  final TodosState todos;
  final StatsState stats;
  final AppTab activeTab;

  AppState({
    @required this.todos,
    @required this.stats,
    @required this.activeTab,
  });

  AppState copyWith({
    TodosState todos,
    StatsState stats,
    AppTab activeTab,
  }) {
    return AppState(
      todos: todos ?? this.todos,
      stats: stats ?? this.stats,
      activeTab: activeTab ?? this.activeTab,
    );
  }

  factory AppState.initial() {
    return AppState(
      todos: TodosState.initial(),
      stats: StatsState.initial(),
      activeTab: AppTab.todos,
    );
  }
}
