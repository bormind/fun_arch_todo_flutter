import 'package:fun_arch_todo_flutter/models/app_state.dart';
import 'package:fun_arch_todo_flutter/models/app_tab.dart';
import 'package:fun_arch_todo_flutter/models/todo.dart';
import 'package:fun_arch_todo_flutter/models/todos_state.dart';
import 'package:fun_arch_todo_flutter/models/visibility_filter.dart';
import 'package:plain_optional/plain_optional.dart';

abstract class Action {
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

class MarkCompletion implements Action {
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

class DeleteTodo implements Action {
  final String todoId;

  DeleteTodo(this.todoId);

  @override
  AppState updateState(AppState appState) {
    return _updateTodos(appState, (todos) {
      todos.remove(todoId);
    });
  }
}

class UpdateTodo implements Action {
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

class SetActiveTab implements Action {
  final AppTab activeTab;

  SetActiveTab(this.activeTab);

  @override
  AppState updateState(AppState appState) {
    return appState.copyWith(activeTab: activeTab);
  }
}

class SetVisibilityFilter implements Action {
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

class ClearCompleted implements Action {
  @override
  AppState updateState(AppState appState) {
    return _updateTodos(appState, (todos) {
      todos.removeWhere((_, todo) => todo.completed);
    });
  }
}

class CompleteAll implements Action {
  @override
  AppState updateState(AppState appState) {
    return _updateTodos(appState, (todos) {
      todos.updateAll((_, todo) => todo.copyWith(completed: true));
    });
  }
}

class UnCompleteAll implements Action {
  @override
  AppState updateState(AppState appState) {
    return _updateTodos(appState, (todos) {
      todos.updateAll((_, todo) => todo.copyWith(completed: false));
    });
  }
}

class AddTodo implements Action {
  final Todo todo;

  AddTodo(this.todo);

  @override
  AppState updateState(AppState appState) {
    return _updateTodos(appState, (todos) {
      todos[todo.id] = todo;
    });
  }
}

class SelectTodo implements Action {
  final String todoId;

  SelectTodo(this.todoId);

  @override
  AppState updateState(AppState appState) {
    return _updateTodoState(
      appState,
      (todosState) => todosState.copyWith(selectedTodoId: Optional(todoId)),
    );
  }
}

class ClearSelection implements Action {
  @override
  AppState updateState(AppState appState) {
    return _updateTodoState(
      appState,
      (todosState) => todosState.copyWith(selectedTodoId: Optional.none()),
    );
  }
}

class SetTodos implements Action {
  final Iterable<Todo> list;

  SetTodos(this.list);

  @override
  AppState updateState(AppState appState) {
    return _updateTodos(appState, (todos) {
      todos.addEntries(list.map((todo) => MapEntry(todo.id, todo)));
    });
  }
}
