// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

// ignore_for_file: join_return_with_assignment
// ignore_for_file: avoid_classes_with_only_static_members
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes
abstract class $Todo {
  const $Todo();
  String get task;
  String get note;
  String get id;
  bool get completed;
  Todo copyWith({String task, String note, String id, bool completed}) => Todo(
      task: task ?? this.task,
      note: note ?? this.note,
      id: id ?? this.id,
      completed: completed ?? this.completed);
  @override
  String toString() =>
      "Todo(task: $task, note: $note, id: $id, completed: $completed)";
  @override
  bool operator ==(dynamic other) =>
      other.runtimeType == runtimeType &&
      task == other.task &&
      note == other.note &&
      id == other.id &&
      completed == other.completed;
  @override
  int get hashCode {
    var result = 17;
    result = 37 * result + task.hashCode;
    result = 37 * result + note.hashCode;
    result = 37 * result + id.hashCode;
    result = 37 * result + completed.hashCode;
    return result;
  }
}

class Todo$ {
  static final task = Lens<Todo, String>(
      (s_) => s_.task, (s_, task) => s_.copyWith(task: task));
  static final note = Lens<Todo, String>(
      (s_) => s_.note, (s_, note) => s_.copyWith(note: note));
  static final id =
      Lens<Todo, String>((s_) => s_.id, (s_, id) => s_.copyWith(id: id));
  static final completed = Lens<Todo, bool>((s_) => s_.completed,
      (s_, completed) => s_.copyWith(completed: completed));
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Todo _$TodoFromJson(Map<String, dynamic> json) {
  return Todo(
    task: json['task'] as String,
    note: json['note'] as String,
    id: json['id'] as String,
    completed: json['completed'] as bool,
  );
}

Map<String, dynamic> _$TodoToJson(Todo instance) => <String, dynamic>{
      'task': instance.task,
      'note': instance.note,
      'id': instance.id,
      'completed': instance.completed,
    };
