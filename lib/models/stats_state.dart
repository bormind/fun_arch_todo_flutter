import 'package:meta/meta.dart';
import 'package:redurx_light_starter/utils/maybe.dart';

@immutable
class StatsData {
  final int numActive;
  final int numCompleted;

  StatsData({
    @required this.numActive,
    @required this.numCompleted,
  });
}

class StatsState {
  final Maybe<StatsData> statsData;
  final bool isLoading;

  StatsState({
    @required this.statsData,
    @required this.isLoading,
  });

  StatsState copyWith({
    Maybe<StatsData> statsData,
    bool isLoading,
  }) {
    return StatsState(
      statsData: statsData ?? this.statsData,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  factory StatsState.initial() {
    return StatsState(
      statsData: Maybe.none(),
      isLoading: false,
    );
  }
}
