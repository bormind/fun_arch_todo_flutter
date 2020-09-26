import 'package:fun_arch_todo_flutter/arch_samples/file_storage.dart';
import 'package:fun_arch_todo_flutter/models/todo.dart';
import 'package:fun_arch_todo_flutter/service_locator.dart';
import 'package:fun_arch_todo_flutter/store/app_store.dart';
import 'package:rxdart/rxdart.dart';
import 'package:kt_dart/kt.dart';

class StateObserver {
  final _store = getIt<AppStore>();

  void _observeTodosAndStoreLocally() {
    final localStore = getIt<FileStorage>();

    final datInitialized$ = _store.state$
        .map((state) => state.todosState.dataIsInitialized)
        .distinct()
        .where((event) => event);

    _store.state$
        .map((state) => state.todosState.todos)
        .distinct(identical)
        .skipUntil(datInitialized$)
        .listen((todos) {
      print("Saving to local storage");
      localStore.saveTodos(todos.values.map(Todo.toEntity).iter);
    });
  }

  StateObserver() {
    _observeTodosAndStoreLocally();
  }
}
