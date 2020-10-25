import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fun_arch_todo_flutter/screens/add_edit_screen.dart';
import 'package:fun_arch_todo_flutter/screens/home_screen.dart';
import 'package:fun_arch_todo_flutter/service_locator.dart';
import 'package:fun_arch_todo_flutter/store/actions/nav_actions.dart';
import 'package:fun_arch_todo_flutter/store/app_store.dart';

class AppRouterDelegate extends RouterDelegate<void>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<void> {
  final GlobalKey<NavigatorState> navigatorKey;

  final _store = getIt<AppStore>();

  AppRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: navigatorKey,
        pages: [
          MaterialPage<void>(
            key: ValueKey("Home"),
            child: HomeScreen(),
          ),
          MaterialPage<void>(
            key: ValueKey("AddOrEdit"),
            child: AddEditScreen(todo: None()),
          )
        ],
        onPopPage: (route, dynamic result) {
          if (!route.didPop(result)) {
            return false;
          }

          _store.dispatch(PopNavTarget());
          return true;
        });
  }

  @override
  Future<void> setNewRoutePath(void configuration) async {}
}
