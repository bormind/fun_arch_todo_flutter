import 'package:meta/meta.dart';
import 'package:redurx_light_starter/models/app_tab.dart';
import 'package:redurx_light_starter/models/stats.dart';
import 'package:redurx_light_starter/models/todo.dart';
import 'package:redurx_light_starter/models/visibility_filter.dart';

@immutable
class AppState {
  final Stats stats;
  final List<Todo> todos;
  final AppTab activeTab;
  final VisibilityFilter visibilityFilter;
  final bool isLoadingTodos;
  final bool isStatsLoading;

  AppState({
    @required this.stats,
    @required this.todos,
    @required this.activeTab,
    @required this.visibilityFilter,
    @required this.isLoadingTodos,
    @required this.isStatsLoading,
  });

  AppState copyWith({
    Stats stats,
    List<Todo> todos,
    AppTab activeTab,
    VisibilityFilter visibilityFilter,
    bool isLoadingTodos,
    bool isStatsLoading,
  }) {
    return AppState(
      stats: stats ?? this.stats,
      todos: todos ?? this.todos,
      activeTab: activeTab ?? this.activeTab,
      visibilityFilter: visibilityFilter ?? this.visibilityFilter,
      isLoadingTodos: isLoadingTodos ?? this.isLoadingTodos,
      isStatsLoading: isStatsLoading ?? this.isStatsLoading,
    );
  }

  List<Todo> get visibleTodos {
    if (visibilityFilter == VisibilityFilter.all) {
      return todos;
    } else {
      return todos.where((td) =>
          (td.completed && visibilityFilter == VisibilityFilter.completed) ||
          (!td.completed && visibilityFilter == VisibilityFilter.active));
    }
  }
}
