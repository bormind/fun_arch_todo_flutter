import 'package:meta/meta.dart';
import 'package:redurx_light_starter/models/todo.dart';
import 'package:redurx_light_starter/models/visibility_filter.dart';
import 'package:redurx_light_starter/utils/lens.dart';
import 'package:redurx_light_starter/utils/memoized.dart';

Memoized2<List<Todo>, List<Todo>, VisibilityFilter> _visibleTodos =
    Memoized2((todos, visibility) {
  if (visibility == VisibilityFilter.all) {
    return todos;
  } else {
    return todos
        .where((td) =>
            (td.completed && visibility == VisibilityFilter.completed) ||
            (!td.completed && visibility == VisibilityFilter.active))
        .toList();
  }
});

class TodosState {
  static ILens<TodosState, List<Todo>> todoListLens = Lens(
    (state) => state.todos,
    (state, todos) => state.copyWith(todos: todos),
  );

  final List<Todo> todos;
  final VisibilityFilter visibilityFilter;
  final bool isLoading;

  TodosState({
    @required this.todos,
    @required this.visibilityFilter,
    @required this.isLoading,
  });

  TodosState copyWith({
    List<Todo> todos,
    VisibilityFilter visibilityFilter,
    bool isLoadingTodos,
  }) {
    return TodosState(
      todos: todos ?? this.todos,
      visibilityFilter: visibilityFilter ?? this.visibilityFilter,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  List<Todo> get visibleTodos =>
      _visibleTodos.getOrCalculate(this.todos, this.visibilityFilter);

  factory TodosState.initial() {
    return TodosState(
      todos: [],
      visibilityFilter: VisibilityFilter.all,
      isLoading: false,
    );
  }
}
