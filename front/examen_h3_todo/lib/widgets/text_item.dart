import 'package:appflowy_board/appflowy_board.dart';

///* AppFlowyGroupItem that displays the title in a card.
class TextItem extends AppFlowyGroupItem {
  final String s;

  TextItem(this.s);

  @override
  String get id => s;
}
