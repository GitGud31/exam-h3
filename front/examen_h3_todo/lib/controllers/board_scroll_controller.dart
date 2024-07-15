import 'package:appflowy_board/appflowy_board.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final boardScrollControllerP = Provider<AppFlowyBoardScrollController>(
    (_) => AppFlowyBoardScrollController());
