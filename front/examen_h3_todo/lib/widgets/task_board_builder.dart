import 'package:examen_h3_todo/api/swagger.enums.swagger.dart';
import 'package:examen_h3_todo/consts/colors.dart';
import 'package:examen_h3_todo/controllers/board_controller.dart';
import 'package:examen_h3_todo/controllers/board_scroll_controller.dart';
import 'package:examen_h3_todo/controllers/task_controller.dart';
import 'package:examen_h3_todo/widgets/card_builder.dart';
import 'package:examen_h3_todo/widgets/group_footer.dart';
import 'package:examen_h3_todo/widgets/group_header.dart';
import 'package:examen_h3_todo/widgets/task_card_item.dart';

import 'package:flutter/material.dart';
import 'package:appflowy_board/appflowy_board.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskBoardBuilder extends ConsumerStatefulWidget {
  const TaskBoardBuilder({super.key});

  @override
  ConsumerState<TaskBoardBuilder> createState() => _TaskBoardBuilderState();
}

class _TaskBoardBuilderState extends ConsumerState<TaskBoardBuilder> {
  final config = const AppFlowyBoardConfig(
    groupBackgroundColor: white,
    stretchGroupHeight: false,
  );

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setupTasks());
  }

  void setupTasks() {
    final todoTasks = <AppFlowyGroupItem>[];
    final inProgessTasks = <AppFlowyGroupItem>[];
    final doneTasks = <AppFlowyGroupItem>[];

    final tasks = ref.read(tasksListP);
    for (final task in tasks!) {
      if (task.state == TaskDtoState.todo) {
        todoTasks.add(TaskCardItem(task));
      }
      if (task.state == TaskDtoState.inProgress) {
        inProgessTasks.add(TaskCardItem(task));
      }
      if (task.state == TaskDtoState.done) {
        doneTasks.add(TaskCardItem(task));
      }
    }

    ref.read(boardControllerP).addGroup(AppFlowyGroupData(
          id: "To Do",
          name: "To Do",
          items: todoTasks,
        ));
    ref.read(boardControllerP).addGroup(AppFlowyGroupData(
          id: "In Progress",
          name: "In Progress",
          items: inProgessTasks,
        ));
    ref.read(boardControllerP).addGroup(AppFlowyGroupData(
          id: "Done",
          name: "Done",
          items: doneTasks,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return AppFlowyBoard(
      controller: ref.watch(boardControllerP),
      boardScrollController: ref.read(boardScrollControllerP),
      config: config,
      groupConstraints: BoxConstraints.tightFor(
        width: MediaQuery.sizeOf(context).width * 0.3,
      ),

      cardBuilder: (context, group, groupItem) => AppFlowyGroupCard(
        key: ValueKey(groupItem.id),
        child: CardBuilder(item: groupItem),
      ),

      //header
      headerBuilder: (_, columnData) => GroupHeader(
        config: config,
        columnData: columnData,
      ),

      //footer
      footerBuilder: (_, columnData) => GroupFooter(
        config: config,
        columnData: columnData,
      ),
    );
  }
}
