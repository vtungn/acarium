import 'dart:async';

import 'package:carium/acarium_flame_game.dart';
import 'package:flame/components.dart';

enum CrabState { idle, move }

class CrabComponent extends SpriteAnimationGroupComponent
    with HasGameRef<Acarium> {
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
    position = Vector2.all(100);

    return super.onLoad();
  }
}
