import 'package:flutter/foundation.dart';
import 'package:fun_arch_todo_flutter/arch_samples/todo_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'todo.freezed.dart';

@freezed
abstract class Todo with _$Todo {
  factory Todo({
    @required String task,
    @required String note,
    @required String id,
    @required bool completed,
  }) = _Todo;

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
}

extension TodoX on Todo {
  TodoEntity toEntity() {
    return TodoEntity(this.task, this.id, this.note, this.completed);
  }
}
