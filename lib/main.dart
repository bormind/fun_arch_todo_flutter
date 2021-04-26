import 'package:flutter/material.dart';
import 'package:fun_arch_todo_flutter/localization.dart';
import 'package:fun_arch_todo_flutter/models/todo.dart';
import 'package:fun_arch_todo_flutter/routes.dart';
import 'package:fun_arch_todo_flutter/screens/add_edit_screen.dart';
import 'package:fun_arch_todo_flutter/screens/home_screen.dart';
import 'package:fun_arch_todo_flutter/service_locator.dart';
import 'package:fun_arch_todo_flutter/services/fetcher.dart';
import 'package:fun_arch_todo_flutter/store/actions.dart';
import 'package:fun_arch_todo_flutter/store/app_store.dart';
import 'package:fun_arch_todo_flutter/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  initServiceLocator();

  getIt<Fetcher>().loadTodosFromLocalStorage();

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
            todo: null,
            onSave: (task, note) {
              getIt<AppStore>().dispatch(AddTodo(Todo.newTote(task, note)));
            },
          );
        },
      }));
}
