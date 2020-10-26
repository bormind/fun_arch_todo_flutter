import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fun_arch_todo_flutter/navigation/nav_target.dart';
import 'package:fun_arch_todo_flutter/service_locator.dart';
import 'package:fun_arch_todo_flutter/store/actions/nav_actions.dart';
import 'package:fun_arch_todo_flutter/store/app_store.dart';
import 'package:fun_arch_todo_flutter/store/connect_state.dart';
import 'package:fun_arch_todo_flutter/utils/utils.dart';
import 'package:kt_dart/kt.dart';

class AppRouterDelegate extends RouterDelegate<void>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<void> {
  final GlobalKey<NavigatorState> navigatorKey;

  final _store = getIt<AppStore>();

  AppRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    print("Rendering Navigator");
    return ConnectState<KtList<NavTarget>>(
      map: (state) => state.navState.navTargets,
      where: notIdentical,
      builder: (navTargets) {
        return Navigator(
            key: navigatorKey,
            pages: _store.state.navState.navTargets
                .map((nav) => nav.buildPage())
                .asList(),
            onPopPage: (route, dynamic result) {
              if (!route.didPop(result)) {
                return false;
              }

              _store.dispatch(PopNavTarget());
              return true;
            });
      },
    );
  }

  @override
  Future<void> setNewRoutePath(void configuration) async {
    print("Called setNewRoutePath");
  }
}

// pages: [
//   MaterialPage<void>(
//     key: ValueKey("Home"),
//     child: HomeScreen(),
//   ),
//   MaterialPage<void>(
//     key: ValueKey("AddOrEdit"),
//     child: AddEditScreen(none()),
//   )
// ],
