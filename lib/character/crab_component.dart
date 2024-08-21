import 'dart:async';

import 'package:carium/acarium_flame_game.dart';
import 'package:carium/character/bubble_btn_component.dart';
import 'package:carium/config/constants.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';

enum CrabState { idle, move }

class CrabComponent extends SpriteAnimationGroupComponent
    with HasGameRef<Acarium>, TapCallbacks {
  Vector2 directionVector = Vector2.zero();
  @override
  FutureOr<void> onLoad() async {
    final idleSprite = await game.loadSpriteAnimation(
        'anim/crab_idle.png',
        SpriteAnimationData.sequenced(
            amount: 4, stepTime: 0.3, textureSize: Vector2.all(135)));
    final moveSprite = await game.loadSpriteAnimation(
        'anim/crab_move.png',
        SpriteAnimationData.sequenced(
            amount: 4, stepTime: 0.3, textureSize: Vector2.all(135)));
    animations = {
      CrabState.move: moveSprite,
      CrabState.idle: idleSprite,
    };

    current = CrabState.move;
    position = Vector2(game.size.x - 200, game.size.y - 200);
    directionVector = Vector2(-1, 0);

    // add(Spribtn)
    return super.onLoad();
  }

  @override
  void onTapDown(TapDownEvent event) {
    current = current == CrabState.move ? CrabState.idle : CrabState.move;
    if (current == CrabState.idle) {
      add(BubbleBtnComponent(
        position: Vector2(-230, -230),
      ));
    } else {
      removeWhere((com) => com is BubbleBtnComponent);
    }
    super.onTapDown(event);
  }

  _tankBoundary() {
    if (x < 0) {
      // velocity.x += turnFactor;
      final newDirection = directionVector + Vector2(1, 0);
      directionVector = newDirection.normalized();
    }
    if (x > tvWidth - size.x) {
      final newDirection = directionVector + Vector2(-1, 0);
      directionVector = newDirection.normalized();
    }
  }

  @override
  void update(double dt) {
    _tankBoundary();
    if (current == CrabState.move) {
      x += dt * directionVector.x * 500;
    }
    super.update(dt);
  }
}
