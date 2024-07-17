import 'package:examen_h3_todo/controllers/profile_controller.dart';
import 'package:examen_h3_todo/controllers/project_controller.dart';
import 'package:examen_h3_todo/routing/router.dart';
import 'package:examen_h3_todo/routing/routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final asyncLoadDataP = FutureProvider<void>((ref) async {
  Future.microtask(() async {
    await ref.read(asyncProfileCrudP.notifier).getAllProfiles();

    final profile = ref.read(profilesListP)!.first;
    ref.read(currentProfileP.notifier).update((state) => state = profile);

    await ref.read(asyncProjectCrudP.notifier).getAllProjects();
    final project = ref.read(projectsListP)!.first;
    ref.read(currentProjectP.notifier).update((state) => state = project);

    ref.read(routerP).replaceNamed(Routes.selectProject);
  });
});
