// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos_state.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

// ignore_for_file: join_return_with_assignment
// ignore_for_file: avoid_classes_with_only_static_members
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes
abstract class $TodosState {
  const $TodosState();
  Map<String, Todo> get todos;
  VisibilityFilter get visibilityFilter;
  Optional<String> get selectedTodoId;
  bool get isLoading;
  TodosState copyWith(
          {Map<String, Todo> todos,
          VisibilityFilter visibilityFilter,
          Optional<String> selectedTodoId,
          bool isLoading}) =>
      TodosState(
          todos: todos ?? this.todos,
          visibilityFilter: visibilityFilter ?? this.visibilityFilter,
          selectedTodoId: selectedTodoId ?? this.selectedTodoId,
          isLoading: isLoading ?? this.isLoading);
  @override
  String toString() =>
      "TodosState(todos: $todos, visibilityFilter: $visibilityFilter, selectedTodoId: $selectedTodoId, isLoading: $isLoading)";
  @override
  bool operator ==(dynamic other) =>
      other.runtimeType == runtimeType &&
      todos == other.todos &&
      visibilityFilter == other.visibilityFilter &&
      selectedTodoId == other.selectedTodoId &&
      isLoading == other.isLoading;
  @override
  int get hashCode {
    var result = 17;
    result = 37 * result + todos.hashCode;
    result = 37 * result + visibilityFilter.hashCode;
    result = 37 * result + selectedTodoId.hashCode;
    result = 37 * result + isLoading.hashCode;
    return result;
  }
}

class TodosState$ {
  static final todos = Lens<TodosState, Map<String, Todo>>(
      (s_) => s_.todos, (s_, todos) => s_.copyWith(todos: todos));
  static final visibilityFilter = Lens<TodosState, VisibilityFilter>(
      (s_) => s_.visibilityFilter,
      (s_, visibilityFilter) =>
          s_.copyWith(visibilityFilter: visibilityFilter));
  static final selectedTodoId = Lens<TodosState, Optional<String>>(
      (s_) => s_.selectedTodoId,
      (s_, selectedTodoId) => s_.copyWith(selectedTodoId: selectedTodoId));
  static final isLoading = Lens<TodosState, bool>((s_) => s_.isLoading,
      (s_, isLoading) => s_.copyWith(isLoading: isLoading));
}
