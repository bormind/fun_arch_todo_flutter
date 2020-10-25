import 'package:flutter/material.dart';
import 'package:fun_arch_todo_flutter/screens/app_shell.dart';
import 'package:fun_arch_todo_flutter/service_locator.dart';
import 'package:fun_arch_todo_flutter/services/fetcher.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  initServiceLocator();

  getIt<Fetcher>().loadTodosFromLocalStorage();

  runApp(AppShell());

  // runApp(MaterialApp(
  //     title: AppLocalizations().appTitle,
  //     theme: ArchSampleTheme.theme,
  //     localizationsDelegates: [
  //       AppLocalizationsDelegate(),
  //     ],
  //     routes: {
  //       ArchSampleRoutes.home: (context) {
  //         return HomeScreen();
  //       },
  //       ArchSampleRoutes.addTodo: (context) {
  //         return AddEditScreen(
  //           todo: None(),
  //           onSave: (task, note) {
  //             getIt<AppStore>().dispatch(AddTodo(Todo.newTote(task, note)));
  //           },
  //         );
  //       },
  //     }));
}
