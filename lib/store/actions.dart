import 'package:redurx_light_starter/models/app_state.dart';
import 'package:redurx_light_starter/models/app_tab.dart';
import 'package:redurx_light_starter/models/todo.dart';
import 'package:redurx_light_starter/models/todos_state.dart';
import 'package:redurx_light_starter/models/visibility_filter.dart';
import 'package:redurx_light_starter/store/app_store.dart';
import 'package:redurx_light_starter/utils/lens.dart';

ILens<AppState, List<Todo>> _todoListLens =
    AppState.todosLens.combine(TodosState.todoListLens);

class MarkCompletion implements AppAction {
  final String todoId;
  final bool isCompleted;

  MarkCompletion(this.todoId, this.isCompleted);

  @override
  AppState reduce(AppState state) {
    return _todoListLens
        .combine(ListLens((item) => item.id == todoId))
        .update(state, (item) => item.copyWith(completed: isCompleted));
  }
}

class DeleteTodo implements AppAction {
  final String todoId;

  DeleteTodo(this.todoId);

  @override
  AppState reduce(AppState state) {
    return _todoListLens.set(
        state, state.todos.todos.where((item) => item.id != todoId));
  }
}

class UpdateTodo implements AppAction {
  final String todoId;
  final String task;
  final String notes;

  UpdateTodo(this.todoId, this.task, this.notes);

  @override
  AppState reduce(AppState state) {
    return _todoListLens
        .combine(ListLens((item) => item.id == todoId))
        .update(state, (item) => item.copyWith(task: task, note: notes));
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
    return state.todos.visibilityFilter == visibilityFilter
        ? state
        : AppState.todosLens.update(
            state, (td) => td.copyWith(visibilityFilter: visibilityFilter));
  }
}

class ClearCompleted implements AppAction {
  @override
  AppState reduce(AppState state) {
    return _todoListLens.set(
        state, state.todos.todos.where((td) => !td.completed));
  }
}

class CompleteAll implements AppAction {
  @override
  AppState reduce(AppState state) {
    return _todoListLens.set(
        state, state.todos.todos.map((t) => t.copyWith(completed: true)));
  }
}

class UnCompleteAll implements AppAction {
  @override
  AppState reduce(AppState state) {
    return _todoListLens.set(
        state, state.todos.todos.map((t) => t.copyWith(completed: false)));
  }
}

class AddTodo implements AppAction {
  final Todo todo;

  AddTodo(this.todo);

  @override
  AppState reduce(AppState state) {
    return _todoListLens.set(state, List.from(state.todos.todos)..add(todo));
  }
}
