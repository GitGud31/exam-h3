// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:examen_h3_todo/api/swagger.enums.swagger.dart';
import 'package:examen_h3_todo/api/swagger.models.swagger.dart';
import 'package:examen_h3_todo/consts/colors.dart';
import 'package:examen_h3_todo/controllers/profile_controller.dart';
import 'package:examen_h3_todo/controllers/project_controller.dart';
import 'package:examen_h3_todo/routing/router.dart';
import 'package:examen_h3_todo/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

@RoutePage()
class SelectProjectScreen extends ConsumerStatefulWidget {
  const SelectProjectScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SelectProjectScreenState();
}

class _SelectProjectScreenState extends ConsumerState<SelectProjectScreen> {
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  const Gap(20),

                  // project description
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

                  const Gap(20),

                  // add project button
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: MaterialButton(
                      color: lightGreen,
                      onPressed: () async {
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

                          ref
                              .read(asyncProjectCrudP.notifier)
                              .createProject(newProjectDto);

                          bottomsheetContext.maybePop();
                        }
                      },
                      child: const Text('Add Project',
                          style: TextStyle(color: white)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final projects = ref.watch(projectsListP);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Select a Project"),
        centerTitle: true,
        actions: [
          MaterialButton(
            child: const Icon(Icons.add),
            onPressed: () => _addProjectBottomsheet(context),
          ),
        ],
      ),
      body: ref.watch(asyncProjectCrudP).when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, st) => Center(child: Text(e.toString())),
            data: (_) => ListView.builder(
              reverse: true,
              padding: const EdgeInsets.all(32),
              itemCount: projects!.length,
              itemBuilder: (_, index) {
                if (projects.isEmpty) {
                  return const Center(
                    child: Text("No projects found, create one!"),
                  );
                }

                final project = projects[index];
                return Card(
                  child: ListTile(
                    title: Text(project.description!),
                    onTap: () {
                      ref
                          .read(currentProjectP.notifier)
                          .update((state) => state = project);

                      ref.read(routerP).replaceNamed(Routes.home);
                    },
                  ),
                );
              },
            ),
          ),
    );
  }
}
