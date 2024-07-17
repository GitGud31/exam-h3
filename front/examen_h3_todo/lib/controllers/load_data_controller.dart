import 'package:examen_h3_todo/controllers/profile_controller.dart';
import 'package:examen_h3_todo/controllers/project_controller.dart';
import 'package:examen_h3_todo/controllers/task_controller.dart';
import 'package:examen_h3_todo/routing/router.dart';
import 'package:examen_h3_todo/routing/routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final asyncLoadDataP = FutureProvider.autoDispose<void>((ref) async {
  await Future.microtask(() async {
    await ref.read(asyncProfileCrudP.notifier).getAllProfiles();
    await ref.read(asyncProjectCrudP.notifier).getAllProjects();
    await ref.read(asyncTaskCrudP.notifier).getAllTasks();
  });

  ref.read(routerP).replaceNamed(Routes.selectProject);
});
