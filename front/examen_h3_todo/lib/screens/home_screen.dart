// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:examen_h3_todo/api/swagger.models.swagger.dart';
import 'package:examen_h3_todo/consts/colors.dart';
import 'package:examen_h3_todo/controllers/profile_controller.dart';
import 'package:examen_h3_todo/controllers/project_controller.dart';
import 'package:examen_h3_todo/logger.dart';
import 'package:examen_h3_todo/utils/snackbar_utils.dart';
import 'package:examen_h3_todo/widgets/task_board_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  void listProfiles(BuildContext context, List<ProfileDto> profiles) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('All profiles'),
        backgroundColor: Colors.white,
        content: SizedBox(
          height: 400,
          width: 300,
          child: ListView.builder(
            itemCount: profiles.length,
            itemBuilder: (_, index) {
              final profile = profiles[index];

              return ListTile(
                title: Text("${profile.firstName!} ${profile.lastName!}"),
                onTap: () {
                  //TODO: select profile, update view
                },
              );
            },
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Close'),
            onPressed: () => context.maybePop(),
          ),
        ],
      ),
    );
  }

  void listProjects(BuildContext context, List<ProjectDto> projects) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('All projects'),
        backgroundColor: Colors.white,
        content: SizedBox(
          height: 400,
          width: 300,
          child: ListView.builder(
            itemCount: projects.length,
            itemBuilder: (_, index) {
              final project = projects[index];

              return ListTile(
                title: Text(project.description!),
                onTap: () {
                  //TODO: select project, update view
                },
              );
            },
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Close'),
            onPressed: () => context.maybePop(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final profile = ref.watch(currentProfileP);
    final profileName =
        (profile == null) ? "" : "Welcome, ${profile.firstName}";

    return Scaffold(
        appBar: AppBar(
          leadingWidth: MediaQuery.sizeOf(context).width / 3,
          leading: Padding(
            padding: const EdgeInsets.only(left: 72, top: 14),
            child: Text(profileName,
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
            MaterialButton(
              child: const Text("Profiles", style: TextStyle(color: white)),
              onPressed: () async {
                final profiles =
                    await ref.read(asyncProfileCrudP.notifier).getAllProfiles();

                L.debug("dialog all profiles", profiles);

                (profiles == null)
                    ? Bar.error(ref, context, "Error getting profiles")
                    : listProfiles(context, profiles);
              },
            ),
            MaterialButton(
              child: const Text("Projects", style: TextStyle(color: white)),
              onPressed: () async {
                final projects =
                    await ref.read(asyncProjectCrudP.notifier).getAllProjects();

                L.debug("dialog all projects", projects);

                (projects == null)
                    ? Bar.error(ref, context, "Error getting projects")
                    : listProjects(context, projects);
              },
            )
          ],
        ),
        body: ref.watch(asyncProjectCrudP).when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, st) => Center(child: Text(e.toString())),
              data: (_) => Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(16),
                color: Colors.blue[800],
                child: const TaskBoardBuilder(),
              ),
            ));
  }
}
