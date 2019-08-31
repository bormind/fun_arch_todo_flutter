import 'package:flutter/material.dart';
import 'package:fun_arch_todo_flutter/env.dart';
import 'package:fun_arch_todo_flutter/models/app_state.dart';
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ConnectState<AppState>(
      map: (state) => state,
      where: notIdentical,
      builder: (state) => Scaffold(
        appBar: AppBar(
          title: Text("Todo Starter"),
          actions: [
            FilterButton(visible: state.activeTab == AppTab.todos),
            ExtraActions(),
          ],
        ),
        body: state.activeTab == AppTab.todos
            ? TodosScreen(state.todosState)
            : Stats(),
        floatingActionButton: FloatingActionButton(
          key: ArchSampleKeys.addTodoFab,
          onPressed: () {
            Navigator.pushNamed(context, ArchSampleRoutes.addTodo);
          },
          child: Icon(Icons.add),
          tooltip: ArchSampleLocalizations.of(context).addTodo,
        ),
        bottomNavigationBar: TabSelector(
          activeTab: state.activeTab,
          onTabSelected: (tab) => store.dispatch(setActiveTab(tab)),
        ),
      ),
    );
  }
}
