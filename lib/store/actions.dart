import 'package:fun_arch_todo_flutter/models/app_state.dart';
import 'package:fun_arch_todo_flutter/models/app_tab.dart';
import 'package:fun_arch_todo_flutter/models/todo.dart';
import 'package:fun_arch_todo_flutter/models/todos_state.dart';
import 'package:fun_arch_todo_flutter/models/visibility_filter.dart';
import 'package:plain_optional/plain_optional.dart';
import 'package:fun_arch_todo_flutter/utils/map_extensions.dart';

typedef Map<String, Todo> TodosUpdate(Map<String, Todo> todos);

abstract class Action {
  AppState updateState(AppState appState);
}

final _todosLens = AppState$.todosState.then(TodosState$.todos);

TodosUpdate _updateTodos(Todo update(Todo todo)) {
  return (originalMap) =>
      originalMap.map((key, todo) => MapEntry(key, update(todo)));
}

TodosUpdate _updateTodo(String key, Todo update(Todo todo)) {
  return (originalMap) {
    if (!originalMap.containsKey(key)) {
      return originalMap;
    }

    return originalMap.clone()..[key] = update(originalMap[key]);
  };
}

TodosUpdate _deleteTodo(String key) {
  return (originalMap) => originalMap.clone()..remove(key);
}

class MarkCompletion implements Action {
  final String todoId;
  final bool isCompleted;

  MarkCompletion(this.todoId, this.isCompleted);

  @override
  AppState updateState(AppState appState) {
    return _todosLens.of(appState).map(
        _updateTodo(todoId, (todo) => todo.copyWith(completed: isCompleted)));
  }
}

class DeleteTodo implements Action {
  final String todoId;

  DeleteTodo(this.todoId);

  @override
  AppState updateState(AppState appState) {
    return _todosLens.of(appState).map(_deleteTodo(todoId));
  }
}

class UpdateTodo implements Action {
  final String todoId;
  final String task;
  final String notes;

  UpdateTodo(this.todoId, this.task, this.notes);

  @override
  AppState updateState(AppState appState) {
    return _todosLens.of(appState).map(
        _updateTodo(todoId, (todo) => todo.copyWith(task: task, note: notes)));
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
  final visibilityFilterLens =
      AppState$.todosState.then(TodosState$.visibilityFilter);

  SetVisibilityFilter(this.visibilityFilter);

  @override
  AppState updateState(AppState appState) {
    if (appState.todosState.visibilityFilter == visibilityFilter) {
      return appState;
    }

    return visibilityFilterLens.of(appState).update(visibilityFilter);
  }
}

class ClearCompleted implements Action {
  @override
  AppState updateState(AppState appState) {
    return _todosLens.of(appState).map((originalTodos) =>
        originalTodos.clone()..removeWhere((_, todo) => todo.completed));
  }
}

class CompleteAll implements Action {
  @override
  AppState updateState(AppState appState) {
    return _todosLens
        .of(appState)
        .map(_updateTodos((todo) => todo.copyWith(completed: true)));
  }
}

class UnCompleteAll implements Action {
  @override
  AppState updateState(AppState appState) {
    return _todosLens
        .of(appState)
        .map(_updateTodos((todo) => todo.copyWith(completed: false)));
  }
}

class AddTodo implements Action {
  final Todo todo;

  AddTodo(this.todo);

  @override
  AppState updateState(AppState appState) {
    return _todosLens
        .of(appState)
        .map((originalTodos) => originalTodos.clone()..[todo.id] = todo);
  }
}

class SelectTodo implements Action {
  final String todoId;

  SelectTodo(this.todoId);

  @override
  AppState updateState(AppState appState) {
    return AppState$.todosState.map(
        (todosState) => todosState.copyWith(selectedTodoId: Optional(todoId)),
        appState);
  }
}

class ClearSelection implements Action {
  @override
  AppState updateState(AppState appState) {
    return AppState$.todosState.map(
        (todosState) => todosState.copyWith(selectedTodoId: Optional.none()),
        appState);
  }
}

class SetTodos implements Action {
  final Iterable<Todo> list;

  SetTodos(this.list);

  @override
  AppState updateState(AppState appState) {
    return _todosLens.of(appState).map((originalTodos) => originalTodos.clone()
      ..addEntries(list.map((todo) => MapEntry(todo.id, todo))));
  }
}
