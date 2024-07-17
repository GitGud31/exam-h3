import 'package:examen_h3_todo/api/swagger.enums.swagger.dart';

extension TasksExtension on void {
  TaskDtoState taskDtoState(String state) {
    switch (state) {
      case "To Do":
        return TaskDtoState.todo;
      case "In Progress":
        return TaskDtoState.inProgress;
      case "Done":
        return TaskDtoState.done;
      default:
        throw ArgumentError('Invalid column ID: $state');
    }
  }
}
