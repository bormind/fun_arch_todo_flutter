import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:fun_arch_todo_flutter/env.dart';
import 'package:fun_arch_todo_flutter/flutter_todos_keys.dart';
import 'package:fun_arch_todo_flutter/models/extra_action.dart';
import 'package:fun_arch_todo_flutter/store/actions.dart';
import 'package:todos_app_core/todos_app_core.dart';

class ExtraActions extends StatelessWidget {
  ExtraActions({Key key}) : super(key: ArchSampleKeys.extraActionsButton);

  @override
  Widget build(BuildContext context) {
    if (store.state.todosState.todos.isEmpty) {
      return Container(key: FlutterTodosKeys.extraActionsEmptyContainer);
    }

    final allComplete =
        store.state.todosState.todos.values.every((t) => t.completed);

    return PopupMenuButton<ExtraAction>(
      key: FlutterTodosKeys.extraActionsPopupMenuButton,
      onSelected: (action) {
        switch (action) {
          case ExtraAction.clearCompleted:
            if (store.state.todosState.todos.values.any((t) => t.completed)) {
              store.dispatch(clearCompleted());
            }
            break;
          case ExtraAction.toggleAllComplete:
            if (allComplete) {
              store.dispatch(unCompleteAll());
            } else {
              store.dispatch(completeAll());
            }
            break;
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuItem<ExtraAction>>[
        PopupMenuItem<ExtraAction>(
          key: ArchSampleKeys.toggleAll,
          value: ExtraAction.toggleAllComplete,
          child: Text(
            allComplete
                ? ArchSampleLocalizations.of(context).markAllIncomplete
                : ArchSampleLocalizations.of(context).markAllComplete,
          ),
        ),
        PopupMenuItem<ExtraAction>(
          key: ArchSampleKeys.clearCompleted,
          value: ExtraAction.clearCompleted,
          child: Text(
            ArchSampleLocalizations.of(context).clearCompleted,
          ),
        ),
      ],
    );
  }
}
