import 'package:appflowy_board/appflowy_board.dart';
import 'package:examen_h3_todo/logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final boardControllerP = Provider<AppFlowyBoardController>((ref) {
  return AppFlowyBoardController(
    onMoveGroup: (fromGroupId, fromIndex, toGroupId, toIndex) {
      L.debug("onMoveGroup", 'Move item from $fromIndex to $toIndex');
    },
    onMoveGroupItem: (groupId, fromIndex, toIndex) {
      L.debug(
          "onMoveGroupItem", 'Move $groupId:$fromIndex to $groupId:$toIndex');
    },
    onMoveGroupItemToGroup: (fromGroupId, fromIndex, toGroupId, toIndex) {
      L.debug("onMoveGroupItemToGroup",
          'Move $fromGroupId:$fromIndex to $toGroupId:$toIndex');
    },
  );
});
