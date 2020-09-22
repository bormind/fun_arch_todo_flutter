import 'package:flutter/cupertino.dart';
import 'package:fun_arch_todo_flutter/arch_samples/todos_repository.dart';
import 'package:fun_arch_todo_flutter/models/todo.dart';
import 'package:fun_arch_todo_flutter/store/actions.dart';
import 'package:fun_arch_todo_flutter/store/app_store.dart';

class Fetcher {
  final AppStore store;
  final TodosRepository todoRepo;

  Fetcher({
    @required this.store,
    @required this.todoRepo,
  });

  Future<void> loadTodos() {
    store.dispatch(SetLoading(true));
    return todoRepo
        .loadTodos()
        .then((entities) =>
            store.dispatch(SetTodos(entities.map(Todo.fromEntity))))
        .whenComplete(() {
      store.dispatch(SetLoading(false));
    });
  }
}
