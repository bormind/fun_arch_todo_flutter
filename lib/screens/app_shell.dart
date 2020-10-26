import 'package:flutter/material.dart';
import 'package:fun_arch_todo_flutter/navigation/app_route_information_parser.dart';
import 'package:fun_arch_todo_flutter/navigation/app_router_delegate.dart';

class AppShell extends StatefulWidget {
  @override
  _AppShellState createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  final _routerDelegate = AppRouterDelegate();
  final _routeInformationParser = AppRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    print("Rendering AppShell");
    return MaterialApp.router(
      title: '"Todo Starter"',
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,
    );
  }
}
