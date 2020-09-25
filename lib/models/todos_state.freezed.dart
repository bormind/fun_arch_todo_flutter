// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'todos_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$TodosStateTearOff {
  const _$TodosStateTearOff();

// ignore: unused_element
  _TodosState call(
      {@required KtMap<String, Todo> todos,
      @required VisibilityFilter visibilityFilter,
      @required Option<String> selectedTodoId,
      @required bool isLoading}) {
    return _TodosState(
      todos: todos,
      visibilityFilter: visibilityFilter,
      selectedTodoId: selectedTodoId,
      isLoading: isLoading,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $TodosState = _$TodosStateTearOff();

/// @nodoc
mixin _$TodosState {
  KtMap<String, Todo> get todos;
  VisibilityFilter get visibilityFilter;
  Option<String> get selectedTodoId;
  bool get isLoading;

  $TodosStateCopyWith<TodosState> get copyWith;
}

/// @nodoc
abstract class $TodosStateCopyWith<$Res> {
  factory $TodosStateCopyWith(
          TodosState value, $Res Function(TodosState) then) =
      _$TodosStateCopyWithImpl<$Res>;
  $Res call(
      {KtMap<String, Todo> todos,
      VisibilityFilter visibilityFilter,
      Option<String> selectedTodoId,
      bool isLoading});
}

/// @nodoc
class _$TodosStateCopyWithImpl<$Res> implements $TodosStateCopyWith<$Res> {
  _$TodosStateCopyWithImpl(this._value, this._then);

  final TodosState _value;
  // ignore: unused_field
  final $Res Function(TodosState) _then;

  @override
  $Res call({
    Object todos = freezed,
    Object visibilityFilter = freezed,
    Object selectedTodoId = freezed,
    Object isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      todos: todos == freezed ? _value.todos : todos as KtMap<String, Todo>,
      visibilityFilter: visibilityFilter == freezed
          ? _value.visibilityFilter
          : visibilityFilter as VisibilityFilter,
      selectedTodoId: selectedTodoId == freezed
          ? _value.selectedTodoId
          : selectedTodoId as Option<String>,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
    ));
  }
}

/// @nodoc
abstract class _$TodosStateCopyWith<$Res> implements $TodosStateCopyWith<$Res> {
  factory _$TodosStateCopyWith(
          _TodosState value, $Res Function(_TodosState) then) =
      __$TodosStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {KtMap<String, Todo> todos,
      VisibilityFilter visibilityFilter,
      Option<String> selectedTodoId,
      bool isLoading});
}

/// @nodoc
class __$TodosStateCopyWithImpl<$Res> extends _$TodosStateCopyWithImpl<$Res>
    implements _$TodosStateCopyWith<$Res> {
  __$TodosStateCopyWithImpl(
      _TodosState _value, $Res Function(_TodosState) _then)
      : super(_value, (v) => _then(v as _TodosState));

  @override
  _TodosState get _value => super._value as _TodosState;

  @override
  $Res call({
    Object todos = freezed,
    Object visibilityFilter = freezed,
    Object selectedTodoId = freezed,
    Object isLoading = freezed,
  }) {
    return _then(_TodosState(
      todos: todos == freezed ? _value.todos : todos as KtMap<String, Todo>,
      visibilityFilter: visibilityFilter == freezed
          ? _value.visibilityFilter
          : visibilityFilter as VisibilityFilter,
      selectedTodoId: selectedTodoId == freezed
          ? _value.selectedTodoId
          : selectedTodoId as Option<String>,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
    ));
  }
}

/// @nodoc
class _$_TodosState implements _TodosState {
  _$_TodosState(
      {@required this.todos,
      @required this.visibilityFilter,
      @required this.selectedTodoId,
      @required this.isLoading})
      : assert(todos != null),
        assert(visibilityFilter != null),
        assert(selectedTodoId != null),
        assert(isLoading != null);

  @override
  final KtMap<String, Todo> todos;
  @override
  final VisibilityFilter visibilityFilter;
  @override
  final Option<String> selectedTodoId;
  @override
  final bool isLoading;

  bool _didvisibleTodos = false;
  KtList<Todo> _visibleTodos;

  @override
  KtList<Todo> get visibleTodos {
    if (_didvisibleTodos == false) {
      _didvisibleTodos = true;
      _visibleTodos = this.visibilityFilter == VisibilityFilter.all
          ? todos.values.toList()
          : todos.values.filter((td) =>
              (td.completed &&
                  visibilityFilter == VisibilityFilter.completed) ||
              (!td.completed && visibilityFilter == VisibilityFilter.active));
    }
    return _visibleTodos;
  }

  bool _didselectedTodo = false;
  Option<Todo> _selectedTodo;

  @override
  Option<Todo> get selectedTodo {
    if (_didselectedTodo == false) {
      _didselectedTodo = true;
      _selectedTodo = selectedTodoId.map((todoId) => this.todos[todoId]);
    }
    return _selectedTodo;
  }

  bool _didnumCompleted = false;
  int _numCompleted;

  @override
  int get numCompleted {
    if (_didnumCompleted == false) {
      _didnumCompleted = true;
      _numCompleted = todos.values.filter((item) => item.completed).size;
    }
    return _numCompleted;
  }

  bool _didnumActive = false;
  int _numActive;

  @override
  int get numActive {
    if (_didnumActive == false) {
      _didnumActive = true;
      _numActive = todos.values.filter((item) => !item.completed).size;
    }
    return _numActive;
  }

  @override
  String toString() {
    return 'TodosState(todos: $todos, visibilityFilter: $visibilityFilter, selectedTodoId: $selectedTodoId, isLoading: $isLoading, visibleTodos: $visibleTodos, selectedTodo: $selectedTodo, numCompleted: $numCompleted, numActive: $numActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TodosState &&
            (identical(other.todos, todos) ||
                const DeepCollectionEquality().equals(other.todos, todos)) &&
            (identical(other.visibilityFilter, visibilityFilter) ||
                const DeepCollectionEquality()
                    .equals(other.visibilityFilter, visibilityFilter)) &&
            (identical(other.selectedTodoId, selectedTodoId) ||
                const DeepCollectionEquality()
                    .equals(other.selectedTodoId, selectedTodoId)) &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(todos) ^
      const DeepCollectionEquality().hash(visibilityFilter) ^
      const DeepCollectionEquality().hash(selectedTodoId) ^
      const DeepCollectionEquality().hash(isLoading);

  @override
  _$TodosStateCopyWith<_TodosState> get copyWith =>
      __$TodosStateCopyWithImpl<_TodosState>(this, _$identity);
}

abstract class _TodosState implements TodosState {
  factory _TodosState(
      {@required KtMap<String, Todo> todos,
      @required VisibilityFilter visibilityFilter,
      @required Option<String> selectedTodoId,
      @required bool isLoading}) = _$_TodosState;

  @override
  KtMap<String, Todo> get todos;
  @override
  VisibilityFilter get visibilityFilter;
  @override
  Option<String> get selectedTodoId;
  @override
  bool get isLoading;
  @override
  _$TodosStateCopyWith<_TodosState> get copyWith;
}
