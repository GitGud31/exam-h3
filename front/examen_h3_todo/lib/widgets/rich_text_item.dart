import 'package:appflowy_board/appflowy_board.dart';

///* AppFlowyGroupItem that displays the title and deadline in a card.
class RichTextItem extends AppFlowyGroupItem {
  final String title;
  final String subtitle;

  RichTextItem({required this.title, required this.subtitle});

  @override
  String get id => title;
}
