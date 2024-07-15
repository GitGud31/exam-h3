import 'package:appflowy_board/appflowy_board.dart';
import 'package:examen_h3_todo/widgets/rich_text_item.dart';
import 'package:examen_h3_todo/widgets/text_item.dart';

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
