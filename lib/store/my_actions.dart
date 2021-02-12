import 'package:fun_arch_todo_flutter/models/app_state.dart';
import 'package:fun_arch_todo_flutter/models/app_tab.dart';
import 'package:fun_arch_todo_flutter/models/todo.dart';
import 'package:fun_arch_todo_flutter/models/todos_state.dart';
import 'package:fun_arch_todo_flutter/models/visibility_filter.dart';
import 'package:fun_arch_todo_flutter/utils/maybe.dart';

abstract class MyAction {
  AppState updateState(AppState appState);
}

AppState _updateTodoState(
  AppState appState,
  TodosState update(TodosState todosState),
) {
  return appState.copyWith(todosState: update(appState.todosState));
}

AppState _updateTodos(
  AppState appState,
  void updateInPlace(Map<String, Todo> todos),
) {
  Map<String, Todo> cloneMap = Map.from(appState.todosState.todos);
  updateInPlace(cloneMap);
  return _updateTodoState(
      appState, (todosState) => todosState.copyWith(todos: cloneMap));
}

AppState _updateSingleTodo(
  AppState appState,
  String todoId,
  Todo update(Todo todo),
) {
  return _updateTodos(
      appState, (todos) => todos..[todoId] = update(todos[todoId]));
}

class MarkCompletion implements MyAction {
  final String todoId;
  final bool isCompleted;

  MarkCompletion(this.todoId, this.isCompleted);

  @override
  AppState updateState(AppState appState) {
    return _updateSingleTodo(
      appState,
      todoId,
      (todo) => todo.copyWith(completed: isCompleted),
    );
  }
}

class DeleteTodo implements MyAction {
  final String todoId;

  DeleteTodo(this.todoId);

  @override
  AppState updateState(AppState appState) {
    return _updateTodos(appState, (todos) {
      todos.remove(todoId);
    });
  }
}

class UpdateTodo implements MyAction {
  final String todoId;
  final String task;
  final String notes;

  UpdateTodo(this.todoId, this.task, this.notes);

  @override
  AppState updateState(AppState appState) {
    return _updateSingleTodo(
      appState,
      todoId,
      (todo) => todo.copyWith(task: task, note: notes),
    );
  }
}

class SetActiveTab implements MyAction {
  final AppTab activeTab;

  SetActiveTab(this.activeTab);

  @override
  AppState updateState(AppState appState) {
    return appState.copyWith(activeTab: activeTab);
  }
}

class SetVisibilityFilter implements MyAction {
  final VisibilityFilter visibilityFilter;

  SetVisibilityFilter(this.visibilityFilter);

  @override
  AppState updateState(AppState appState) {
    if (appState.todosState.visibilityFilter == visibilityFilter) {
      return appState;
    }

    return _updateTodoState(
      appState,
      (todosState) => todosState.copyWith(visibilityFilter: visibilityFilter),
    );
  }
}

class ClearCompleted implements MyAction {
  @override
  AppState updateState(AppState appState) {
    return _updateTodos(appState, (todos) {
      todos.removeWhere((_, todo) => todo.completed);
    });
  }
}

class CompleteAll implements MyAction {
  @override
  AppState updateState(AppState appState) {
    return _updateTodos(appState, (todos) {
      todos.updateAll((_, todo) => todo.copyWith(completed: true));
    });
  }
}

class UnCompleteAll implements MyAction {
  @override
  AppState updateState(AppState appState) {
    return _updateTodos(appState, (todos) {
      todos.updateAll((_, todo) => todo.copyWith(completed: false));
    });
  }
}

class AddTodo implements MyAction {
  final Todo todo;

  AddTodo(this.todo);

  @override
  AppState updateState(AppState appState) {
    return _updateTodos(appState, (todos) {
      todos[todo.id] = todo;
    });
  }
}

class SelectTodo implements MyAction {
  final String todoId;

  SelectTodo(this.todoId);

  @override
  AppState updateState(AppState appState) {
    return _updateTodoState(
      appState,
      (todosState) => todosState.copyWith(selectedTodoId: Maybe.some(todoId)),
    );
  }
}

class ClearSelection implements MyAction {
  @override
  AppState updateState(AppState appState) {
    return _updateTodoState(
      appState,
      (todosState) => todosState.copyWith(selectedTodoId: Maybe.none()),
    );
  }
}

class SetTodos implements MyAction {
  final Iterable<Todo> list;

  SetTodos(this.list);

  @override
  AppState updateState(AppState appState) {
    return _updateTodos(appState, (todos) {
      todos.addEntries(list.map((todo) => MapEntry(todo.id, todo)));
    });
  }
}
