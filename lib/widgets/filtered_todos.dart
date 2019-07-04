import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:redurx_light_starter/models/todo.dart';
import 'package:redurx_light_starter/screens/details_screen.dart';
import 'package:redurx_light_starter/store/actions.dart';
import 'package:redurx_light_starter/store/app_store.dart';
import 'package:redurx_light_starter/widgets/delete_todo_snack_bar.dart';
import 'package:redurx_light_starter/widgets/loading_indicator.dart';
import 'package:redurx_light_starter/widgets/todo_item.dart';
import 'package:todos_app_core/todos_app_core.dart';

class FilteredTodos extends StatelessWidget {
  final List<Todo> visibleTodos;

  FilteredTodos({
    @required this.visibleTodos,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = ArchSampleLocalizations.of(context);
    if (AppStore.state.isLoadingTodos) {
      return LoadingIndicator(key: ArchSampleKeys.todosLoading);
    }

    return ListView.builder(
      key: ArchSampleKeys.todoList,
      itemCount: visibleTodos.length,
      itemBuilder: (BuildContext context, int index) {
        final todo = visibleTodos[index];
        return TodoItem(
          todo: todo,
          onDismissed: (direction) {
            AppStore.dispatch(DeleteTodo(todo.id));
            Scaffold.of(context).showSnackBar(DeleteTodoSnackBar(
              key: ArchSampleKeys.snackbar,
              todo: todo,
              onUndo: () => AppStore.dispatch(AddTodo(todo)),
              localizations: localizations,
            ));
          },
          onTap: () async {
            final removedTodo = await Navigator.of(context).push(
              MaterialPageRoute(builder: (_) {
                return DetailsScreen(todo);
              }),
            );
            if (removedTodo != null) {
              Scaffold.of(context).showSnackBar(DeleteTodoSnackBar(
                key: ArchSampleKeys.snackbar,
                todo: todo,
                onUndo: () => AppStore.dispatch(AddTodo(todo)),
                localizations: localizations,
              ));
            }
          },
          onCheckboxChanged: (_) {
            AppStore.dispatch(MarkCompletion(todo.id, !todo.completed));
          },
        );
      },
    );
  }
}
