import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:fun_arch_todo_flutter/arch_samples/routes.dart';
import 'package:fun_arch_todo_flutter/arch_samples/theme.dart';
import 'package:fun_arch_todo_flutter/env.dart';
import 'package:fun_arch_todo_flutter/localization.dart';
import 'package:fun_arch_todo_flutter/models/todo.dart';
import 'package:fun_arch_todo_flutter/screens/add_edit_screen.dart';
import 'package:fun_arch_todo_flutter/screens/home_screen.dart';
import 'package:fun_arch_todo_flutter/store/actions.dart';

void main() {
  runApp(MaterialApp(
      title: AppLocalizations().appTitle,
      theme: ArchSampleTheme.theme,
      localizationsDelegates: [
        AppLocalizationsDelegate(),
      ],
      routes: {
        ArchSampleRoutes.home: (context) {
          return HomeScreen();
        },
        ArchSampleRoutes.addTodo: (context) {
          return AddEditScreen(
            todo: None(),
            onSave: (task, note) {
              Env.store.dispatch(AddTodo(Todo.newTote(task, note)));
            },
          );
        },
      }));
}
