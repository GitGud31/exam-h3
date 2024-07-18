// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:examen_h3_todo/consts/colors.dart';
import 'package:examen_h3_todo/controllers/profile_controller.dart';
import 'package:examen_h3_todo/controllers/project_controller.dart';
import 'package:examen_h3_todo/controllers/task_controller.dart';
import 'package:examen_h3_todo/routing/router.dart';
import 'package:examen_h3_todo/routing/routes.dart';
import 'package:examen_h3_todo/utils/snackbar_utils.dart';
import 'package:examen_h3_todo/widgets/task_board_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

@RoutePage()
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final currentProfile = ref.watch(currentProfileP);
    final currentProfileName = (currentProfile == null)
        ? "No Profile"
        : "Welcome, ${currentProfile.firstName}";

    final currentProject =
        "Project, ${ref.watch(currentProjectP)?.description ?? "No project selected"}";

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leadingWidth: MediaQuery.sizeOf(context).width / 3,
        leading: Padding(
          padding: const EdgeInsets.only(left: 72, top: 14),
          child: Text(currentProfileName,
              style: const TextStyle(color: white, fontSize: 20)),
        ),
        backgroundColor: Colors.blue[800],
        title: const Text(
          'H3 Trello',
          style: TextStyle(
              color: white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        actions: [
          // projects
          MaterialButton(
            child: const Text("Projects", style: TextStyle(color: white)),
            onPressed: () async {
              final projects =
                  await ref.read(asyncProjectCrudP.notifier).getAllProjects();

              (projects == null)
                  ? Bar.error(ref, context, "Error getting projects")
                  //: listProjects(context, projects);
                  : ref.read(routerP).navigateNamed(Routes.selectProject);
            },
          ),

          const Gap(10),

          //logout
          MaterialButton(
            color: white,
            child: Text("Logout", style: TextStyle(color: lightRed)),
            onPressed: () {
              ref.read(profileTokenP.notifier).update((state) => null);

              ref.invalidate(currentProjectP);
              ref.invalidate(currentProfileP);
              ref.invalidate(currentTaskP);

              ref.invalidate(profilesListP);
              ref.invalidate(projectsListP);
              ref.invalidate(tasksListP);

              ref.invalidate(asyncProfileCrudP);
              ref.invalidate(asyncProjectCrudP);
              ref.invalidate(asyncTaskCrudP);

              ref.read(routerP).replaceNamed(Routes.login);
            },
          ),

          const Gap(32),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //project title
          Padding(
            padding: const EdgeInsets.only(left: 72, top: 16, bottom: 16),
            child: Text(
              currentProject,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),

          // tasks
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(16),
              child: const TaskBoardBuilder(),
            ),
          ),
        ],
      ),
    );
  }
}
