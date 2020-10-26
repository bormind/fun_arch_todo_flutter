import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fun_arch_todo_flutter/navigation/app_rout.dart';
import 'package:fun_arch_todo_flutter/screens/add_edit_screen.dart';
import 'package:fun_arch_todo_flutter/screens/details_screen.dart';
import 'package:fun_arch_todo_flutter/screens/home_screen.dart';
import 'package:fun_arch_todo_flutter/screens/not_found_screen.dart';
import 'package:fun_arch_todo_flutter/service_locator.dart';
import 'package:fun_arch_todo_flutter/store/app_store.dart';

abstract class NavTarget implements Equatable {
  final String rout;
  NavTarget(this.rout);

  @override
  List<Object> get props => [rout];

  Widget buildScreen();

  bool get stringify => false;

  Page buildPage() {
    return MaterialPage(
      key: ValueKey(this.toString()),
      child: buildScreen(),
    );
  }

  @override
  String toString() {
    return rout;
  }
}

class NavNotFound extends NavTarget {
  NavNotFound() : super(AppRoutes.notFound);

  @override
  Widget buildScreen() => NotFoundScreen();
}

class NavHome extends NavTarget {
  NavHome() : super(AppRoutes.home);

  @override
  Widget buildScreen() => HomeScreen();

  @override
  // TODO: implement stringify
  bool get stringify => throw UnimplementedError();
}

class NavAddTodo extends NavTarget {
  NavAddTodo() : super(AppRoutes.add);

  @override
  Widget buildScreen() => AddEditScreen(none());
}

class NavEditTodo extends NavTarget {
  final String id;

  NavEditTodo(this.id) : super(AppRoutes.edit);

  @override
  List<Object> get props => super.props + [id];

  @override
  Widget buildScreen() {
    final store = getIt<AppStore>();
    return store.state.todosState
        .findById(id)
        .fold(() => NotFoundScreen(), (todo) => AddEditScreen(some(todo)));
  }
}

class NavDetails extends NavTarget {
  final String id;

  NavDetails(this.id) : super(AppRoutes.details);

  @override
  List<Object> get props => super.props + [id];

  @override
  Widget buildScreen() => DetailsScreen(id);
}
