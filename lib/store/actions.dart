import 'package:redurx_light_starter/models/app_state.dart';
import 'package:redurx_light_starter/models/app_tab.dart';
import 'package:redurx_light_starter/models/todo.dart';
import 'package:redurx_light_starter/models/todos_state.dart';
import 'package:redurx_light_starter/models/visibility_filter.dart';
import 'package:redurx_light_starter/store/app_store.dart';
import 'package:redurx_light_starter/utils/lens.dart';
import 'package:redurx_light_starter/utils/maybe.dart';

ILens<AppState, Map<String, Todo>> _todosLens =
    AppState.todosLens.combine(TodosState.todosLens);

AppState _updateTodo(AppState state, String todoId, Todo update(Todo todo)) {
  return _todosLens.update(
      state, (todos) => todos..[todoId] = update(todos[todoId]));
}

ActionFunction markCompletion(String todoId, bool isCompleted) =>
    (state) => _updateTodo(
          state,
          todoId,
          (todo) => todo.copyWith(completed: isCompleted),
        );

ActionFunction deleteTodo(String todoId) => (state) {
      final todos = _todosLens.get(state);
      todos.remove(todoId);
      return _todosLens.update(state, (todos) => todos..remove(todoId));
    };

ActionFunction updateTodo(String todoId, String task, String notes) =>
    (state) => _updateTodo(
          state,
          todoId,
          (item) => item.copyWith(task: task, note: notes),
        );

ActionFunction setActiveTab(AppTab activeTab) => (state) =>
    state.activeTab == activeTab ? state : state.copyWith(activeTab: activeTab);

ActionFunction setVisibilityFilter(VisibilityFilter visibilityFilter) =>
    (state) => state.todosState.visibilityFilter == visibilityFilter
        ? state
        : AppState.todosLens.update(
            state,
            (td) => td.copyWith(visibilityFilter: visibilityFilter),
          );

ActionFunction clearCompleted() => (state) => _todosLens.update(
      state,
      (todos) => todos..removeWhere((_, todo) => todo.completed),
    );

ActionFunction completeAll() => (state) => _todosLens.update(
      state,
      (todos) => todos..updateAll((_, todo) => todo.copyWith(completed: true)),
    );

ActionFunction unCompleteAll() => (state) => _todosLens.update(
      state,
      (todos) => todos..updateAll((_, todo) => todo.copyWith(completed: false)),
    );

ActionFunction addTodo(Todo todo) => (state) => _todosLens.update(
      state,
      (todos) => todos..[todo.id] = todo,
    );

ActionFunction selectTodo(String todoId) =>
    (state) => AppState.todosLens.update(
          state,
          (todos) => todos.copyWith(selectedTodoId: Maybe(todoId)),
        );

ActionFunction clearTodoSelection() => (state) => AppState.todosLens.update(
      state,
      (todos) => todos.copyWith(selectedTodoId: Maybe.nothing()),
    );
