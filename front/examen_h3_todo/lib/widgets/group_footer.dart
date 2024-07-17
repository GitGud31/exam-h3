import 'package:appflowy_board/appflowy_board.dart';
import 'package:auto_route/auto_route.dart';
import 'package:examen_h3_todo/api/swagger.models.swagger.dart';
import 'package:examen_h3_todo/controllers/board_controller.dart';
import 'package:examen_h3_todo/controllers/board_scroll_controller.dart';
import 'package:examen_h3_todo/controllers/project_controller.dart';
import 'package:examen_h3_todo/controllers/task_controller.dart';
import 'package:examen_h3_todo/extensions/exntesion_on_void.dart';
import 'package:examen_h3_todo/utils/snackbar_utils.dart';
import 'package:examen_h3_todo/widgets/task_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GroupFooter extends ConsumerWidget {
  const GroupFooter({
    super.key,
    required this.config,
    required this.columnData,
  });

  final AppFlowyBoardConfig config;
  final AppFlowyGroupData<dynamic> columnData;

  void addTask(BuildContext context, WidgetRef ref,
      AppFlowyGroupData<dynamic> columnData) async {
    final TextEditingController taskController = TextEditingController();

    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Add New Task'),
        backgroundColor: Colors.white,
        content: TextField(
          controller: taskController,
          decoration: const InputDecoration(hintText: 'Enter task name'),
        ),
        actions: <Widget>[
          // cancel button
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => context.maybePop(),
          ),

          // add button
          TextButton(
            child: const Text('Add'),
            onPressed: () {
              final newTaskName = taskController.text.trim();

              if (newTaskName.isNotEmpty) {
                final newTask = TaskDto(
                  title: newTaskName,
                  state: taskDtoState(columnData.id),
                  subTasks: [],
                  createdAt: DateTime.now(),
                  description: "",
                );

                ref.read(asyncTaskCrudP.notifier).createTask(
                      ref.read(currentProjectP)!.id!,
                      newTask,
                    );

                ref
                    .read(boardControllerP)
                    .addGroupItem(columnData.id, TaskCardItem(newTask));

                WidgetsBinding.instance.addPostFrameCallback((_) {
                  ref
                      .read(boardScrollControllerP)
                      .scrollToBottom(columnData.id);
                });

                taskController.clear();

                context.maybePop();
              } else {
                Bar.error(ref, context, "Task name cannot be empty");
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: AppFlowyGroupFooter(
        height: 50,
        margin: config.groupBodyPadding,
        icon: const Icon(Icons.add, size: 20),
        title: const Text(
          'Add task',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
        onAddButtonClick: () => addTask(context, ref, columnData),
      ),
    );
  }
}
