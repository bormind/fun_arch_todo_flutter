import 'package:flutter/material.dart';
import 'package:redurx_light_starter/env.dart';
import 'package:redurx_light_starter/models/app_state.dart';
import 'package:redurx_light_starter/models/app_tab.dart';
import 'package:redurx_light_starter/screens/todos_screen.dart';
import 'package:redurx_light_starter/store/actions.dart';
import 'package:redurx_light_starter/store/connect_state.dart';
import 'package:redurx_light_starter/widgets/extra_actions.dart';
import 'package:redurx_light_starter/widgets/filter_button.dart';
import 'package:redurx_light_starter/widgets/stats.dart';
import 'package:redurx_light_starter/widgets/tab_selector.dart';
import 'package:todos_app_core/todos_app_core.dart';
import 'package:redurx_light_starter/utils/utils.dart';

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
