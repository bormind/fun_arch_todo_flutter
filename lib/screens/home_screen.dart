import 'package:flutter/material.dart';
import 'package:fun_arch_todo_flutter/models/app_tab.dart';
import 'package:fun_arch_todo_flutter/routes.dart';
import 'package:fun_arch_todo_flutter/screens/todos_screen.dart';
import 'package:fun_arch_todo_flutter/service_locator.dart';
import 'package:fun_arch_todo_flutter/store/actions.dart';
import 'package:fun_arch_todo_flutter/store/app_store.dart';
import 'package:fun_arch_todo_flutter/store/connect_state.dart';
import 'package:fun_arch_todo_flutter/widgets/extra_actions.dart';
import 'package:fun_arch_todo_flutter/widgets/filter_button.dart';
import 'package:fun_arch_todo_flutter/widgets/stats.dart';
import 'package:fun_arch_todo_flutter/widgets/tab_selector.dart';

class HomeScreen extends StatelessWidget {
  final _store = getIt<AppStore>();

  @override
  Widget build(BuildContext context) {
    return ConnectState<AppTab>(
      map: (state) => state.activeTab,
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
          body: activeTab == AppTab.todos ? TodosScreen() : Stats(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, ArchSampleRoutes.addTodo);
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
