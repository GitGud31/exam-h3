import 'package:examen_h3_todo/consts/colors.dart';
import 'package:examen_h3_todo/controllers/board_controller.dart';
import 'package:examen_h3_todo/controllers/board_scroll_controller.dart';
import 'package:examen_h3_todo/dummy/data.dart';
import 'package:examen_h3_todo/widgets/card_builder.dart';
import 'package:examen_h3_todo/widgets/group_footer.dart';
import 'package:examen_h3_todo/widgets/group_header.dart';

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

    ref.read(boardControllerP).addGroup(todoGroup);
    ref.read(boardControllerP).addGroup(inProgressGroup);
    ref.read(boardControllerP).addGroup(doneGroup);
  }

  @override
  Widget build(BuildContext context) {
    return AppFlowyBoard(
      controller: ref.read(boardControllerP),
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
