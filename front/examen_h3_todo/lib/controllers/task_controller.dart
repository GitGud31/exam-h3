import 'package:examen_h3_todo/api/swagger.models.swagger.dart';
import 'package:examen_h3_todo/crud/task_crud.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final asyncTaskCrudP =
    AsyncNotifierProvider<TaskCrudNotifier, void>(TaskCrudNotifier.new);

final currentTaskP = StateProvider<TaskDto?>((_) => null);
final tasksListP = StateProvider<List<TaskDto>?>((_) => null);
