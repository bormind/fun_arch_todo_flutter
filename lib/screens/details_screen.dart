import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:fun_arch_todo_flutter/env.dart';
import 'package:fun_arch_todo_flutter/models/todo.dart';
import 'package:fun_arch_todo_flutter/screens/add_edit_screen.dart';
import 'package:fun_arch_todo_flutter/store/actions.dart';

class DetailsScreen extends StatelessWidget {
  final Todo todo;

  const DetailsScreen(this.todo);

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
                      Env.store
                          .dispatch(MarkCompletion(todo.id, !todo.completed));
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
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                    ),
                    Text(
                      todo.note,
                      style: Theme.of(context).textTheme.subtitle1,
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
            onSave: (task, note) {
              Env.store.dispatch(UpdateTodo(todo.id, task, note));
            },
            todo: Some(todo),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Todo Details'),
          actions: [
            IconButton(
                tooltip: 'Delete Todo',
                icon: Icon(Icons.delete),
                onPressed: () {
                  Env.store.dispatch(DeleteTodo(todo.id));
                  Navigator.pop(context, todo);
                })
          ],
        ),
        body: _renderDetails(context, todo),
        floatingActionButton: FloatingActionButton(
            tooltip: 'Edit Todo',
            child: Icon(Icons.edit),
            onPressed: () => this._onEditTodo(context, todo)));
  }
}
