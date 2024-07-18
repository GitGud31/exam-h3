// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:examen_h3_todo/api/swagger.enums.swagger.dart';
import 'package:examen_h3_todo/api/swagger.models.swagger.dart';
import 'package:examen_h3_todo/consts/colors.dart';
import 'package:examen_h3_todo/controllers/task_controller.dart';
import 'package:examen_h3_todo/logger.dart';
import 'package:examen_h3_todo/utils/snackbar_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

@RoutePage()
class EditTaskScreen extends ConsumerStatefulWidget {
  const EditTaskScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends ConsumerState<EditTaskScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TaskDtoPriority _priority;
  late int selectedPriority = 1;
  late DateTime _deadline;
  late List<SubTaskDto> _subTasks;

  @override
  void initState() {
    super.initState();

    final currentTask = ref.read(currentTaskP);

    _titleController = TextEditingController(text: currentTask!.title);
    _descriptionController =
        TextEditingController(text: currentTask.description);

    selectedPriority =
        currentTask.priority == null ? 1 : currentTask.priority!.index;
    _priority = currentTask.priority ?? TaskDtoPriority.low;

    _deadline = currentTask.deadline ?? DateTime.now();

    _subTasks = currentTask.subTasks ?? [];
  }

  void _selectDate(BuildContext context) async {
    final DateTime now = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      (picked.isBefore(now))
          ? Bar.error(ref, context, "Please select a date in the future.")
          : setState(() => _deadline = picked);
    }
  }

  void _showDeleteConfirmationDialog(BuildContext context) async {
    final currentTask = ref.read(currentTaskP);

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Deletion'),
          content: const Text('Are you sure you want to delete this project?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => context.maybePop(),
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () async {
                final result = await ref
                    .read(asyncTaskCrudP.notifier)
                    .deleteTask(currentTask!.id!);

                if (result) {
                  Bar.success(ref, context, "Task deleted successfully");
                  context.maybePop();
                } else {
                  Bar.error(ref, context, "Couldn't delete task");
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Task"),
        centerTitle: true,
        actions: [
          // submit edit task
          TextButton.icon(
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(black),
                shape: WidgetStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)))),
            icon: const Icon(Icons.edit, color: white),
            label: const Text("Edit Task", style: TextStyle(color: white)),
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                L.debug(
                  "Edit Task",
                  "title: ${_titleController.text}, description: ${_descriptionController.text}, priority: $_priority, deadline: $_deadline",
                );

                final result =
                    await ref.read(asyncTaskCrudP.notifier).updateTask(
                          ref.read(currentTaskP)!.id!,
                          TaskDto(
                            id: ref.read(currentTaskP)!.id,
                            title: _titleController.text,
                            description: _descriptionController.text,
                            priority: _priority,
                            deadline: _deadline,
                            version: ref.read(currentTaskP)!.version!,

                            //TODO
                            subTasks: [],
                          ),
                        );

                if (result) {
                  Bar.success(ref, context, "Task updated successfully");
                  await ref.read(asyncTaskCrudP.notifier).getAllTasks();

                  context.maybePop();
                } else {
                  Bar.error(ref, context, "Couldn't update task");
                }
              }
            },
          ),

          const Gap(5),

          // delete task
          TextButton.icon(
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(lightRed),
                shape: WidgetStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)))),
            icon: const Icon(Icons.delete, color: white),
            label: const Text("Delete Task", style: TextStyle(color: white)),
            onPressed: () => _showDeleteConfirmationDialog(context),
          ),

          const Gap(64),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(64),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // title
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),

              const Gap(20),

              // description
              TextFormField(
                controller: _descriptionController,
                minLines: 3,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
              ),

              const Gap(20),

              // priority
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Priority',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Gap(10),
                  Wrap(
                    spacing: 5.0,
                    children: List<Widget>.generate(3, (i) {
                      final index = i + 1;
                      final taskPriority = TaskDtoPriority.values[index];

                      return ChoiceChip(
                        label: Text(taskPriority.name),
                        selected: selectedPriority == index,
                        onSelected: (selected) => setState(() {
                          if (selected) {
                            _priority = taskPriority;
                            selectedPriority = index;
                          }
                        }),
                      );
                    }).toList(),
                  ),
                ],
              ),

              const Gap(20),

              // deadline
              ListTile(
                minLeadingWidth: 0,
                contentPadding: EdgeInsets.zero,
                title: Row(
                  children: [
                    const Text(
                      'Deadline : ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${_deadline.year}/${_deadline.month}/${_deadline.day}',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context),
                ),
              ),

              //sub tasks
              /* Expanded(
                flex: 1,
                child: Column(
                  children: [
                    const Text(
                      "Subtasks",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Gap(10),
                    Expanded(
                      flex: 1,
                      child: ListView.builder(
                        itemCount: _subTasks.length,
                        itemBuilder: (_, index) {
                          return CheckboxListTile(
                            value: false,
                            onChanged: (selected) {},
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ), */
            ],
          ),
        ),
      ),
    );
  }
}
