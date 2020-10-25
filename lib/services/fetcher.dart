import 'package:fun_arch_todo_flutter/service_locator.dart';
import 'package:fun_arch_todo_flutter/services/local_storage_service.dart';
import 'package:fun_arch_todo_flutter/store/actions/home_actions.dart';
import 'package:fun_arch_todo_flutter/store/actions/todo_actions.dart';
import 'package:fun_arch_todo_flutter/store/app_store.dart';

class Fetcher {
  final AppStore _store = getIt<AppStore>();
  final LocalStorageService _localStorage = getIt<LocalStorageService>();

  Future<void> loadTodosFromLocalStorage() {
    _store.dispatch(SetLoading(true));
    return _localStorage
        .loadTodos()
        .then((todos) => _store.dispatch(SetTodos(todos)))
        .whenComplete(() {
      _store.dispatch(SetLoading(false));
      _store.dispatch(SetDataInitialized());
    });
  }
}
