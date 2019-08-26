import 'package:flutter/material.dart';
import 'package:redurx_light_starter/env.dart';
import 'package:redurx_light_starter/localization.dart';
import 'package:redurx_light_starter/models/todo.dart';
import 'package:redurx_light_starter/screens/add_edit_screen.dart';
import 'package:redurx_light_starter/screens/home_screen.dart';
import 'package:redurx_light_starter/store/actions.dart';
import 'package:redurx_light_starter/utils/maybe.dart';
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
            todo: Maybe.nothing(),
            onSave: (task, note) {
              store.dispatch(AddTodo(Todo(task, note: note)));
            },
          );
        },
      }));
}
