import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fun_arch_todo_flutter/flutter_todos_keys.dart';
import 'package:fun_arch_todo_flutter/models/extra_action.dart';
import 'package:fun_arch_todo_flutter/models/todo.dart';
import 'package:fun_arch_todo_flutter/service_locator.dart';
import 'package:fun_arch_todo_flutter/store/actions.dart';
import 'package:fun_arch_todo_flutter/store/app_store.dart';
import 'package:fun_arch_todo_flutter/store/connect_state.dart';
import 'package:kt_dart/kt.dart';

class ExtraActions extends StatelessWidget {
  final _store = getIt<AppStore>();

  ExtraActions({Key? key}) : super();

  @override
  Widget build(BuildContext context) {
    return ConnectState<KtMap<String, Todo>>(
        map: (state) => state.todosState.todos,
        builder: (todos) {
          if (todos.isEmpty()) {
            return Container(key: FlutterTodosKeys.extraActionsEmptyContainer);
          }

          final allComplete = todos.values.all((t) => t.completed);

          return PopupMenuButton<ExtraAction>(
            key: FlutterTodosKeys.extraActionsPopupMenuButton,
            onSelected: (action) {
              switch (action) {
                case ExtraAction.clearCompleted:
                  if (todos.values.any((t) => t.completed)) {
                    _store.dispatch(ClearCompleted());
                  }
                  break;
                case ExtraAction.toggleAllComplete:
                  if (allComplete) {
                    _store.dispatch(UnCompleteAll());
                  } else {
                    _store.dispatch(CompleteAll());
                  }
                  break;
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuItem<ExtraAction>>[
              PopupMenuItem<ExtraAction>(
                value: ExtraAction.toggleAllComplete,
                child: Text(
                  allComplete ? 'Mark all incomplete' : 'Mark all complete',
                ),
              ),
              PopupMenuItem<ExtraAction>(
                value: ExtraAction.clearCompleted,
                child: Text(
                  'Clear Completed',
                ),
              ),
            ],
          );
        });
  }
}
