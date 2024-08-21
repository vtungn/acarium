import 'dart:async';

import 'package:carium/acarium_flame_game.dart';
import 'package:carium/quest/quest_mixin.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/text.dart';
import 'package:flutter/material.dart';

class BubbleBtnComponent extends SpriteComponent
    with HasGameRef<Acarium>, TapCallbacks {
  BubbleBtnComponent({required super.position});
  late TextComponent timerText;
  @override
  FutureOr<void> onLoad() {
    sprite = Sprite(game.images.fromCache('speech.png'));
    timerText = TextComponent(
        textRenderer: TextPaint(
          style: const TextStyle(
            fontSize: 62,
            color: Colors.black,
          ),
        ),
        position: Vector2(100, 100),
        text: '👋');
    add(timerText);
    return super.onLoad();
  }

  @override
  void onTapUp(TapUpEvent event) {
    if (game.qState == QuestState.idle || game.qState == QuestState.questSkip) {
      game.overlays.add('quest');
    } else if (game.qState == QuestState.questSuccess) {
      game.overlays.add('quest_success');
    }
    super.onTapUp(event);
  }

  @override
  void update(double dt) {
    if (game.qState == QuestState.questStarted &&
        game.currentQuest != null &&
        game.timer != null) {
      var currentTimer = game.timer!.timer.current;
      timerText.text =
          (game.currentQuest!.questTimeSec - currentTimer.toInt()).toString();
    } else if (game.qState == QuestState.questSuccess) {
      timerText.text = '🏆';
    } else if (game.qState == QuestState.questSkip) {
      timerText.text = '⏭️';
    }
    super.update(dt);
  }
}
