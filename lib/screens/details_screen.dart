import 'package:flutter/material.dart';
import 'package:fun_arch_todo_flutter/env.dart';
import 'package:fun_arch_todo_flutter/flutter_todos_keys.dart';
import 'package:fun_arch_todo_flutter/models/todo.dart';
import 'package:fun_arch_todo_flutter/screens/add_edit_screen.dart';
import 'package:fun_arch_todo_flutter/store/actions.dart';
import 'package:fun_arch_todo_flutter/store/connect_state.dart';
import 'package:fun_arch_todo_flutter/utils/maybe.dart';
import 'package:todos_app_core/todos_app_core.dart';
import 'package:fun_arch_todo_flutter/utils/utils.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen();

  Widget _renderDetails(BuildContext context, Todo todo) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Checkbox(
                    value: todo.completed,
                    onChanged: (_) {
                      store.dispatch(markCompletion(todo.id, !todo.completed));
                    }),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: '${todo.id}__heroTag',
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(
                          top: 8.0,
                          bottom: 16.0,
                        ),
                        child: Text(
                          todo.task,
                          key: ArchSampleKeys.detailsTodoItemTask,
                          style: Theme.of(context).textTheme.headline,
                        ),
                      ),
                    ),
                    Text(
                      todo.note,
                      key: ArchSampleKeys.detailsTodoItemNote,
                      style: Theme.of(context).textTheme.subhead,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onEditTodo(BuildContext context, Todo todo) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return AddEditScreen(
            key: ArchSampleKeys.editTodoScreen,
            onSave: (task, note) {
              store.dispatch(updateTodo(todo.id, task, note));
            },
            todo: Maybe.some(todo),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final localizations = ArchSampleLocalizations.of(context);
    return ConnectState<Maybe<Todo>>(
      map: (state) => state.todosState.selectedTodo,
      where: notEqual,
      builder: (todo) => Scaffold(
        appBar: AppBar(
          title: Text(localizations.todoDetails),
          actions: [
            IconButton(
                tooltip: localizations.deleteTodo,
                key: ArchSampleKeys.deleteTodoButton,
                icon: Icon(Icons.delete),
                onPressed: todo
                    .map((td) => () {
                          store.dispatch(deleteTodo(td.id));
                          Navigator.pop(context, todo);
                        })
                    .orElse(null))
          ],
        ),
        body: todo
            .map((td) => _renderDetails(context, td))
            .orElse(Container(key: FlutterTodosKeys.emptyDetailsContainer)),
        floatingActionButton: FloatingActionButton(
          key: ArchSampleKeys.editTodoFab,
          tooltip: localizations.editTodo,
          child: Icon(Icons.edit),
          onPressed: todo
              .map((td) => () => this._onEditTodo(context, td))
              .orElse(null),
        ),
      ),
    );
  }
}
