import 'package:meta/meta.dart';

@immutable
class Stats {
  final int numActive;
  final int numCompleted;

  Stats({
    @required this.numActive,
    @required this.numCompleted,
  });

  Stats copyWith(
    int numActive,
    int numCompleted,
  ) {
    return Stats(
      numActive: numActive ?? this.numActive,
      numCompleted: numCompleted ?? this.numCompleted,
    );
  }
}
