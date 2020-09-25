// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'todo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$TodoTearOff {
  const _$TodoTearOff();

// ignore: unused_element
  _Todo call(
      {@required String task,
      @required String note,
      @required String id,
      @required bool completed}) {
    return _Todo(
      task: task,
      note: note,
      id: id,
      completed: completed,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $Todo = _$TodoTearOff();

/// @nodoc
mixin _$Todo {
  String get task;
  String get note;
  String get id;
  bool get completed;

  $TodoCopyWith<Todo> get copyWith;
}

/// @nodoc
abstract class $TodoCopyWith<$Res> {
  factory $TodoCopyWith(Todo value, $Res Function(Todo) then) =
      _$TodoCopyWithImpl<$Res>;
  $Res call({String task, String note, String id, bool completed});
}

/// @nodoc
class _$TodoCopyWithImpl<$Res> implements $TodoCopyWith<$Res> {
  _$TodoCopyWithImpl(this._value, this._then);

  final Todo _value;
  // ignore: unused_field
  final $Res Function(Todo) _then;

  @override
  $Res call({
    Object task = freezed,
    Object note = freezed,
    Object id = freezed,
    Object completed = freezed,
  }) {
    return _then(_value.copyWith(
      task: task == freezed ? _value.task : task as String,
      note: note == freezed ? _value.note : note as String,
      id: id == freezed ? _value.id : id as String,
      completed: completed == freezed ? _value.completed : completed as bool,
    ));
  }
}

/// @nodoc
abstract class _$TodoCopyWith<$Res> implements $TodoCopyWith<$Res> {
  factory _$TodoCopyWith(_Todo value, $Res Function(_Todo) then) =
      __$TodoCopyWithImpl<$Res>;
  @override
  $Res call({String task, String note, String id, bool completed});
}

/// @nodoc
class __$TodoCopyWithImpl<$Res> extends _$TodoCopyWithImpl<$Res>
    implements _$TodoCopyWith<$Res> {
  __$TodoCopyWithImpl(_Todo _value, $Res Function(_Todo) _then)
      : super(_value, (v) => _then(v as _Todo));

  @override
  _Todo get _value => super._value as _Todo;

  @override
  $Res call({
    Object task = freezed,
    Object note = freezed,
    Object id = freezed,
    Object completed = freezed,
  }) {
    return _then(_Todo(
      task: task == freezed ? _value.task : task as String,
      note: note == freezed ? _value.note : note as String,
      id: id == freezed ? _value.id : id as String,
      completed: completed == freezed ? _value.completed : completed as bool,
    ));
  }
}

/// @nodoc
class _$_Todo with DiagnosticableTreeMixin implements _Todo {
  _$_Todo(
      {@required this.task,
      @required this.note,
      @required this.id,
      @required this.completed})
      : assert(task != null),
        assert(note != null),
        assert(id != null),
        assert(completed != null);

  @override
  final String task;
  @override
  final String note;
  @override
  final String id;
  @override
  final bool completed;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Todo(task: $task, note: $note, id: $id, completed: $completed)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Todo'))
      ..add(DiagnosticsProperty('task', task))
      ..add(DiagnosticsProperty('note', note))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('completed', completed));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Todo &&
            (identical(other.task, task) ||
                const DeepCollectionEquality().equals(other.task, task)) &&
            (identical(other.note, note) ||
                const DeepCollectionEquality().equals(other.note, note)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.completed, completed) ||
                const DeepCollectionEquality()
                    .equals(other.completed, completed)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(task) ^
      const DeepCollectionEquality().hash(note) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(completed);

  @override
  _$TodoCopyWith<_Todo> get copyWith =>
      __$TodoCopyWithImpl<_Todo>(this, _$identity);
}

abstract class _Todo implements Todo {
  factory _Todo(
      {@required String task,
      @required String note,
      @required String id,
      @required bool completed}) = _$_Todo;

  @override
  String get task;
  @override
  String get note;
  @override
  String get id;
  @override
  bool get completed;
  @override
  _$TodoCopyWith<_Todo> get copyWith;
}
