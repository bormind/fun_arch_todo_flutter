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
  KtMap<String, Todo> get todos;
  VisibilityFilter get visibilityFilter;
  bool get isLoading;
  bool get initializedFromLocalStorage;
  TodosState copyWith(
          {KtMap<String, Todo>? todos,
          VisibilityFilter? visibilityFilter,
          bool? isLoading,
          bool? initializedFromLocalStorage}) =>
      TodosState(
          todos: todos ?? this.todos,
          visibilityFilter: visibilityFilter ?? this.visibilityFilter,
          isLoading: isLoading ?? this.isLoading,
          initializedFromLocalStorage:
              initializedFromLocalStorage ?? this.initializedFromLocalStorage);
  @override
  String toString() =>
      "TodosState(todos: $todos, visibilityFilter: $visibilityFilter, isLoading: $isLoading, initializedFromLocalStorage: $initializedFromLocalStorage)";
  @override
  bool operator ==(Object other) =>
      other is TodosState &&
      other.runtimeType == runtimeType &&
      todos == other.todos &&
      visibilityFilter == other.visibilityFilter &&
      isLoading == other.isLoading &&
      initializedFromLocalStorage == other.initializedFromLocalStorage;
  @override
  int get hashCode {
    var result = 17;
    result = 37 * result + todos.hashCode;
    result = 37 * result + visibilityFilter.hashCode;
    result = 37 * result + isLoading.hashCode;
    result = 37 * result + initializedFromLocalStorage.hashCode;
    return result;
  }
}

class TodosState$ {
  static final todos = Lens<TodosState, KtMap<String, Todo>>(
      (s_) => s_.todos, (s_, todos) => s_.copyWith(todos: todos));
  static final visibilityFilter = Lens<TodosState, VisibilityFilter>(
      (s_) => s_.visibilityFilter,
      (s_, visibilityFilter) =>
          s_.copyWith(visibilityFilter: visibilityFilter));
  static final isLoading = Lens<TodosState, bool>((s_) => s_.isLoading,
      (s_, isLoading) => s_.copyWith(isLoading: isLoading));
  static final initializedFromLocalStorage = Lens<TodosState, bool>(
      (s_) => s_.initializedFromLocalStorage,
      (s_, initializedFromLocalStorage) => s_.copyWith(
          initializedFromLocalStorage: initializedFromLocalStorage));
}
