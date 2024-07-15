import 'package:appflowy_board/appflowy_board.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GroupHeader extends ConsumerWidget {
  const GroupHeader({
    super.key,
    required this.controller,
    required this.config,
    required this.columnData,
  });

  final AppFlowyBoardController controller;
  final AppFlowyBoardConfig config;
  final AppFlowyGroupData<dynamic> columnData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppFlowyGroupHeader(
      //icon: const Icon(Icons.lightbulb_circle),
      title: SizedBox(
        width: 60,
        child: TextField(
          controller: TextEditingController()
            ..text = columnData.headerData.groupName,
          onSubmitted: (val) {
            controller
                .getGroupController(columnData.headerData.groupId)!
                .updateGroupName(val);
          },
        ),
      ),
      addIcon: const Icon(Icons.add, size: 20),
      moreIcon: const Icon(Icons.more_horiz, size: 20),
      height: 50,
      margin: config.groupBodyPadding,
    );
  }
}
