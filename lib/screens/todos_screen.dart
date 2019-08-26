import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:redurx_light_starter/models/todos_state.dart';
import 'package:redurx_light_starter/screens/details_screen.dart';
import 'package:redurx_light_starter/store/actions.dart';
import 'package:redurx_light_starter/widgets/delete_todo_snack_bar.dart';
import 'package:redurx_light_starter/widgets/loading_indicator.dart';
import 'package:redurx_light_starter/widgets/todo_item.dart';
import 'package:todos_app_core/todos_app_core.dart';
import 'package:redurx_light_starter/env.dart';

class TodosScreen extends StatelessWidget {
  final TodosState todosState;

  TodosScreen(this.todosState);

  @override
  Widget build(BuildContext context) {
    final localizations = ArchSampleLocalizations.of(context);
    if (store.state.todosState.isLoading) {
      return LoadingIndicator(key: ArchSampleKeys.todosLoading);
    }

    final visibleTodos = todosState.visibleTodos.toList();

    return ListView.builder(
      key: ArchSampleKeys.todoList,
      itemCount: visibleTodos.length,
      itemBuilder: (BuildContext context, int index) {
        final todo = visibleTodos[index];
        return TodoItem(
          todo: todo,
          onDismissed: (direction) {
            store.dispatch(DeleteTodo(todo.id));
            Scaffold.of(context).showSnackBar(DeleteTodoSnackBar(
              key: ArchSampleKeys.snackbar,
              todo: todo,
              onUndo: () => store.dispatch(AddTodo(todo)),
              localizations: localizations,
            ));
          },
          onTap: () async {
            store.dispatch(SelectTodo(todo.id));

            final removedTodo = await Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => DetailsScreen()),
            );

            print(">>> Cleared todo selection");
            store.dispatch(ClearTodoSelection());

            if (removedTodo != null) {
              Scaffold.of(context).showSnackBar(DeleteTodoSnackBar(
                key: ArchSampleKeys.snackbar,
                todo: todo,
                onUndo: () => store.dispatch(AddTodo(todo)),
                localizations: localizations,
              ));
            }
          },
          onCheckboxChanged: (_) {
            store.dispatch(MarkCompletion(todo.id, !todo.completed));
          },
        );
      },
    );
  }
}
