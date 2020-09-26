import 'package:fun_arch_todo_flutter/services/fetcher.dart';
import 'package:fun_arch_todo_flutter/store/app_store.dart';
import 'package:fun_arch_todo_flutter/store/state_observer.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';

import 'arch_samples/file_storage.dart';
import 'models/app_state.dart';

GetIt getIt = GetIt.instance;

void initServiceLocator() {
  getIt.registerSingleton<AppStore>(AppStore(AppState.initial()));

  getIt.registerSingleton<FileStorage>(FileStorage(
    '__fun_arch_todo_flutter__',
    getApplicationDocumentsDirectory,
  ));

  getIt.registerSingleton<Fetcher>(Fetcher());

  getIt.registerSingleton<StateObserver>(StateObserver());
}
