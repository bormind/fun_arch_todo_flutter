import 'package:fun_arch_todo_flutter/store/app_store.dart';
import 'package:fun_arch_todo_flutter/models/app_state.dart';
import 'package:fun_arch_todo_flutter/services/fetcher.dart';
import 'package:todos_repository_simple/todos_repository_simple.dart';
import 'package:path_provider/path_provider.dart';

class Env {
  static final store = AppStore(AppState.initial());

  static final fetcher = Fetcher(
      store: store,
      todoRepo: TodosRepositoryFlutter(
        fileStorage: const FileStorage(
          '__fun_arch_todo_flutter__',
          getApplicationDocumentsDirectory,
        ),
      ));
}
