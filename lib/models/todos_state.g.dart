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
  bool get dataIsInitialized;
  TodosState copyWith(
          {KtMap<String, Todo> todos,
          VisibilityFilter visibilityFilter,
          bool isLoading,
          bool dataIsInitialized}) =>
      TodosState(
          todos: todos ?? this.todos,
          visibilityFilter: visibilityFilter ?? this.visibilityFilter,
          isLoading: isLoading ?? this.isLoading,
          dataIsInitialized: dataIsInitialized ?? this.dataIsInitialized);
  @override
  String toString() =>
      "TodosState(todos: $todos, visibilityFilter: $visibilityFilter, isLoading: $isLoading, dataIsInitialized: $dataIsInitialized)";
  @override
  bool operator ==(dynamic other) =>
      other.runtimeType == runtimeType &&
      todos == other.todos &&
      visibilityFilter == other.visibilityFilter &&
      isLoading == other.isLoading &&
      dataIsInitialized == other.dataIsInitialized;
  @override
  int get hashCode {
    var result = 17;
    result = 37 * result + todos.hashCode;
    result = 37 * result + visibilityFilter.hashCode;
    result = 37 * result + isLoading.hashCode;
    result = 37 * result + dataIsInitialized.hashCode;
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
  static final dataIsInitialized = Lens<TodosState, bool>(
      (s_) => s_.dataIsInitialized,
      (s_, dataIsInitialized) =>
          s_.copyWith(dataIsInitialized: dataIsInitialized));
}
