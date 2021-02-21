import 'package:fun_arch_todo_flutter/models/app_state.dart';
import 'package:fun_arch_todo_flutter/models/app_tab.dart';
import 'package:fun_arch_todo_flutter/models/todo.dart';
import 'package:fun_arch_todo_flutter/models/todos_state.dart';
import 'package:fun_arch_todo_flutter/models/visibility_filter.dart';
import 'package:fun_arch_todo_flutter/utils/map_extensions.dart';
import 'package:kt_dart/kt.dart';

typedef AppState UpdateState(AppState appState);

abstract class AppAction {
  AppState updateState(AppState appState);
}

final _todoListLens = AppState$.todosState.then(TodosState$.todos);

class MarkCompletion implements AppAction {
  final String todoId;
  final bool isCompleted;

  MarkCompletion(this.todoId, this.isCompleted);

  @override
  AppState updateState(AppState appState) {
    return _todoListLens.of(appState).map((todos) =>
        todos.update(todoId, (todo) => todo.copyWith(completed: isCompleted)));
  }
}

class DeleteTodo implements AppAction {
  final String todoId;

  DeleteTodo(this.todoId);

  @override
  AppState updateState(AppState appState) {
    final deleted = appState.todosState.todos.delete(todoId);
    return _todoListLens.of(appState).update(deleted);
  }
}

class UpdateTodo implements AppAction {
  final String todoId;
  final String task;
  final String notes;

  UpdateTodo(this.todoId, this.task, this.notes);

  @override
  AppState updateState(AppState appState) {
    return _todoListLens.of(appState).map((todos) =>
        todos.update(todoId, (todo) => todo.copyWith(task: task, note: notes)));
  }
}

class SetActiveTab implements AppAction {
  final AppTab activeTab;

  SetActiveTab(this.activeTab);

  @override
  AppState updateState(AppState appState) {
    return appState.copyWith(activeTab: activeTab);
  }
}

class SetVisibilityFilter implements AppAction {
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

class ClearCompleted implements AppAction {
  @override
  AppState updateState(AppState appState) {
    return _todoListLens
        .of(appState)
        .map((todos) => todos.filterValues((todo) => !todo.completed));
  }
}

class CompleteAll implements AppAction {
  @override
  AppState updateState(AppState appState) {
    return _todoListLens.of(appState).map((todos) =>
        todos.mapValues((entry) => entry.value.copyWith(completed: true)));
  }
}

class UnCompleteAll implements AppAction {
  @override
  AppState updateState(AppState appState) {
    return _todoListLens.of(appState).map((todos) =>
        todos.mapValues((entry) => entry.value.copyWith(completed: false)));
  }
}

class AddTodo implements AppAction {
  final Todo todo;

  AddTodo(this.todo);

  @override
  AppState updateState(AppState appState) {
    return _todoListLens.of(appState).map((todos) => todos.put(todo.id, todo));
  }
}

class SetTodos implements AppAction {
  final Iterable<Todo> list;

  SetTodos(this.list);

  @override
  AppState updateState(AppState appState) {
    return _todoListLens.of(appState).map(
        (todos) => todos.putAll(listFrom(list).associateBy((todo) => todo.id)));
  }
}

class SetLoading implements AppAction {
  final bool isLoading;

  SetLoading(this.isLoading);

  @override
  AppState updateState(AppState appState) {
    return AppState$.todosState
        .of(appState)
        .map((todosState) => todosState.copyWith(isLoading: isLoading));
  }
}

class SetDataInitialized implements AppAction {
  @override
  AppState updateState(AppState appState) {
    return AppState$.todosState
        .of(appState)
        .map((todosState) => todosState.copyWith(dataIsInitialized: true));
  }
}
