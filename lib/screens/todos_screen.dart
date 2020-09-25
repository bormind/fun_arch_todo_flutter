import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fun_arch_todo_flutter/models/todos_state.dart';
import 'package:fun_arch_todo_flutter/screens/details_screen.dart';
import 'package:fun_arch_todo_flutter/store/actions.dart';
import 'package:fun_arch_todo_flutter/store/connect_state.dart';
import 'package:fun_arch_todo_flutter/utils/utils.dart';
import 'package:fun_arch_todo_flutter/widgets/delete_todo_snack_bar.dart';
import 'package:fun_arch_todo_flutter/widgets/loading_indicator.dart';
import 'package:fun_arch_todo_flutter/widgets/todo_item.dart';
import 'package:fun_arch_todo_flutter/env.dart';

class TodosScreen extends StatelessWidget {
  TodosScreen();

  @override
  Widget build(BuildContext context) {
    return ConnectState<TodosState>(
        map: (state) => state.todosState,
        where: notIdentical,
        builder: (todosState) {
          print("Rendering Todos List");

          if (todosState.isLoading) {
            return LoadingIndicator();
          }

          return ListView.builder(
            itemCount: todosState.visibleTodos.size,
            itemBuilder: (BuildContext context, int index) {
              final todo = todosState.visibleTodos[index];
              return TodoItem(
                todo: todo,
                onDismissed: (direction) {
                  Env.store.dispatch(DeleteTodo(todo.id));
                  Scaffold.of(context).showSnackBar(DeleteTodoSnackBar(
                    todo: todo,
                    onUndo: () => Env.store.dispatch(AddTodo(todo)),
                  ));
                },
                onTap: () async {
                  final removedTodo = await Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => DetailsScreen(todo)),
                  );

                  if (removedTodo != null) {
                    Scaffold.of(context).showSnackBar(DeleteTodoSnackBar(
                      todo: todo,
                      onUndo: () => Env.store.dispatch(AddTodo(todo)),
                    ));
                  }
                },
                onCheckboxChanged: (_) {
                  Env.store.dispatch(MarkCompletion(todo.id, !todo.completed));
                },
              );
            },
          );
        });
  }
}
