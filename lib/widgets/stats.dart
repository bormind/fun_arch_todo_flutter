import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:fun_arch_todo_flutter/flutter_todos_keys.dart';
import 'package:fun_arch_todo_flutter/models/stats_state.dart';
import 'package:fun_arch_todo_flutter/store/connect_state.dart';
import 'package:fun_arch_todo_flutter/widgets/loading_indicator.dart';
import 'package:fun_arch_todo_flutter/utils/utils.dart';

class Stats extends StatelessWidget {
  Widget _renderStatsData(BuildContext context, StatsData statsData) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              'Completed Todos',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 24.0),
            child: Text(
              '${statsData.numCompleted}',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              'Active Todos',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 24.0),
            child: Text(
              "${statsData.numActive}",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ConnectState<StatsState>(
      map: (state) => state.statsState,
      where: notIdentical,
      builder: (stats) {
        return stats.isLoading
            ? LoadingIndicator(key: FlutterTodosKeys.statsLoadingIndicator)
            : stats.statsData
                .map((statsData) => _renderStatsData(context, statsData))
                .valueOr(() => SizedBox());
      },
    );
  }
}
