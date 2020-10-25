import 'package:fun_arch_todo_flutter/models/app_state.dart';
import 'package:fun_arch_todo_flutter/models/app_tab.dart';
import 'package:fun_arch_todo_flutter/models/visibility_filter.dart';
import 'package:fun_arch_todo_flutter/store/actions/action.dart';

class SetActiveTab implements Action {
  final AppTab activeTab;

  SetActiveTab(this.activeTab);

  @override
  AppState updateState(AppState appState) {
    return appState.copyWith(activeTab: activeTab);
  }
}

class SetVisibilityFilter implements Action {
  final VisibilityFilter visibilityFilter;

  SetVisibilityFilter(this.visibilityFilter);

  @override
  AppState updateState(AppState appState) {
    if (appState.todosState.visibilityFilter == visibilityFilter) {
      return appState;
    }

    return AppState$.todosState
        .of(appState)
        .map((todos) => todos.copyWith(visibilityFilter: visibilityFilter));
  }
}

class SetLoading implements Action {
  final bool isLoading;

  SetLoading(this.isLoading);

  @override
  AppState updateState(AppState appState) {
    return AppState$.todosState
        .of(appState)
        .map((todosState) => todosState.copyWith(isLoading: isLoading));
  }
}

class SetDataInitialized implements Action {
  @override
  AppState updateState(AppState appState) {
    return AppState$.todosState
        .of(appState)
        .map((todosState) => todosState.copyWith(dataIsInitialized: true));
  }
}
