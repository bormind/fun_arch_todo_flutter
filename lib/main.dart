import 'package:flutter/material.dart';
import 'package:fun_arch_todo_flutter/env.dart';
import 'package:fun_arch_todo_flutter/localization.dart';
import 'package:fun_arch_todo_flutter/models/todo.dart';
import 'package:fun_arch_todo_flutter/screens/add_edit_screen.dart';
import 'package:fun_arch_todo_flutter/screens/home_screen.dart';
import 'package:fun_arch_todo_flutter/store/actions.dart';
import 'package:fun_arch_todo_flutter/utils/maybe.dart';
import 'package:todos_app_core/todos_app_core.dart';

void main() {
  runApp(MaterialApp(
      title: AppLocalizations().appTitle,
      theme: ArchSampleTheme.theme,
      localizationsDelegates: [
        ArchSampleLocalizationsDelegate(),
        AppLocalizationsDelegate(),
      ],
      routes: {
        ArchSampleRoutes.home: (context) {
          return HomeScreen();
        },
        ArchSampleRoutes.addTodo: (context) {
          return AddEditScreen(
            key: ArchSampleKeys.addTodoScreen,
            todo: Maybe.none(),
            onSave: (task, note) {
              store.dispatch(addTodo(Todo(task, note: note)));
            },
          );
        },
      }));
}
