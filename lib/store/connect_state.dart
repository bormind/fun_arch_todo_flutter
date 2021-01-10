import 'package:flutter/widgets.dart';
import 'package:fun_arch_todo_flutter/models/app_state.dart';
import 'package:fun_arch_todo_flutter/service_locator.dart';
import 'package:fun_arch_todo_flutter/store/app_store.dart';

class ConnectState<T> extends StatelessWidget {
  final T Function(AppState state) map;
  final bool Function(T prev, T next) where;
  final Widget Function(T state) builder;

  final _store = getIt<AppStore>();

  ConnectState({
    Key key,
    @required this.map,
    this.where,
    @required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: _store.state$.map(map).distinct((T prev, T next) =>
          where != null ? !where(prev, next) : identical(prev, next)),
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return Container();
        }
        return builder(snapshot.data);
      },
    );
  }
}
