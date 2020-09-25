// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$AppStateTearOff {
  const _$AppStateTearOff();

// ignore: unused_element
  _AppState call(
      {@required TodosState todosState, @required AppTab activeTab}) {
    return _AppState(
      todosState: todosState,
      activeTab: activeTab,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $AppState = _$AppStateTearOff();

/// @nodoc
mixin _$AppState {
  TodosState get todosState;
  AppTab get activeTab;

  $AppStateCopyWith<AppState> get copyWith;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res>;
  $Res call({TodosState todosState, AppTab activeTab});

  $TodosStateCopyWith<$Res> get todosState;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res> implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  final AppState _value;
  // ignore: unused_field
  final $Res Function(AppState) _then;

  @override
  $Res call({
    Object todosState = freezed,
    Object activeTab = freezed,
  }) {
    return _then(_value.copyWith(
      todosState:
          todosState == freezed ? _value.todosState : todosState as TodosState,
      activeTab: activeTab == freezed ? _value.activeTab : activeTab as AppTab,
    ));
  }

  @override
  $TodosStateCopyWith<$Res> get todosState {
    if (_value.todosState == null) {
      return null;
    }
    return $TodosStateCopyWith<$Res>(_value.todosState, (value) {
      return _then(_value.copyWith(todosState: value));
    });
  }
}

/// @nodoc
abstract class _$AppStateCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$AppStateCopyWith(_AppState value, $Res Function(_AppState) then) =
      __$AppStateCopyWithImpl<$Res>;
  @override
  $Res call({TodosState todosState, AppTab activeTab});

  @override
  $TodosStateCopyWith<$Res> get todosState;
}

/// @nodoc
class __$AppStateCopyWithImpl<$Res> extends _$AppStateCopyWithImpl<$Res>
    implements _$AppStateCopyWith<$Res> {
  __$AppStateCopyWithImpl(_AppState _value, $Res Function(_AppState) _then)
      : super(_value, (v) => _then(v as _AppState));

  @override
  _AppState get _value => super._value as _AppState;

  @override
  $Res call({
    Object todosState = freezed,
    Object activeTab = freezed,
  }) {
    return _then(_AppState(
      todosState:
          todosState == freezed ? _value.todosState : todosState as TodosState,
      activeTab: activeTab == freezed ? _value.activeTab : activeTab as AppTab,
    ));
  }
}

/// @nodoc
class _$_AppState implements _AppState {
  _$_AppState({@required this.todosState, @required this.activeTab})
      : assert(todosState != null),
        assert(activeTab != null);

  @override
  final TodosState todosState;
  @override
  final AppTab activeTab;

  @override
  String toString() {
    return 'AppState(todosState: $todosState, activeTab: $activeTab)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AppState &&
            (identical(other.todosState, todosState) ||
                const DeepCollectionEquality()
                    .equals(other.todosState, todosState)) &&
            (identical(other.activeTab, activeTab) ||
                const DeepCollectionEquality()
                    .equals(other.activeTab, activeTab)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(todosState) ^
      const DeepCollectionEquality().hash(activeTab);

  @override
  _$AppStateCopyWith<_AppState> get copyWith =>
      __$AppStateCopyWithImpl<_AppState>(this, _$identity);
}

abstract class _AppState implements AppState {
  factory _AppState(
      {@required TodosState todosState,
      @required AppTab activeTab}) = _$_AppState;

  @override
  TodosState get todosState;
  @override
  AppTab get activeTab;
  @override
  _$AppStateCopyWith<_AppState> get copyWith;
}
