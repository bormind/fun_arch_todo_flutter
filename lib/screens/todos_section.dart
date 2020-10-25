import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fun_arch_todo_flutter/models/todos_state.dart';
import 'package:fun_arch_todo_flutter/screens/details_screen.dart';
import 'package:fun_arch_todo_flutter/service_locator.dart';
import 'package:fun_arch_todo_flutter/store/actions/todo_actions.dart';
import 'package:fun_arch_todo_flutter/store/app_store.dart';
import 'package:fun_arch_todo_flutter/store/connect_state.dart';
import 'package:fun_arch_todo_flutter/utils/utils.dart';
import 'package:fun_arch_todo_flutter/widgets/delete_todo_snack_bar.dart';
import 'package:fun_arch_todo_flutter/widgets/loading_indicator.dart';
import 'package:fun_arch_todo_flutter/widgets/todo_item.dart';

class TodosSection extends StatelessWidget {
  final _store = getIt<AppStore>();

  TodosSection();

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
                  _store.dispatch(DeleteTodo(todo.id));
                  ScaffoldMessenger.of(context).showSnackBar(DeleteTodoSnackBar(
                    todo: todo,
                    onUndo: () => _store.dispatch(AddTodo(todo)),
                  ));
                },
                onTap: () async {
                  final removedTodo = await Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => DetailsScreen(todo.id)),
                  );

                  if (removedTodo != null) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(DeleteTodoSnackBar(
                      todo: todo,
                      onUndo: () => _store.dispatch(AddTodo(todo)),
                    ));
                  }
                },
                onCheckboxChanged: (_) {
                  _store.dispatch(MarkCompletion(todo.id, !todo.completed));
                },
              );
            },
          );
        });
  }
}
