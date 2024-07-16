// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:examen_h3_todo/api/swagger.enums.swagger.dart';
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
  void listProfiles(BuildContext context, List<ProfileDto> profiles) async {
    await showDialog(
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
                  ref
                      .read(currentProfileP.notifier)
                      .update((state) => state = profile);

                  //TODO:  update view
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

  void listProjects(BuildContext context, List<ProjectDto> projects) async {
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('All projects'),
            SizedBox(
              width: 100,
              child: IconButton.filled(
                icon: const Icon(Icons.add, color: Colors.white),
                onPressed: () => _addProjectBottomsheet(context),
              ),
            ),
          ],
        ),
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
                  ref
                      .read(currentProjectP.notifier)
                      .update((state) => state = project);
                  context.maybePop();

                  //TODO: update view
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

  void _addProjectBottomsheet(BuildContext context) async {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController descriptionController = TextEditingController();

    await showModalBottomSheet<void>(
      context: context,
      useSafeArea: true,
      builder: (bottomsheetContext) {
        return SizedBox(
          height: MediaQuery.of(context).size.height / 2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Add new project',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                      labelText: 'Project Description',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Description cannot be empty';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: MaterialButton(
                      color: lightGreen,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          final newProjectDto = ProjectDto(
                            description: descriptionController.text,
                            tasks: [
                              TaskDto(
                                  createdAt: DateTime.now(),
                                  creator: ref.read(currentProfileP),
                                  deadline: "todo deadline",
                                  description: "todo description",
                                  priority: "todo priority",
                                  state: TaskDtoState.todo,
                                  subTasks: [],
                                  title: "new todo task"),
                              TaskDto(
                                  createdAt: DateTime.now(),
                                  creator: ref.read(currentProfileP),
                                  deadline: "inProgress deadline",
                                  description: "inProgress description",
                                  priority: "inProgress priority",
                                  state: TaskDtoState.inProgress,
                                  subTasks: [],
                                  title: "new inProgress task"),
                              TaskDto(
                                  createdAt: DateTime.now(),
                                  creator: ref.read(currentProfileP),
                                  deadline: "done deadline",
                                  description: "done description",
                                  priority: "done priority",
                                  state: TaskDtoState.done,
                                  subTasks: [],
                                  title: "new done task"),
                            ],
                          );

                          final currentProfile = ref.read(currentProfileP)!;

                          L.debug("add project", currentProfile);

                          ref
                              .read(asyncProjectCrudP.notifier)
                              .createProject(currentProfile.id!, newProjectDto);

                          bottomsheetContext.maybePop();
                        }
                      },
                      child: const Text(
                        'Add Project',
                        style: TextStyle(color: white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

    context.maybePop();
  }

  @override
  Widget build(BuildContext context) {
    final currentProfile = ref.watch(currentProfileP);
    final currentProfileName = (currentProfile == null)
        ? "NoProfile"
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
          MaterialButton(
            child: const Text("Profiles", style: TextStyle(color: white)),
            onPressed: () async {
              final profiles =
                  await ref.read(asyncProfileCrudP.notifier).getAllProfiles();

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

              (projects == null)
                  ? Bar.error(ref, context, "Error getting projects")
                  : listProjects(context, projects);
            },
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 72, top: 16, bottom: 16),
            child: Text(currentProject,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
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
