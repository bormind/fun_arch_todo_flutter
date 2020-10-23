import 'package:fun_arch_todo_flutter/services/fetcher.dart';
import 'package:fun_arch_todo_flutter/services/local_storage_service.dart';
import 'package:fun_arch_todo_flutter/store/app_store.dart';
import 'package:fun_arch_todo_flutter/store/state_observer.dart';
import 'package:get_it/get_it.dart';
import 'models/app_state.dart';

GetIt getIt = GetIt.instance;

void initServiceLocator() {
  getIt.registerSingleton<AppStore>(AppStore(AppState.initial()));

  getIt.registerSingleton<LocalStorageService>(LocalStorageService());

  getIt.registerSingleton<Fetcher>(Fetcher());

  getIt.registerSingleton<StateObserver>(StateObserver());
}
