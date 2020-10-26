import 'package:dartz/dartz.dart' hide State;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fun_arch_todo_flutter/models/todo.dart';
import 'package:fun_arch_todo_flutter/service_locator.dart';
import 'package:fun_arch_todo_flutter/store/actions/nav_actions.dart';
import 'package:fun_arch_todo_flutter/store/actions/todo_actions.dart';
import 'package:fun_arch_todo_flutter/store/app_store.dart';
import 'package:fun_arch_todo_flutter/store/actions/action.dart' as Actions;

typedef OnSaveCallback = Function(String task, String note);

class AddEditScreen extends StatefulWidget {
  final Option<Todo> todo;

  AddEditScreen(
    this.todo,
  );

  @override
  _AddEditScreenState createState() => _AddEditScreenState();
}

class _AddEditScreenState extends State<AddEditScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _store = getIt<AppStore>();

  String _task;
  String _note;

  bool get isEditing => widget.todo.isSome();

  @override
  void initState() {
    _task = widget.todo.map((t) => t.task).getOrElse(() => "");
    _note = widget.todo.map((t) => t.note).getOrElse(() => "");

    super.initState();
  }

  void _onSave(String task, String note) {
    final Actions.Action action = widget.todo
        .map<Actions.Action>((td) => UpdateTodo(td.id, task, note))
        .getOrElse(() => AddTodo(Todo.newNote(task, note)));

    _store.dispatch(action);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEditing ? "Edit Todo" : "Add Todo",
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _task,
                autofocus: !isEditing,
                style: textTheme.headline5,
                decoration: InputDecoration(
                  hintText: 'What needs to be done?',
                ),
                validator: (val) {
                  return val.trim().isEmpty ? 'Please enter some text' : null;
                },
                onSaved: (value) => _task = value,
              ),
              TextFormField(
                initialValue: _note,
                maxLines: 10,
                style: textTheme.subtitle1,
                decoration: InputDecoration(
                  hintText: 'Additional Notes...',
                ),
                onSaved: (value) => _note = value,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: isEditing ? 'Save changes' : 'Add Todo',
        child: Icon(isEditing ? Icons.check : Icons.add),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
            _onSave(_task, _note);
            _store.dispatch(PopNavTarget());
          }
        },
      ),
    );
  }
}
