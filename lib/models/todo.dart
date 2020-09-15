import 'package:flutter/foundation.dart';
import 'package:fun_arch_todo_flutter/arch_samples/todo_entity.dart';

import 'package:functional_data/functional_data.dart';
import 'package:uuid/uuid.dart';

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
    return Todo(task: task, note: '', id: Uuid().v4(), completed: false);
  }

  static Todo newTote(String task, String note) {
    return Todo(task: task, note: note, id: Uuid().v4(), completed: false);
  }

  static Todo fromEntity(TodoEntity entity) {
    return Todo(
      task: entity.task,
      completed: entity.complete ?? false,
      note: entity.note,
      id: entity.id ?? Uuid().v4(),
    );
  }

  TodoEntity toEntity() {
    return TodoEntity(task, id, note, completed);
  }
}
