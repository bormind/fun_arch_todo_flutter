import 'package:equatable/equatable.dart';
import 'package:fun_arch_todo_flutter/navigation/app_rout.dart';

abstract class NavTarget implements Equatable {
  final String rout;
  NavTarget(this.rout);

  @override
  List<Object> get props => [rout];

  @override
  bool get stringify => true;
}

class NavNotFound extends NavTarget {
  NavNotFound() : super(AppRoutes.notFound);
}

class NavHome extends NavTarget {
  NavHome() : super(AppRoutes.home);
}

class NavAddTodo extends NavTarget {
  NavAddTodo() : super(AppRoutes.add);
}

class NavEditTodo extends NavTarget {
  final String id;

  NavEditTodo(this.id) : super(AppRoutes.edit);

  @override
  List<Object> get props => super.props + [id];
}

class NavDetails extends NavTarget {
  NavDetails() : super(AppRoutes.details);
}
