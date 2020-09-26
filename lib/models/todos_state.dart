import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';
import 'package:meta/meta.dart';
import 'package:fun_arch_todo_flutter/models/todo.dart';
import 'package:fun_arch_todo_flutter/models/visibility_filter.dart';

part 'todos_state.freezed.dart';

@freezed
abstract class TodosState with _$TodosState {
  factory TodosState({
    @required KtMap<String, Todo> todos,
    @required VisibilityFilter visibilityFilter,
    // this is set updated every time we are in a process of loading data (to show spinner while loading)
    @required bool isLoading,
    // this is triggered when we initialized data first time (for exmple loaded from local storage)
    @required bool dataIsInitialized,
  }) = _TodosState;

  @late
  KtList<Todo> get visibleTodos => this.visibilityFilter == VisibilityFilter.all
      ? todos.values.toList()
      : todos.values.filter((td) =>
          (td.completed && visibilityFilter == VisibilityFilter.completed) ||
          (!td.completed && visibilityFilter == VisibilityFilter.active));

  @late
  int get numCompleted => todos.values.filter((item) => item.completed).size;

  @late
  int get numActive => todos.values.filter((item) => !item.completed).size;

  factory TodosState.initial() => TodosState(
        todos: KtLinkedMap.empty(),
        visibilityFilter: VisibilityFilter.all,
        isLoading: false,
        dataIsInitialized: false,
      );
}
