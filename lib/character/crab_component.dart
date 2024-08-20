import 'dart:async';

import 'package:carium/acarium_flame_game.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';

enum CrabState { idle, move }

class CrabComponent extends SpriteAnimationGroupComponent
    with HasGameRef<Acarium>, TapCallbacks {
  @override
  FutureOr<void> onLoad() async {
    final idleSprite = await game.loadSpriteAnimation(
        'anim/crab_idle.png',
        SpriteAnimationData.sequenced(
            amount: 4, stepTime: 0.3, textureSize: Vector2.all(270)));
    final moveSprite = await game.loadSpriteAnimation(
        'anim/crab_move.png',
        SpriteAnimationData.sequenced(
            amount: 4, stepTime: 0.3, textureSize: Vector2.all(270)));
    animations = {
      CrabState.move: moveSprite,
      CrabState.idle: idleSprite,
    };

    current = CrabState.move;
    position = Vector2(game.size.x - 500, game.size.y - 500);
    // scale = Vector2.all(2);
    return super.onLoad();
  }

  @override
  void onTapDown(TapDownEvent event) {
    current = current == CrabState.move ? CrabState.idle : CrabState.move;
    super.onTapDown(event);
  }

  @override
  void update(double dt) {
    if (current == CrabState.move) {
      x -= dt * 200;
    }
    super.update(dt);
  }
}
