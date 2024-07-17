import 'package:appflowy_board/appflowy_board.dart';
import 'package:examen_h3_todo/api/swagger.models.swagger.dart';
import 'package:flutter/material.dart';

// AppFlowyGroupCard is for the states of a project.

// AppFlowyGroupItem is for building the task card.
class TaskCardItem extends AppFlowyGroupItem {
  final TaskDto task;

  TaskCardItem(this.task);

  @override
  String get id => task.title ?? UniqueKey().toString();
}
