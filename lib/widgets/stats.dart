import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:redurx_light_starter/flutter_todos_keys.dart';
import 'package:redurx_light_starter/store/app_store.dart';
import 'package:redurx_light_starter/widgets/loading_indicator.dart';
import 'package:todos_app_core/todos_app_core.dart';

class Stats extends StatelessWidget {
  Stats({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (AppStore.state.isStatsLoading) {
      return LoadingIndicator(key: FlutterTodosKeys.statsLoadingIndicator);
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              ArchSampleLocalizations.of(context).completedTodos,
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 24.0),
            child: Text(
              '${AppStore.state.stats.numCompleted}',
              key: ArchSampleKeys.statsNumCompleted,
              style: Theme.of(context).textTheme.subhead,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              ArchSampleLocalizations.of(context).activeTodos,
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 24.0),
            child: Text(
              "${AppStore.state.stats.numActive}",
              key: ArchSampleKeys.statsNumActive,
              style: Theme.of(context).textTheme.subhead,
            ),
          )
        ],
      ),
    );
  }
}
