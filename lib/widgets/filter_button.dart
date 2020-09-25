import 'package:flutter/material.dart';
import 'package:fun_arch_todo_flutter/models/todos_state.dart';
import 'package:fun_arch_todo_flutter/models/visibility_filter.dart';
import 'package:fun_arch_todo_flutter/service_locator.dart';
import 'package:fun_arch_todo_flutter/store/actions.dart';
import 'package:fun_arch_todo_flutter/store/app_store.dart';
import 'package:fun_arch_todo_flutter/store/connect_state.dart';
import 'package:fun_arch_todo_flutter/utils/utils.dart';

class FilterButton extends StatelessWidget {
  final _store = getIt<AppStore>();
  final bool visible;

  FilterButton({this.visible, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConnectState<TodosState>(
      map: (state) => state.todosState,
      where: notEqual,
      builder: (todosState) {
        final defaultStyle = Theme.of(context).textTheme.bodyText1;
        final activeStyle = Theme.of(context)
            .textTheme
            .bodyText1
            .copyWith(color: Theme.of(context).accentColor);

        final button = _Button(
          onSelected: (filter) {
            _store.dispatch(SetVisibilityFilter(filter));
          },
          activeFilter: !todosState.isLoading
              ? todosState.visibilityFilter
              : VisibilityFilter.all,
          activeStyle: activeStyle,
          defaultStyle: defaultStyle,
        );
        return AnimatedOpacity(
          opacity: visible ? 1.0 : 0.0,
          duration: Duration(milliseconds: 150),
          child: visible ? button : IgnorePointer(child: button),
        );
      },
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    Key key,
    @required this.onSelected,
    @required this.activeFilter,
    @required this.activeStyle,
    @required this.defaultStyle,
  }) : super(key: key);

  final PopupMenuItemSelected<VisibilityFilter> onSelected;
  final VisibilityFilter activeFilter;
  final TextStyle activeStyle;
  final TextStyle defaultStyle;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<VisibilityFilter>(
      tooltip: 'Filter Todos',
      onSelected: onSelected,
      itemBuilder: (BuildContext context) => <PopupMenuItem<VisibilityFilter>>[
        PopupMenuItem<VisibilityFilter>(
          value: VisibilityFilter.all,
          child: Text(
            'Show All',
            style: activeFilter == VisibilityFilter.all
                ? activeStyle
                : defaultStyle,
          ),
        ),
        PopupMenuItem<VisibilityFilter>(
          value: VisibilityFilter.active,
          child: Text(
            'Show Active',
            style: activeFilter == VisibilityFilter.active
                ? activeStyle
                : defaultStyle,
          ),
        ),
        PopupMenuItem<VisibilityFilter>(
          value: VisibilityFilter.completed,
          child: Text(
            'Show Completed',
            style: activeFilter == VisibilityFilter.completed
                ? activeStyle
                : defaultStyle,
          ),
        ),
      ],
      icon: Icon(Icons.filter_list),
    );
  }
}
