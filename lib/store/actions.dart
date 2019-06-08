import 'package:redurx_light_starter/models/app_state.dart';
import 'package:redurx_light_starter/models/app_tab.dart';
import 'package:redurx_light_starter/models/todo.dart';
import 'package:redurx_light_starter/models/visibility_filter.dart';
import 'package:redurx_light_starter/store/app_store.dart';
import 'package:redurx_light_starter/utils/utils.dart';

class MarkCompletion implements AppAction {
  final String todoId;
  final bool isCompleted;

  MarkCompletion(this.todoId, this.isCompleted);

  @override
  AppState reduce(AppState state) {
    final List<Todo> todos = updateListItem(
      state.todos,
      find: (item) => item.id == todoId,
      update: (item) => item.copyWith(completed: isCompleted),
    );

    return state.copyWith(todos: todos);
  }
}

class DeleteTodo implements AppAction {
  final String todoId;

  DeleteTodo(this.todoId);

  @override
  AppState reduce(AppState state) {
    return state.copyWith(
      todos: state.todos.where((item) => item.id != todoId),
    );
  }
}

class UpdateTodo implements AppAction {
  final String todoId;
  final String task;
  final String notes;

  UpdateTodo(this.todoId, this.task, this.notes);

  @override
  AppState reduce(AppState state) {
    final List<Todo> todos = updateListItem(
      state.todos,
      find: (item) => item.id == todoId,
      update: (item) => item.copyWith(task: task, note: notes),
    );

    return state.copyWith(todos: todos);
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
    return state.visibilityFilter == visibilityFilter
        ? state
        : state.copyWith(visibilityFilter: visibilityFilter);
  }
}

class ClearCompleted implements AppAction {
  @override
  AppState reduce(AppState state) {
    return state.copyWith(todos: state.todos.where((t) => !t.completed));
  }
}

class CompleteAll implements AppAction {
  @override
  AppState reduce(AppState state) {
    return state.copyWith(
        todos: state.todos.map((t) => t.copyWith(completed: true)));
  }
}

class UnCompleteAll implements AppAction {
  @override
  AppState reduce(AppState state) {
    return state.copyWith(
        todos: state.todos.map((t) => t.copyWith(completed: false)));
  }
}

class AddTodo implements AppAction {
  final Todo todo;

  AddTodo(this.todo);

  @override
  AppState reduce(AppState state) {
    return state.copyWith(todos: List.from(state.todos)..add(todo));
  }
}
