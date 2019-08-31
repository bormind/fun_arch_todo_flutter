import 'dart:collection';

import 'package:meta/meta.dart';
import 'package:fun_arch_todo_flutter/models/todo.dart';
import 'package:fun_arch_todo_flutter/models/visibility_filter.dart';
import 'package:fun_arch_todo_flutter/utils/lens.dart';
import 'package:fun_arch_todo_flutter/utils/maybe.dart';
import 'package:fun_arch_todo_flutter/utils/memoized.dart';

Memoized2<Iterable<Todo>, VisibilityFilter, List<Todo>> _visibleTodos =
    Memoized2((todos, visibility) {
  if (visibility == VisibilityFilter.all) {
    return todos.toList();
  } else {
    return todos
        .where((td) =>
            (td.completed && visibility == VisibilityFilter.completed) ||
            (!td.completed && visibility == VisibilityFilter.active))
        .toList();
  }
});

class TodosState {
  static ILens<TodosState, LinkedHashMap<String, Todo>> todosLens = Lens(
    (state) => state.todos,
    (todos) => (state) => state.copyWith(todos: LinkedHashMap.from(todos)),
  );

  final Map<String, Todo> todos;
  final VisibilityFilter visibilityFilter;
  final Maybe<String> selectedTodoId;
  final bool isLoading;

  TodosState({
    @required this.todos,
    @required this.visibilityFilter,
    @required this.selectedTodoId,
    @required this.isLoading,
  });

  TodosState copyWith({
    Map<String, Todo> todos,
    VisibilityFilter visibilityFilter,
    Maybe<String> selectedTodoId,
    bool isLoadingTodos,
  }) {
    return TodosState(
      todos: todos ?? this.todos,
      visibilityFilter: visibilityFilter ?? this.visibilityFilter,
      selectedTodoId: selectedTodoId ?? this.selectedTodoId,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  Iterable<Todo> get visibleTodos =>
      _visibleTodos.getOrCalculate(this.todos.values, this.visibilityFilter);

  Maybe<Todo> get selectedTodo {
    return selectedTodoId.map((todoId) => this.todos[todoId]);
  }

  factory TodosState.initial() {
    return TodosState(
      todos: new LinkedHashMap(),
      visibilityFilter: VisibilityFilter.all,
      selectedTodoId: Maybe.none(),
      isLoading: false,
    );
  }
}
