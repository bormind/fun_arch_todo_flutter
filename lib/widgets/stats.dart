import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fun_arch_todo_flutter/flutter_todos_keys.dart';
import 'package:fun_arch_todo_flutter/models/todos_state.dart';
import 'package:fun_arch_todo_flutter/store/connect_state.dart';
import 'package:fun_arch_todo_flutter/widgets/loading_indicator.dart';

class Stats extends StatelessWidget {
  Widget _renderStats(BuildContext context, TodosState todosState) {
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
              '${todosState.numCompleted}',
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
              "${todosState.numActive}",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ConnectState<TodosState>(
      map: (state) => state.todosState,
      builder: (todosState) {
        return todosState.isLoading
            ? LoadingIndicator(key: FlutterTodosKeys.statsLoadingIndicator)
            : _renderStats(context, todosState);
      },
    );
  }
}
