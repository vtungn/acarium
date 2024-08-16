import 'dart:async';

import 'package:carium/domain/index.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';

class QuestDialog extends PositionComponent with TapCallbacks {
  final QuestModel quest;

  QuestDialog({required this.quest});
  @override
  FutureOr<void> onLoad() {
    // TODO: implement onLoad
    return super.onLoad();
  }
}
