import 'package:flutter/widgets.dart';
import 'package:fun_arch_todo_flutter/navigation/nav_target.dart';
import 'package:functional_data/functional_data.dart';
import 'package:kt_dart/collection.dart';

part 'nav_state.g.dart';

@FunctionalData()
class NavState extends $NavState {
  final KtList<NavTarget> navTargets;

  NavState({
    @required this.navTargets,
  });

  factory NavState.initial() => NavState(navTargets: KtList.of(NavHome()));
}
