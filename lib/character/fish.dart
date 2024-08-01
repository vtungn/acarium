import 'dart:async';

import 'package:carium/acarium_flame_game.dart';
import 'package:flame/components.dart';

enum FishType { fish1, fish2 }

class Fish extends SpriteGroupComponent with HasGameRef<Acarium> {
  double accumulateTime = 0;
  double fixedDeltaTime = 1 / 60;
  Vector2 velocity = Vector2.zero();
  double horizontalMovement = 1;
  double moveSpeed = 100;

  @override
  FutureOr<void> onLoad() {
    final sprite = Sprite(game.images.fromCache('fish1.png'));

    sprites = {
      FishType.fish1: sprite,
    };
    current = FishType.fish1;
    return super.onLoad();
  }

  @override
  void update(double dt) {
    accumulateTime += dt;
    while (accumulateTime >= fixedDeltaTime) {
      _onMove(dt);
      accumulateTime -= fixedDeltaTime;
    }
    super.update(dt);
  }

  _onMove(double dt) {
    velocity.x = horizontalMovement * moveSpeed;
    position.x += velocity.x * dt;
  }
}
