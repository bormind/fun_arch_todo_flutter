import 'package:flutter/material.dart';
import 'package:fun_arch_todo_flutter/models/todo.dart';

class DeleteTodoSnackBar extends SnackBar {
  DeleteTodoSnackBar({
    Key? key,
    required Todo todo,
    required VoidCallback onUndo,
  }) : super(
          key: key,
          content: Text(
            'Deleted "${todo.task}"',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          duration: Duration(seconds: 2),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: onUndo,
          ),
        );
}
