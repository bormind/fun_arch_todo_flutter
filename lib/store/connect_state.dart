import 'package:flutter/widgets.dart';
import 'package:redurx_light_starter/models/app_state.dart';
import 'package:redurx_light_starter/store/app_store.dart';

class ConnectState<T> extends StatelessWidget {
  final T Function(AppState state) map;
  final bool Function(T prev, T next) where;
  final Widget Function(T state) builder;

  ConnectState({
    Key key,
    @required this.map,
    @required this.where,
    @required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: AppStore.state$
          .map(map)
          .distinct((T prev, T next) => !where(prev, next)),
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return Container();
        }

        return builder(snapshot.data);
      },
    );
  }
}
