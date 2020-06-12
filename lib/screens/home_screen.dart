import 'package:flutter/material.dart';
import 'package:fun_arch_todo_flutter/env.dart';
import 'package:fun_arch_todo_flutter/models/app_tab.dart';
import 'package:fun_arch_todo_flutter/screens/todos_screen.dart';
import 'package:fun_arch_todo_flutter/store/actions.dart';
import 'package:fun_arch_todo_flutter/store/connect_state.dart';
import 'package:fun_arch_todo_flutter/widgets/extra_actions.dart';
import 'package:fun_arch_todo_flutter/widgets/filter_button.dart';
import 'package:fun_arch_todo_flutter/widgets/stats.dart';
import 'package:fun_arch_todo_flutter/widgets/tab_selector.dart';
import 'package:todos_app_core/todos_app_core.dart';
import 'package:fun_arch_todo_flutter/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen() : super(key: ArchSampleKeys.homeScreen);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Env.fetcher.loadTodos();
    super.initState();
  }

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
          body: activeTab == AppTab.todos ? TodosScreen() : Stats(),
          floatingActionButton: FloatingActionButton(
            key: ArchSampleKeys.addTodoFab,
            onPressed: () {
              Navigator.pushNamed(context, ArchSampleRoutes.addTodo);
            },
            child: Icon(Icons.add),
            tooltip: ArchSampleLocalizations.of(context).addTodo,
          ),
          bottomNavigationBar: TabSelector(
            activeTab: activeTab,
            onTabSelected: (tab) => Env.store.dispatch(SetActiveTab(tab)),
          ),
        );
      },
    );
  }
}
