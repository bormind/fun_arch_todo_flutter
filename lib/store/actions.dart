import 'package:fun_arch_todo_flutter/models/app_state.dart';
import 'package:fun_arch_todo_flutter/models/app_tab.dart';
import 'package:fun_arch_todo_flutter/models/todo.dart';

import 'package:fun_arch_todo_flutter/models/visibility_filter.dart';
import 'package:fun_arch_todo_flutter/utils/map_extensions.dart';
import 'package:kt_dart/kt.dart';

typedef AppState UpdateState(AppState appState);

abstract class Action {
  AppState updateState(AppState appState);
}

class MarkCompletion implements Action {
  final String todoId;
  final bool isCompleted;

  MarkCompletion(this.todoId, this.isCompleted);

  @override
  AppState updateState(AppState appState) {
    final updatedTodos = appState.todosState.todos
        .update(todoId, (todo) => todo.copyWith(completed: isCompleted));
    return appState.copyWith.todosState(todos: updatedTodos);
  }
}

class DeleteTodo implements Action {
  final String todoId;

  DeleteTodo(this.todoId);

  @override
  AppState updateState(AppState appState) {
    final deleted = appState.todosState.todos.delete(todoId);
    return appState.copyWith.todosState(todos: deleted);
  }
}

class UpdateTodo implements Action {
  final String todoId;
  final String task;
  final String notes;

  UpdateTodo(this.todoId, this.task, this.notes);

  @override
  AppState updateState(AppState appState) {
    final updatedTodos = appState.todosState.todos
        .update(todoId, (todo) => todo.copyWith(task: task, note: notes));
    return appState.copyWith.todosState(todos: updatedTodos);
  }
}

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

    return appState.copyWith.todosState(visibilityFilter: visibilityFilter);
  }
}

class ClearCompleted implements Action {
  @override
  AppState updateState(AppState appState) {
    final updatedTodos =
        appState.todosState.todos.filterValues((todo) => !todo.completed);
    return appState.copyWith.todosState(todos: updatedTodos);
  }
}

class CompleteAll implements Action {
  @override
  AppState updateState(AppState appState) {
    final updatedTodos = appState.todosState.todos
        .mapValues((entry) => entry.value.copyWith(completed: true));
    return appState.copyWith.todosState(todos: updatedTodos);
  }
}

class UnCompleteAll implements Action {
  @override
  AppState updateState(AppState appState) {
    final updatedTodos = appState.todosState.todos
        .mapValues((entry) => entry.value.copyWith(completed: false));
    return appState.copyWith.todosState(todos: updatedTodos);
  }
}

class AddTodo implements Action {
  final Todo todo;

  AddTodo(this.todo);

  @override
  AppState updateState(AppState appState) {
    final updatedTodos = appState.todosState.todos.put(todo.id, todo);
    return appState.copyWith.todosState(todos: updatedTodos);
  }
}

class SetTodos implements Action {
  final Iterable<Todo> list;

  SetTodos(this.list);

  @override
  AppState updateState(AppState appState) {
    final updatedTodos = appState.todosState.todos
        .putAll(listFrom(list).associateBy((todo) => todo.id));
    return appState.copyWith.todosState(todos: updatedTodos);
  }
}

class SetLoading implements Action {
  final bool isLoading;

  SetLoading(this.isLoading);

  @override
  AppState updateState(AppState appState) {
    return appState.copyWith.todosState(isLoading: isLoading);
  }
}

class SetDataInitialized implements Action {
  @override
  AppState updateState(AppState appState) {
    return appState.copyWith.todosState(dataIsInitialized: true);
  }
}
