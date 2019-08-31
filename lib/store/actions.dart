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

AppState Function(AppState) _updateTodo(
        String todoId, Todo update(Todo todo)) =>
    _todosLens.update(
      (todos) => todos..[todoId] = update(todos[todoId]),
    );

ActionFunction markCompletion(String todoId, bool isCompleted) => _updateTodo(
      todoId,
      (todo) => todo.copyWith(completed: isCompleted),
    );

ActionFunction deleteTodo(String todoId) =>
    _todosLens.update((todos) => todos..remove(todoId));

ActionFunction updateTodo(String todoId, String task, String notes) =>
    _updateTodo(
      todoId,
      (item) => item.copyWith(task: task, note: notes),
    );

ActionFunction setActiveTab(AppTab activeTab) => (state) =>
    state.activeTab == activeTab ? state : state.copyWith(activeTab: activeTab);

ActionFunction setVisibilityFilter(VisibilityFilter visibilityFilter) =>
    (state) => state.todosState.visibilityFilter == visibilityFilter
        ? state
        : AppState.todosLens.update(
            (td) => td.copyWith(visibilityFilter: visibilityFilter),
          )(state);

ActionFunction clearCompleted() => _todosLens.update(
      (todos) => todos..removeWhere((_, todo) => todo.completed),
    );

ActionFunction completeAll() => _todosLens.update(
      (todos) => todos..updateAll((_, todo) => todo.copyWith(completed: true)),
    );

ActionFunction unCompleteAll() => _todosLens.update(
      (todos) => todos..updateAll((_, todo) => todo.copyWith(completed: false)),
    );

ActionFunction addTodo(Todo todo) => _todosLens.update(
      (todos) => todos..[todo.id] = todo,
    );

ActionFunction selectTodo(String todoId) => AppState.todosLens.update(
      (todos) => todos.copyWith(selectedTodoId: Maybe(todoId)),
    );

ActionFunction clearTodoSelection() => AppState.todosLens.update(
      (todos) => todos.copyWith(selectedTodoId: Maybe.nothing()),
    );
