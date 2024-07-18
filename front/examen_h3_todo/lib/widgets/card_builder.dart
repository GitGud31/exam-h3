import 'package:appflowy_board/appflowy_board.dart';
import 'package:examen_h3_todo/consts/colors.dart';
import 'package:examen_h3_todo/controllers/task_controller.dart';
import 'package:examen_h3_todo/routing/router.dart';
import 'package:examen_h3_todo/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardBuilder extends ConsumerWidget {
  const CardBuilder({super.key, required this.item});

  final AppFlowyGroupItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      child: Card(
        elevation: 3,
        color: Colors.blueGrey.shade100,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Text(
              item.id,
              style: const TextStyle(color: black),
            ),
          ),
        ),
      ),
      onTap: () async {
        final selectedTask =
            ref.read(tasksListP)!.firstWhere((task) => task.title == item.id);

        ref.read(currentTaskP.notifier).state = selectedTask;

        ref.read(routerP).navigateNamed(Routes.editTask);
      },
    );
  }
}
