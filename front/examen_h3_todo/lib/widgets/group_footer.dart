import 'package:appflowy_board/appflowy_board.dart';
import 'package:examen_h3_todo/controllers/board_controller.dart';
import 'package:examen_h3_todo/controllers/board_scroll_controller.dart';
import 'package:examen_h3_todo/widgets/text_item.dart';
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
        onAddButtonClick: () {
          ref.read(boardScrollControllerP).scrollToBottom(columnData.id);

          ref
              .read(boardControllerP)
              .addGroupItem(columnData.id, TextItem(UniqueKey().toString()));
        },
      ),
    );
  }
}
