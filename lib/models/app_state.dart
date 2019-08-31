import 'package:meta/meta.dart';
import 'package:redurx_light_starter/models/app_tab.dart';
import 'package:redurx_light_starter/models/stats_state.dart';
import 'package:redurx_light_starter/models/todos_state.dart';
import 'package:redurx_light_starter/utils/lens.dart';

@immutable
class AppState {
  static ILens<AppState, TodosState> todosLens = Lens(
    (state) => state.todosState,
    (todosState) => (state) => state.copyWith(todosState: todosState),
  );

  static ILens<AppState, StatsState> statsLens = Lens(
    (state) => state.statsState,
    (statsState) => (state) => state.copyWith(statsState: statsState),
  );

  final TodosState todosState;
  final StatsState statsState;
  final AppTab activeTab;

  AppState({
    @required this.todosState,
    @required this.statsState,
    @required this.activeTab,
  });

  AppState copyWith({
    TodosState todosState,
    StatsState statsState,
    AppTab activeTab,
  }) {
    return AppState(
      todosState: todosState ?? this.todosState,
      statsState: statsState ?? this.statsState,
      activeTab: activeTab ?? this.activeTab,
    );
  }

  factory AppState.initial() {
    return AppState(
      todosState: TodosState.initial(),
      statsState: StatsState.initial(),
      activeTab: AppTab.todos,
    );
  }
}
