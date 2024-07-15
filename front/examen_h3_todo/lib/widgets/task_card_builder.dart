import 'package:examen_h3_todo/widgets/rich_text_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskCardBuilder extends ConsumerStatefulWidget {
  final dynamic item;

  const TaskCardBuilder({required this.item, super.key});

  @override
  ConsumerState<TaskCardBuilder> createState() => _TaskCardBuilderState();
}

class _TaskCardBuilderState extends ConsumerState<TaskCardBuilder> {
  @override
  Widget build(BuildContext context) {
    final richItem = widget.item as RichTextItem;

    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              richItem.title,
              style: const TextStyle(fontSize: 14),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 10),
            Text(
              richItem.subtitle,
              style: const TextStyle(fontSize: 12, color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
