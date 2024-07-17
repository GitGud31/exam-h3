import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:examen_h3_todo/api/swagger.swagger.dart';
import 'package:examen_h3_todo/controllers/profile_controller.dart';
import 'package:examen_h3_todo/controllers/project_controller.dart';
import 'package:examen_h3_todo/controllers/swagger_controller.dart';
import 'package:examen_h3_todo/logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectCrudNotifier extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() async {}

  void createProject(ProjectDto project) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard<void>(() async {
      final token = ref.read(profileTokenP)?.token;
      final response = await ref
          .read(swaggerP)
          .profilesProjectsPost(authorization: token, body: project);

      if (response.statusCode == 200) {
        ref
            .read(currentProjectP.notifier)
            .update((state) => state = response.bodyOrThrow);

        await getAllProjects();
      } else {
        state = AsyncValue.error(
          "Code (${response.statusCode}), Create Project: ${response.error as String}",
          StackTrace.current,
        );
      }
    });
  }

  void updateProject(ProjectDto updatedProject) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard<void>(() async {
      final token = ref.read(profileTokenP)?.token;
      final response = await ref.read(swaggerP).profilesProjectsIdProjectPut(
          authorization: token,
          idProject: updatedProject.id,
          body: updatedProject);

      if (response.statusCode == 200) {
        ref
            .read(currentProjectP.notifier)
            .update((state) => state = response.bodyOrThrow);
      } else {
        state = AsyncValue.error(
          "Code (${response.statusCode}), Update Project: ${response.error as String}",
          StackTrace.current,
        );
      }
    });
  }

  Future<List<ProjectDto>?> getAllProjects() async {
    state = const AsyncLoading();

    Response<List<ProjectDto>?>? response;
    state = await AsyncValue.guard<void>(() async {
      final token = ref.read(profileTokenP)?.token;
      response =
          await ref.read(swaggerP).profilesProjectsGet(authorization: token);

      L.debug(
          "get all projects ${response?.body?.length}", response?.statusCode);

      if (response?.statusCode == 200) {
        ref
            .read(projectsListP.notifier)
            .update((state) => state = response?.bodyOrThrow);
      } else {
        state = AsyncValue.error(
          "Code (${response?.statusCode}), Get all Projects: ${response?.error as String}",
          StackTrace.current,
        );
      }
    });

    return response?.body;
  }

  void getProject(int id) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard<void>(() async {
      final token = ref.read(profileTokenP)?.token;
      final response = await ref
          .read(swaggerP)
          .profilesProjectsIdGet(authorization: token, id: id);

      if (response.statusCode == 200) {
        ref
            .read(currentProjectP.notifier)
            .update((state) => state = response.bodyOrThrow);
      } else {
        state = AsyncValue.error(
          "Code (${response.statusCode}), Get Project: ${response.error as String}",
          StackTrace.current,
        );
      }
    });
  }

  void deleteProject(int id) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard<void>(() async {
      final token = ref.read(profileTokenP)?.token;
      final response = await ref
          .read(swaggerP)
          .profilesProjectsIdDelete(authorization: token, id: id);

      if (response.statusCode != 200) {
        state = AsyncValue.error(
          "Code (${response.statusCode}), Delete Project: ${response.error as String}",
          StackTrace.current,
        );
      }
    });
  }
}
