import 'package:flutter/foundation.dart';
import 'package:functional_data/functional_data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'todo.g.dart';

@JsonSerializable()
@FunctionalData()
class Todo extends $Todo {
  final String task;
  final String note;
  final String id;
  final bool completed;

  Todo({
    @required String this.task,
    @required String this.note,
    @required String this.id,
    @required bool this.completed,
  });

  Map<String, dynamic> toJson() => _$TodoToJson(this);

  static Todo fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  static Todo newTask(String task) {
    return Todo(task: task, note: '', id: Uuid().v4(), completed: false);
  }

  static Todo newNote(String task, String note) {
    return Todo(task: task, note: note, id: Uuid().v4(), completed: false);
  }
}
