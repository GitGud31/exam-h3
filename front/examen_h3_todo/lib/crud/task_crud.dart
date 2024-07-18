import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:examen_h3_todo/api/swagger.swagger.dart';
import 'package:examen_h3_todo/controllers/profile_controller.dart';
import 'package:examen_h3_todo/controllers/project_controller.dart';
import 'package:examen_h3_todo/controllers/swagger_controller.dart';
import 'package:examen_h3_todo/controllers/task_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskCrudNotifier extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() async {}

  void createTask(int projectId, TaskDto taskDto) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard<void>(() async {
      final token = ref.read(profileTokenP)?.token;
      final response = await ref
          .read(swaggerP)
          .profilesProjectsIdProjectTasksPost(
              authorization: token, idProject: projectId, body: taskDto);

      if (response.statusCode == 200) {
        ref
            .read(currentTaskP.notifier)
            .update((state) => state = response.bodyOrThrow);

        await getAllTasks();
      } else {
        state = AsyncValue.error(
          "Code (${response.statusCode}), Create Task: ${response.error as String}",
          StackTrace.current,
        );
      }
    });
  }

  void updateTask(TaskDto updatedTask) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard<void>(() async {
      final token = ref.read(profileTokenP)?.token;
      final response = await ref.read(swaggerP).profilesProjectsTasksIdPut(
          authorization: token, id: updatedTask.id, body: updatedTask);

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
    });
  }

  Future<List<TaskDto>?> getAllTasks() async {
    state = const AsyncLoading();

    Response<List<TaskDto>>? response;
    state = await AsyncValue.guard<void>(() async {
      final token = ref.read(profileTokenP)?.token;
      response = await ref.read(swaggerP).profilesProjectsIdProjectTasksGet(
            idProject: ref.read(currentProjectP)!.id,
            authorization: token,
          );

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
    });

    return response?.body;
  }

  void getTask(int id) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard<void>(() async {
      final token = ref.read(profileTokenP)?.token;
      final response = await ref
          .read(swaggerP)
          .profilesProjectsTasksIdGet(authorization: token, id: id);

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
    });
  }

  Future<bool> deleteTask(int id) async {
    state = const AsyncLoading();

    bool result = false;
    state = await AsyncValue.guard<void>(() async {
      final token = ref.read(profileTokenP)?.token;
      final response = await ref
          .read(swaggerP)
          .profilesProjectsTasksIdDelete(authorization: token, id: id);

      if (response.statusCode == 200) {
        await getAllTasks();
        result = true;
      } else {
        state = AsyncValue.error(
          "Code (${response.statusCode}), Delete Task: ${response.error as String}",
          StackTrace.current,
        );
      }
    });

    return result;
  }
}
