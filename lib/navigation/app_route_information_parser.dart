import 'package:flutter/widgets.dart';
import 'package:fun_arch_todo_flutter/navigation/nav_target.dart';

class AppRouteInformationParser extends RouteInformationParser<NavTarget> {
  @override
  Future<NavTarget> parseRouteInformation(
      RouteInformation routeInformation) async {
    return NavNotFound();
  }
}
