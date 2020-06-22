import 'package:flutter/foundation.dart';
import 'package:todos_app_core/todos_app_core.dart';
import 'package:todos_repository_core/todos_repository_core.dart';

import 'package:functional_data/functional_data.dart';

part 'todo.g.dart';

@FunctionalData()
class Todo extends $Todo {
  final String task;
  final String note;
  final String id;
  final bool completed;

  const Todo({
    @required this.task,
    @required this.note,
    @required this.id,
    @required this.completed,
  });

  static Todo newTask(String task) {
    return Todo(
        task: task, note: '', id: Uuid().generateV4(), completed: false);
  }

  static Todo newTote(String task, String note) {
    return Todo(
        task: task, note: note, id: Uuid().generateV4(), completed: false);
  }

  static Todo fromEntity(TodoEntity entity) {
    return Todo(
      task: entity.task,
      completed: entity.complete ?? false,
      note: entity.note,
      id: entity.id ?? Uuid().generateV4(),
    );
  }

  TodoEntity toEntity() {
    return TodoEntity(task, id, note, completed);
  }
}
