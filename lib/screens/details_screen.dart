import 'package:flutter/material.dart';
import 'package:redurx_light_starter/flutter_todos_keys.dart';
import 'package:redurx_light_starter/models/todo.dart';
import 'package:redurx_light_starter/screens/add_edit_screen.dart';
import 'package:redurx_light_starter/store/actions.dart';
import 'package:redurx_light_starter/store/app_store.dart';
import 'package:todos_app_core/todos_app_core.dart';

class DetailsScreen extends StatelessWidget {
  final Todo todo;

  DetailsScreen(this.todo);

  @override
  Widget build(BuildContext context) {
    final localizations = ArchSampleLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.todoDetails),
        actions: [
          IconButton(
            tooltip: localizations.deleteTodo,
            key: ArchSampleKeys.deleteTodoButton,
            icon: Icon(Icons.delete),
            onPressed: () {
              AppStore.dispatch(DeleteTodo(todo.id));
              Navigator.pop(context, todo);
            },
          )
        ],
      ),
      body: todo == null
          ? Container(key: FlutterTodosKeys.emptyDetailsContainer)
          : Padding(
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
                              AppStore.dispatch(
                                  MarkCompletion(todo.id, !todo.completed));
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
            ),
      floatingActionButton: FloatingActionButton(
        key: ArchSampleKeys.editTodoFab,
        tooltip: localizations.editTodo,
        child: Icon(Icons.edit),
        onPressed: todo == null
            ? null
            : () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return AddEditScreen(
                        key: ArchSampleKeys.editTodoScreen,
                        onSave: (task, note) {
                          AppStore.dispatch(UpdateTodo(todo.id, task, note));
                        },
                        isEditing: true,
                        todo: todo,
                      );
                    },
                  ),
                );
              },
      ),
    );
  }
}
