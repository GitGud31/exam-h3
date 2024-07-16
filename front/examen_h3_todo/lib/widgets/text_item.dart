import 'package:appflowy_board/appflowy_board.dart';
import 'package:appflowy_board/src/widgets/reorder_phantom/phantom_controller.dart';
import 'package:appflowy_board/src/widgets/reorder_flex/drag_target.dart';
import 'package:examen_h3_todo/api/swagger.models.swagger.dart';
import 'package:flutter/material.dart';

///* AppFlowyGroupItem that displays the title in a card.
class TextItem extends AppFlowyGroupItem {
  final String s;

  TextItem(this.s);

  @override
  String get id => s;
}

// AppFlowyGroupCard is for the states of a project.

// AppFlowyGroupItem is for building the task card.
class TaskCardItem extends AppFlowyGroupItem {
  final TaskDto task;

  TaskCardItem(this.task);

  @override
  String get id => task.title ?? UniqueKey().toString();
}
