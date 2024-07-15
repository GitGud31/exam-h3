import 'package:examen_h3_todo/widgets/card_builder.dart';
import 'package:examen_h3_todo/widgets/group_footer.dart';
import 'package:examen_h3_todo/widgets/group_header.dart';
import 'package:examen_h3_todo/widgets/rich_text_item.dart';
import 'package:examen_h3_todo/widgets/text_item.dart';

import 'package:flutter/material.dart';
import 'package:appflowy_board/appflowy_board.dart';

class TaskBoardBuilder extends StatefulWidget {
  const TaskBoardBuilder({super.key});

  @override
  State<TaskBoardBuilder> createState() => _TaskBoardBuilderState();
}

class _TaskBoardBuilderState extends State<TaskBoardBuilder> {
  final AppFlowyBoardController controller = AppFlowyBoardController(
    onMoveGroup: (fromGroupId, fromIndex, toGroupId, toIndex) {
      debugPrint('Move item from $fromIndex to $toIndex');
    },
    onMoveGroupItem: (groupId, fromIndex, toIndex) {
      debugPrint('Move $groupId:$fromIndex to $groupId:$toIndex');
    },
    onMoveGroupItemToGroup: (fromGroupId, fromIndex, toGroupId, toIndex) {
      debugPrint('Move $fromGroupId:$fromIndex to $toGroupId:$toIndex');
    },
  );

  final config = const AppFlowyBoardConfig(
    groupBackgroundColor: Colors.white,
    stretchGroupHeight: false,
  );

  late AppFlowyBoardScrollController boardController;

  @override
  void initState() {
    super.initState();
    boardController = AppFlowyBoardScrollController();

    final todoGroup = AppFlowyGroupData(
      id: "To Do",
      name: "To Do",
      items: [
        TextItem("Card 1"),
        TextItem("Card 2"),
        RichTextItem(title: "Card 3", subtitle: 'Aug 1, 2020 4:05 PM'),
        TextItem("Card 4"),
        TextItem("Card 5"),
      ],
    );

    final inProgressGroup = AppFlowyGroupData(
      id: "In Progress",
      name: "In Progress",
      items: <AppFlowyGroupItem>[
        TextItem("Card 6"),
        RichTextItem(title: "Card 7", subtitle: 'Aug 1, 2020 4:05 PM'),
        RichTextItem(title: "Card 8", subtitle: 'Aug 1, 2020 4:05 PM'),
      ],
    );

    final doneGroup = AppFlowyGroupData(
      id: "Done",
      name: "Done",
      items: <AppFlowyGroupItem>[
        TextItem("Card 9"),
        RichTextItem(
          title: "Card 10",
          subtitle: 'Aug 1, 2020 4:05 PM',
        ),
        TextItem("Card 11"),
        TextItem("Card 12"),
      ],
    );

    controller.addGroup(todoGroup);
    controller.addGroup(inProgressGroup);
    controller.addGroup(doneGroup);
  }

  @override
  Widget build(BuildContext context) {
    return AppFlowyBoard(
      controller: controller,
      boardScrollController: boardController,
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
        controller: controller,
        config: config,
        columnData: columnData,
      ),

      //footer
      footerBuilder: (_, columnData) => GroupFooter(
        config: config,
        boardController: boardController,
        columnData: columnData,
      ),
    );
  }
}
