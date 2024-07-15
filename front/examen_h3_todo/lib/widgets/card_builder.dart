import 'package:appflowy_board/appflowy_board.dart';
import 'package:examen_h3_todo/widgets/rich_text_item.dart';
import 'package:examen_h3_todo/widgets/task_card_builder.dart';
import 'package:examen_h3_todo/widgets/text_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardBuilder extends ConsumerWidget {
  const CardBuilder({
    super.key,
    required this.item,
  });

  final AppFlowyGroupItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // card with title only.
    if (item is TextItem) {
      return Card(
        color: Colors.blueGrey.shade100,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Text(
              item.id,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
      );
    }

    // card with title and date.
    if (item is RichTextItem) {
      return Card(
        color: Colors.blueGrey.shade300,
        child: TaskCardBuilder(item: item),
      );
    }

    throw UnimplementedError();
  }
}
