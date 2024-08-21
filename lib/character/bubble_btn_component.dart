import 'dart:async';

import 'package:carium/acarium_flame_game.dart';
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
            fontSize: 128,
            color: Colors.black,
          ),
        ),
        position: Vector2(200, 200),
        size: Vector2.all(100),
        text: '**');
    add(timerText);
    return super.onLoad();
  }

  @override
  void onTapUp(TapUpEvent event) {
    game.overlays.add('quest');
    super.onTapUp(event);
  }

  @override
  void update(double dt) {
    if (game.currentQuest != null && game.timer != null) {
      var currentTimer = game.timer!.timer.current;
      timerText.text =
          (game.currentQuest!.questTimeSec - currentTimer.toInt()).toString();
    }
    super.update(dt);
  }
}
