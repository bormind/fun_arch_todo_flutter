import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:fun_arch_todo_flutter/navigation/app_rout.dart';
import 'package:fun_arch_todo_flutter/navigation/nav_target.dart';
import 'package:kt_dart/kt.dart';

final notFound = KtList.of(NavNotFound());

final _posibleCombinations = [
  [AppRoutes.home],
  [AppRoutes.home, AppRoutes.add],
  [AppRoutes.home, AppRoutes.edit],
  [AppRoutes.home, AppRoutes.details],
  [AppRoutes.home, AppRoutes.details, AppRoutes.edit],
];

void _complain(String token, String path) {
  print("Unexpected token '$token' found in path '$path'");
}

//This is very naive implementation of url parsing
class AppRouteInformationParser
    extends RouteInformationParser<List<NavTarget>> {
  @override
  Future<List<NavTarget>> parseRouteInformation(
      RouteInformation routeInformation) async {
    print("Parse location: ${routeInformation.location}");

    final List<NavTarget> targets = [];

    final uri = Uri.parse(routeInformation.location.toLowerCase());
    List<String> tokens = List.from(uri.pathSegments);
    while (tokens.isNotEmpty) {
      final token = tokens.first;
      tokens = tokens.sublist(1);
      if (token == AppRoutes.home) {
        targets.add(NavHome());
      } else if (token == AppRoutes.add) {
        targets.add(NavAddTodo());
      } else if (token == AppRoutes.details || token == AppRoutes.edit) {
        if (tokens.isEmpty) {
          _complain(token, routeInformation.location);
          break;
        }

        final id = tokens.first;
        tokens = tokens.sublist(1);
        if (token == AppRoutes.details) {
          targets.add(NavDetails(id));
        } else {
          targets.add(NavEditTodo(id));
        }
      } else {
        _complain(token, routeInformation.location);
        break;
      }
    }

    if (targets.isEmpty) {
      targets.add(NavNotFound());
    }

    //TODO check against _posibleCombinations list to avoid hacking
    return targets;
  }

  @override
  RouteInformation restoreRouteInformation(List<NavTarget> targets) {
    print("Called restoreRouteInformation");
    return RouteInformation(
        location: "/${targets.map((e) => e.toString()).join("/")}");
  }
}
