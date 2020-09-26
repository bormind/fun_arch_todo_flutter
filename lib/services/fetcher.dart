import 'package:fun_arch_todo_flutter/arch_samples/file_storage.dart';
import 'package:fun_arch_todo_flutter/arch_samples/todos_repository.dart';
import 'package:fun_arch_todo_flutter/models/todo.dart';
import 'package:fun_arch_todo_flutter/service_locator.dart';
import 'package:fun_arch_todo_flutter/store/actions.dart';
import 'package:fun_arch_todo_flutter/store/app_store.dart';

class Fetcher {
  final AppStore _store = getIt<AppStore>();
  final TodosRepository _todoRepo = getIt<FileStorage>();

  Future<void> loadTodosFromLocalStorage() {
    _store.dispatch(SetLoading(true));
    return _todoRepo
        .loadTodos()
        .then((entities) =>
            _store.dispatch(SetTodos(entities.map(Todo.fromEntity))))
        .whenComplete(() {
      _store.dispatch(SetLoading(false));
      _store.dispatch(SetDataInitialized());
    });
  }
}
