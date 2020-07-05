// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats_state.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

// ignore_for_file: join_return_with_assignment
// ignore_for_file: avoid_classes_with_only_static_members
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes
abstract class $StatsData {
  const $StatsData();
  int get numActive;
  int get numCompleted;
  StatsData copyWith({int numActive, int numCompleted}) => StatsData(
      numActive: numActive ?? this.numActive,
      numCompleted: numCompleted ?? this.numCompleted);
  @override
  String toString() =>
      "StatsData(numActive: $numActive, numCompleted: $numCompleted)";
  @override
  bool operator ==(dynamic other) =>
      other.runtimeType == runtimeType &&
      numActive == other.numActive &&
      numCompleted == other.numCompleted;
  @override
  int get hashCode {
    var result = 17;
    result = 37 * result + numActive.hashCode;
    result = 37 * result + numCompleted.hashCode;
    return result;
  }
}

class StatsData$ {
  static final numActive = Lens<StatsData, int>((s_) => s_.numActive,
      (s_, numActive) => s_.copyWith(numActive: numActive));
  static final numCompleted = Lens<StatsData, int>((s_) => s_.numCompleted,
      (s_, numCompleted) => s_.copyWith(numCompleted: numCompleted));
}

// ignore_for_file: join_return_with_assignment
// ignore_for_file: avoid_classes_with_only_static_members
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes
abstract class $StatsState {
  const $StatsState();
  Optional<StatsData> get statsData;
  bool get isLoading;
  StatsState copyWith({Optional<StatsData> statsData, bool isLoading}) =>
      StatsState(
          statsData: statsData ?? this.statsData,
          isLoading: isLoading ?? this.isLoading);
  @override
  String toString() =>
      "StatsState(statsData: $statsData, isLoading: $isLoading)";
  @override
  bool operator ==(dynamic other) =>
      other.runtimeType == runtimeType &&
      statsData == other.statsData &&
      isLoading == other.isLoading;
  @override
  int get hashCode {
    var result = 17;
    result = 37 * result + statsData.hashCode;
    result = 37 * result + isLoading.hashCode;
    return result;
  }
}

class StatsState$ {
  static final statsData = Lens<StatsState, Optional<StatsData>>(
      (s_) => s_.statsData,
      (s_, statsData) => s_.copyWith(statsData: statsData));
  static final isLoading = Lens<StatsState, bool>((s_) => s_.isLoading,
      (s_, isLoading) => s_.copyWith(isLoading: isLoading));
}
