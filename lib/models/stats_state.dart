import 'package:functional_data/functional_data.dart';
import 'package:meta/meta.dart';
import 'package:fun_arch_todo_flutter/utils/maybe.dart';

part 'stats_state.g.dart';

@FunctionalData()
class StatsData extends $StatsData {
  final int numActive;
  final int numCompleted;

  StatsData({
    @required this.numActive,
    @required this.numCompleted,
  });
}

@FunctionalData()
class StatsState extends $StatsState {
  final Maybe<StatsData> statsData;
  final bool isLoading;

  StatsState({
    @required this.statsData,
    @required this.isLoading,
  });

  factory StatsState.initial() {
    return StatsState(
      statsData: Maybe.none(),
      isLoading: false,
    );
  }
}
