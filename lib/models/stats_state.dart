import 'package:functional_data/functional_data.dart';
import 'package:meta/meta.dart';
import 'package:plain_optional/plain_optional.dart';

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
  final Optional<StatsData> statsData;
  final bool isLoading;

  StatsState({
    @required this.statsData,
    @required this.isLoading,
  });

  factory StatsState.initial() {
    return StatsState(
      statsData: Optional.none(),
      isLoading: false,
    );
  }
}
