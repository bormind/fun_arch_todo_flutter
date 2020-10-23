import 'package:localstorage/localstorage.dart';
import 'package:fun_arch_todo_flutter/models/todo.dart';

final _APP_KEY = 'todo_app';
final _TODOS_KEY = 'todos';

class LocalStorageService {
  Future<LocalStorage> getLocalStorage() {
    final storage = LocalStorage(_APP_KEY);
    return storage.ready.then((_) => storage);
  }

  Future<List<Todo>> loadTodos() {
    return getLocalStorage().then((storage) {
      final jsonList = storage.getItem(_TODOS_KEY);
      if (jsonList == null) {
        return [];
      } else {
        return (jsonList as List<Map<String, dynamic>>)
            .map((item) => Todo.fromJson(item))
            .toList();
      }
    });
  }

  Future<void> saveTodos(Iterable<Todo> todos) {
    final jsonList = todos.map((td) => td.toJson()).toList();
    return getLocalStorage()
        .then((storage) => storage.setItem(_TODOS_KEY, jsonList));
  }
}
