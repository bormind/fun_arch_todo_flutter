import 'package:flutter/cupertino.dart';
import 'package:fun_arch_todo_flutter/models/todo.dart';
import 'package:fun_arch_todo_flutter/store/actions.dart';
import 'package:fun_arch_todo_flutter/store/app_store.dart';
import 'package:todos_repository_simple/todos_repository_simple.dart';

class Fetcher {
  final AppStore store;
  final TodosRepositoryFlutter todoRepo;

  Fetcher({
    @required this.store,
    @required this.todoRepo,
  });

  Future<void> loadTodos() {
    return todoRepo.loadTodos().then(
        (entities) => store.dispatch(SetTodos(entities.map(Todo.fromEntity))));
  }
}
