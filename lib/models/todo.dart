import 'package:todos_app_core/todos_app_core.dart';
import 'package:meta/meta.dart';
import 'package:todos_repository_core/todos_repository_core.dart';

@immutable
class Todo {
  final bool completed;
  final String id;
  final String note;
  final String task;

  Todo(this.task, {this.completed = false, String note = '', String id})
      : this.note = note ?? '',
        this.id = id ?? Uuid().generateV4();

  Todo copyWith({
    bool completed,
    String id,
    String note,
    String task,
  }) {
    return Todo(
      task ?? this.task,
      completed: completed ?? this.completed,
      id: id ?? this.id,
      note: note ?? this.note,
    );
  }

  @override
  String toString() {
    return 'Todo { complete: $completed, task: $task, note: $note, id: $id }';
  }

  TodoEntity toEntity() {
    return TodoEntity(task, id, note, completed);
  }

  static Todo fromEntity(TodoEntity entity) {
    return Todo(
      entity.task,
      completed: entity.complete ?? false,
      note: entity.note,
      id: entity.id ?? Uuid().generateV4(),
    );
  }
}
