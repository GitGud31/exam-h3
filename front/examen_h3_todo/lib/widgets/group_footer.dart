import 'package:appflowy_board/appflowy_board.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GroupFooter extends ConsumerWidget {
  const GroupFooter({
    super.key,
    required this.config,
    required this.boardController,
    required this.columnData,
  });

  final AppFlowyBoardConfig config;
  final AppFlowyBoardScrollController boardController;
  final AppFlowyGroupData<dynamic> columnData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppFlowyGroupFooter(
      icon: const Icon(Icons.add, size: 20),
      title: const Text('Add task'),
      height: 50,
      margin: config.groupBodyPadding,
      onAddButtonClick: () => boardController.scrollToBottom(columnData.id),
    );
  }
}
