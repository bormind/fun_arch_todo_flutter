import 'package:functional_data/functional_data.dart';
import 'package:kt_dart/collection.dart';
import 'package:meta/meta.dart';
import 'package:fun_arch_todo_flutter/models/todo.dart';
import 'package:fun_arch_todo_flutter/models/visibility_filter.dart';

part 'todos_state.g.dart';

@FunctionalData()
class TodosState extends $TodosState {
  final KtMap<String, Todo> todos;
  final VisibilityFilter visibilityFilter;
  final bool isLoading;
  final bool dataIsInitialized;

  TodosState({
    @required KtMap<String, Todo> this.todos,
    @required VisibilityFilter this.visibilityFilter,
    // this is set updated every time we are in a process of loading data (to show spinner while loading)
    @required bool this.isLoading,
    // this is triggered when we initialized data first time (for exmple loaded from local storage)
    @required bool this.dataIsInitialized,
  });

  KtList<Todo> get visibleTodos => this.visibilityFilter == VisibilityFilter.all
      ? todos.values.toList()
      : todos.values.filter((td) =>
          (td.completed && visibilityFilter == VisibilityFilter.completed) ||
          (!td.completed && visibilityFilter == VisibilityFilter.active));

  int get numCompleted => todos.values.filter((item) => item.completed).size;

  int get numActive => todos.values.filter((item) => !item.completed).size;

  factory TodosState.initial() => TodosState(
        todos: KtLinkedMap.empty(),
        visibilityFilter: VisibilityFilter.all,
        isLoading: false,
        dataIsInitialized: false,
      );
}
