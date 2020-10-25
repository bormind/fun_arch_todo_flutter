import 'package:flutter/material.dart';
import 'package:fun_arch_todo_flutter/models/app_tab.dart';
import 'package:fun_arch_todo_flutter/navigation/nav_target.dart';
import 'package:fun_arch_todo_flutter/screens/stats_section.dart';
import 'package:fun_arch_todo_flutter/screens/todos_section.dart';
import 'package:fun_arch_todo_flutter/service_locator.dart';
import 'package:fun_arch_todo_flutter/store/actions/home_actions.dart';
import 'package:fun_arch_todo_flutter/store/actions/nav_actions.dart';
import 'package:fun_arch_todo_flutter/store/app_store.dart';
import 'package:fun_arch_todo_flutter/store/connect_state.dart';
import 'package:fun_arch_todo_flutter/widgets/extra_actions.dart';
import 'package:fun_arch_todo_flutter/widgets/filter_button.dart';
import 'package:fun_arch_todo_flutter/widgets/tab_selector.dart';
import 'package:fun_arch_todo_flutter/utils/utils.dart';

class HomeScreen extends StatelessWidget {
  final _store = getIt<AppStore>();

  @override
  Widget build(BuildContext context) {
    return ConnectState<AppTab>(
      map: (state) => state.activeTab,
      where: notIdentical,
      builder: (activeTab) {
        print("Rendering Home Screen");

        return Scaffold(
          appBar: AppBar(
            title: Text("Todo Starter"),
            actions: [
              FilterButton(visible: activeTab == AppTab.todos),
              ExtraActions(),
            ],
          ),
          body: activeTab == AppTab.todos ? TodosSection() : StatsSection(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _store.dispatch(SetNavTarget(NavAddTodo()));
            },
            child: Icon(Icons.add),
            tooltip: "Add Todo",
          ),
          bottomNavigationBar: TabSelector(
            activeTab: activeTab,
            onTabSelected: (tab) => _store.dispatch(SetActiveTab(tab)),
          ),
        );
      },
    );
  }
}
