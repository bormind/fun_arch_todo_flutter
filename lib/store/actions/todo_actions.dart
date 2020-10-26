import 'package:fun_arch_todo_flutter/models/app_state.dart';
import 'package:fun_arch_todo_flutter/models/todo.dart';
import 'package:fun_arch_todo_flutter/models/todos_state.dart';
import 'package:fun_arch_todo_flutter/store/actions/action.dart';
import 'package:fun_arch_todo_flutter/utils/map_extensions.dart';
import 'package:functional_data/functional_data.dart';
import 'package:kt_dart/kt.dart';

final Lens<AppState, KtMap<String, Todo>> _todoListLens =
    AppState$.todosState.then(TodosState$.todos);

class MarkCompletion implements Action {
  final String todoId;
  final bool isCompleted;

  MarkCompletion(this.todoId, this.isCompleted);

  @override
  AppState updateState(AppState appState) {
    return _todoListLens.of(appState).map((todos) =>
        todos.update(todoId, (todo) => todo.copyWith(completed: isCompleted)));
  }
}

class DeleteTodo implements Action {
  final String todoId;

  DeleteTodo(this.todoId);

  @override
  AppState updateState(AppState appState) {
    final deleted = appState.todosState.todos.delete(todoId);
    return _todoListLens.of(appState).update(deleted);
  }
}

class UpdateTodo implements Action {
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

class ClearCompleted implements Action {
  @override
  AppState updateState(AppState appState) {
    return _todoListLens
        .of(appState)
        .map((todos) => todos.filterValues((todo) => !todo.completed));
  }
}

class CompleteAll implements Action {
  @override
  AppState updateState(AppState appState) {
    return _todoListLens.of(appState).map((todos) =>
        todos.mapValues((entry) => entry.value.copyWith(completed: true)));
  }
}

class UnCompleteAll implements Action {
  @override
  AppState updateState(AppState appState) {
    return _todoListLens.of(appState).map((todos) =>
        todos.mapValues((entry) => entry.value.copyWith(completed: false)));
  }
}

class AddTodo implements Action {
  final Todo todo;

  AddTodo(this.todo);

  @override
  AppState updateState(AppState appState) {
    return _todoListLens.of(appState).map((todos) => todos.put(todo.id, todo));
  }
}

class SetTodos implements Action {
  final Iterable<Todo> list;

  SetTodos(this.list);

  @override
  AppState updateState(AppState appState) {
    return _todoListLens.of(appState).map(
        (todos) => todos.putAll(listFrom(list).associateBy((todo) => todo.id)));
  }
}
