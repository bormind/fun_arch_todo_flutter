// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nav_state.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

// ignore_for_file: join_return_with_assignment
// ignore_for_file: avoid_classes_with_only_static_members
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes
abstract class $NavState {
  const $NavState();
  KtList<NavTarget> get navTargets;
  NavState copyWith({KtList<NavTarget> navTargets}) =>
      NavState(navTargets: navTargets ?? this.navTargets);
  @override
  String toString() => "NavState(navTargets: $navTargets)";
  @override
  bool operator ==(dynamic other) =>
      other.runtimeType == runtimeType && navTargets == other.navTargets;
  @override
  int get hashCode {
    var result = 17;
    result = 37 * result + navTargets.hashCode;
    return result;
  }
}

class NavState$ {
  static final navTargets = Lens<NavState, KtList<NavTarget>>(
      (s_) => s_.navTargets,
      (s_, navTargets) => s_.copyWith(navTargets: navTargets));
}
