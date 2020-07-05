import 'dart:collection';

import 'package:functional_data/functional_data.dart';
import 'package:meta/meta.dart';
import 'package:fun_arch_todo_flutter/models/todo.dart';
import 'package:fun_arch_todo_flutter/models/visibility_filter.dart';
import 'package:fun_arch_todo_flutter/utils/memoized.dart';
import 'package:plain_optional/plain_optional.dart';

part 'todos_state.g.dart';

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

@FunctionalData()
class TodosState extends $TodosState {
  final Map<String, Todo> todos;
  final VisibilityFilter visibilityFilter;
  final Optional<String> selectedTodoId;
  final bool isLoading;

  TodosState({
    @required this.todos,
    @required this.visibilityFilter,
    @required this.selectedTodoId,
    @required this.isLoading,
  });

  Iterable<Todo> get visibleTodos =>
      _visibleTodos.getOrCalculate(this.todos.values, this.visibilityFilter);

  Optional<Todo> get selectedTodo {
    return selectedTodoId.map((todoId) => this.todos[todoId]);
  }

  factory TodosState.initial() {
    return TodosState(
      todos: new LinkedHashMap(),
      visibilityFilter: VisibilityFilter.all,
      selectedTodoId: Optional.none(),
      isLoading: false,
    );
  }
}
