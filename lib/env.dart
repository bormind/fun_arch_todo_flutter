import 'package:redurx_light_starter/store/app_store.dart';
import 'package:redurx_light_starter/models/app_state.dart';
import 'package:redurx_light_starter/services/fetcher.dart';
import 'package:todos_repository_simple/todos_repository_simple.dart';
import 'package:path_provider/path_provider.dart';

final fetcher = Fetcher(
    todoRepo: TodosRepositoryFlutter(
  fileStorage: const FileStorage(
    '__redurx_light_starter__',
    getApplicationDocumentsDirectory,
  ),
));

final store = AppStore(AppState.initial());
