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
      margin: config.groupBodyPadding,
      title: Container(
        padding: const EdgeInsets.all(8),
        child: Text(
          columnData.headerData.groupName,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
