import 'package:fun_arch_todo_flutter/models/app_state.dart';
import 'package:fun_arch_todo_flutter/models/nav_state.dart';
import 'package:fun_arch_todo_flutter/navigation/nav_target.dart';
import 'package:fun_arch_todo_flutter/store/actions/action.dart';
import 'package:fun_arch_todo_flutter/utils/kt_list_extensions.dart';
import 'package:kt_dart/kt.dart';

final _navTargetsLens = AppState$.navState.then(NavState$.navTargets);

class SetNavTarget extends Action {
  final NavTarget navTarget;

  SetNavTarget(this.navTarget);

  @override
  AppState updateState(AppState appState) {
    final updated = appState.navState.navTargets
        .takeWhile((nt) => nt.rout != navTarget.rout)
        .push(navTarget);

    return _navTargetsLens.of(appState).update(updated);
  }
}

class PopNavTarget extends Action {
  @override
  AppState updateState(AppState appState) {
    if (appState.navState.navTargets.size <= 1) {
      assert(false, () => "Cant pop last screen");
      return appState;
    }

    final updated = appState.navState.navTargets.dropLast(1);

    return _navTargetsLens.of(appState).update(updated);
  }
}
