import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fun_arch_todo_flutter/models/todos_state.dart';
import 'package:fun_arch_todo_flutter/screens/details_screen.dart';
import 'package:fun_arch_todo_flutter/store/actions.dart';
import 'package:fun_arch_todo_flutter/widgets/delete_todo_snack_bar.dart';
import 'package:fun_arch_todo_flutter/widgets/loading_indicator.dart';
import 'package:fun_arch_todo_flutter/widgets/todo_item.dart';
import 'package:todos_app_core/todos_app_core.dart';
import 'package:fun_arch_todo_flutter/env.dart';

class TodosScreen extends StatelessWidget {
  final TodosState todosState;

  TodosScreen(this.todosState);

  @override
  Widget build(BuildContext context) {
    final localizations = ArchSampleLocalizations.of(context);
    if (Env.store.state.todosState.isLoading) {
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
            Env.store.dispatch(deleteTodo(todo.id));
            Scaffold.of(context).showSnackBar(DeleteTodoSnackBar(
              key: ArchSampleKeys.snackbar,
              todo: todo,
              onUndo: () => Env.store.dispatch(addTodo(todo)),
              localizations: localizations,
            ));
          },
          onTap: () async {
            Env.store.dispatch(selectTodo(todo.id));

            final removedTodo = await Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => DetailsScreen()),
            );

            print(">>> Cleared todo selection");
            Env.store.dispatch(clearTodoSelection());

            if (removedTodo != null) {
              Scaffold.of(context).showSnackBar(DeleteTodoSnackBar(
                key: ArchSampleKeys.snackbar,
                todo: todo,
                onUndo: () => Env.store.dispatch(addTodo(todo)),
                localizations: localizations,
              ));
            }
          },
          onCheckboxChanged: (_) {
            Env.store.dispatch(markCompletion(todo.id, !todo.completed));
          },
        );
      },
    );
  }
}
