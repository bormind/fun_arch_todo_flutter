import 'package:redurx_light_starter/models/app_state.dart';
import 'package:redurx_light_starter/models/app_tab.dart';
import 'package:redurx_light_starter/models/todo.dart';
import 'package:redurx_light_starter/models/todos_state.dart';
import 'package:redurx_light_starter/models/visibility_filter.dart';
import 'package:redurx_light_starter/store/app_store.dart';
import 'package:redurx_light_starter/utils/lens.dart';

ILens<AppState, Map<String, Todo>> _todosLens =
    AppState.todosLens.combine(TodosState.todosLens);

AppState _updateTodo(AppState state, String todoId, Todo update(Todo todo)) {
  return _todosLens.update(
      state, (todos) => todos..[todoId] = update(todos[todoId]));
}

class MarkCompletion implements AppAction {
  final String todoId;
  final bool isCompleted;

  MarkCompletion(this.todoId, this.isCompleted);

  @override
  AppState reduce(AppState state) {
    return _updateTodo(
        state, todoId, (todo) => todo.copyWith(completed: isCompleted));
  }
}

class DeleteTodo implements AppAction {
  final String todoId;

  DeleteTodo(this.todoId);

  @override
  AppState reduce(AppState state) {
    final todos = _todosLens.get(state);
    todos.remove(todoId);

    return _todosLens.update(state, (todos) => todos..remove(todoId));
  }
}

class UpdateTodo implements AppAction {
  final String todoId;
  final String task;
  final String notes;

  UpdateTodo(this.todoId, this.task, this.notes);

  @override
  AppState reduce(AppState state) {
    return _updateTodo(
        state, todoId, (item) => item.copyWith(task: task, note: notes));
  }
}

class SetActiveTab implements AppAction {
  final AppTab activeTab;

  SetActiveTab(this.activeTab);

  @override
  AppState reduce(AppState state) {
    return state.activeTab == activeTab
        ? state
        : state.copyWith(activeTab: activeTab);
  }
}

class SetVisibilityFilter implements AppAction {
  final VisibilityFilter visibilityFilter;

  SetVisibilityFilter(this.visibilityFilter);

  @override
  AppState reduce(AppState state) {
    return state.todosState.visibilityFilter == visibilityFilter
        ? state
        : AppState.todosLens.update(
            state, (td) => td.copyWith(visibilityFilter: visibilityFilter));
  }
}

class ClearCompleted implements AppAction {
  @override
  AppState reduce(AppState state) {
    return _todosLens.update(
        state, (todos) => todos..removeWhere((_, todo) => todo.completed));
  }
}

class CompleteAll implements AppAction {
  @override
  AppState reduce(AppState state) {
    return _todosLens.update(
        state,
        (todos) =>
            todos..updateAll((_, todo) => todo.copyWith(completed: true)));
  }
}

class UnCompleteAll implements AppAction {
  @override
  AppState reduce(AppState state) {
    return _todosLens.update(
        state,
        (todos) =>
            todos..updateAll((_, todo) => todo.copyWith(completed: false)));
  }
}

class AddTodo implements AppAction {
  final Todo todo;

  AddTodo(this.todo);

  @override
  AppState reduce(AppState state) {
    return _todosLens.update(state, (todos) => todos..[todo.id] = todo);
  }
}
