import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:examen_h3_todo/api/swagger.swagger.dart';
import 'package:examen_h3_todo/controllers/swagger_controller.dart';
import 'package:examen_h3_todo/controllers/task_controller.dart';
import 'package:examen_h3_todo/logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskCrudNotifier extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() async {}

  void createTask(int projectId, TaskDto taskDto) async {
    state = const AsyncLoading();

    L.debug("createTask", projectId);

    state = await AsyncValue.guard<void>(() async {
      final response = await ref
          .read(swaggerP)
          .profilesProjectsIdProjectTasksPost(idProject: projectId, body: taskDto);

      if (response.statusCode == 200) {
        ref
            .read(currentTaskP.notifier)
            .update((state) => state = response.bodyOrThrow);
      } else {
        state = AsyncValue.error(
          "Code (${response.statusCode}), Create Task: ${response.error as String}",
          StackTrace.current,
        );
      }

      return Future.delayed(Duration.zero);
    });
  }

  void updateTask(TaskDto updatedTask) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard<void>(() async {
      final response = await ref
          .read(swaggerP)
          .profilesProjectsTasksIdPut(id: updatedTask.id, body: updatedTask);

      if (response.statusCode == 200) {
        ref
            .read(currentTaskP.notifier)
            .update((state) => state = response.bodyOrThrow);
      } else {
        state = AsyncValue.error(
          "Code (${response.statusCode}), Update Task: ${response.error as String}",
          StackTrace.current,
        );
      }

      return Future.delayed(Duration.zero);
    });
  }

  Future<List<TaskDto>?> getAllTasks() async {
    state = const AsyncLoading();

    Response<List<TaskDto>?>? response;
    state = await AsyncValue.guard<void>(() async {
      response = await ref.read(swaggerP).profilesProjectsTasksGet();

      if (response?.statusCode == 200) {
        ref
            .read(tasksListP.notifier)
            .update((state) => state = response?.bodyOrThrow);
      } else {
        state = AsyncValue.error(
          "Code (${response?.statusCode}), Get all Tasks: ${response?.error as String}",
          StackTrace.current,
        );
      }

      return;
    });

    return response?.body;
  }

  void getTask(int id) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard<void>(() async {
      final response =
          await ref.read(swaggerP).profilesProjectsTasksIdGet(id: id);

      if (response.statusCode == 200) {
        ref
            .read(currentTaskP.notifier)
            .update((state) => state = response.bodyOrThrow);
      } else {
        state = AsyncValue.error(
          "Code (${response.statusCode}), Get Task: ${response.error as String}",
          StackTrace.current,
        );
      }

      return Future.delayed(Duration.zero);
    });
  }

  void deleteTask(int id) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard<void>(() async {
      final response =
          await ref.read(swaggerP).profilesProjectsTasksIdDelete(id: id);

      if (response.statusCode != 200) {
        state = AsyncValue.error(
          "Code (${response.statusCode}), Delete Task: ${response.error as String}",
          StackTrace.current,
        );
      }

      return Future.delayed(Duration.zero);
    });
  }
}
