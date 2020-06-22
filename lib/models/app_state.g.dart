// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

// ignore_for_file: join_return_with_assignment
// ignore_for_file: avoid_classes_with_only_static_members
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes
abstract class $AppState {
  const $AppState();
  TodosState get todosState;
  StatsState get statsState;
  AppTab get activeTab;
  AppState copyWith(
          {TodosState todosState, StatsState statsState, AppTab activeTab}) =>
      AppState(
          todosState: todosState ?? this.todosState,
          statsState: statsState ?? this.statsState,
          activeTab: activeTab ?? this.activeTab);
  @override
  String toString() =>
      "AppState(todosState: $todosState, statsState: $statsState, activeTab: $activeTab)";
  @override
  bool operator ==(dynamic other) =>
      other.runtimeType == runtimeType &&
      todosState == other.todosState &&
      statsState == other.statsState &&
      activeTab == other.activeTab;
  @override
  int get hashCode {
    var result = 17;
    result = 37 * result + todosState.hashCode;
    result = 37 * result + statsState.hashCode;
    result = 37 * result + activeTab.hashCode;
    return result;
  }
}

class AppState$ {
  static final todosState = Lens<AppState, TodosState>((s_) => s_.todosState,
      (s_, todosState) => s_.copyWith(todosState: todosState));
  static final statsState = Lens<AppState, StatsState>((s_) => s_.statsState,
      (s_, statsState) => s_.copyWith(statsState: statsState));
  static final activeTab = Lens<AppState, AppTab>((s_) => s_.activeTab,
      (s_, activeTab) => s_.copyWith(activeTab: activeTab));
}
