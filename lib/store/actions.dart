import 'package:fun_arch_todo_flutter/models/app_state.dart';
import 'package:fun_arch_todo_flutter/models/app_tab.dart';
import 'package:fun_arch_todo_flutter/models/todo.dart';
import 'package:fun_arch_todo_flutter/models/todos_state.dart';
import 'package:fun_arch_todo_flutter/models/visibility_filter.dart';
import 'package:fun_arch_todo_flutter/store/app_store.dart';
import 'package:fun_arch_todo_flutter/utils/lens.dart';
import 'package:fun_arch_todo_flutter/utils/maybe.dart';

ILens<AppState, Map<String, Todo>> _todosLens =
    AppState.todosStateLens.combine(TodosState.todosLens);

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
        : AppState.todosStateLens.update(
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

ActionFunction selectTodo(String todoId) => AppState.todosStateLens.update(
      (todos) => todos.copyWith(selectedTodoId: Maybe.some(todoId)),
    );

ActionFunction clearTodoSelection() => AppState.todosStateLens.update(
      (todos) => todos.copyWith(selectedTodoId: Maybe.none()),
    );

ActionFunction setTodos(Iterable<Todo> list) => _todosLens.update(
      (todos) => todos..addEntries(list.map((td) => MapEntry(td.id, td))),
    );
