import 'dart:async';
import 'dart:math' as math;

import 'package:carium/acarium_flame_game.dart';
import 'package:flame/components.dart';

enum FishType { fish1, fish2 }

class Fish extends SpriteGroupComponent with HasGameRef<Acarium> {
  double accumulateTime = 0;
  double fixedDeltaTime = 1 / 60;
  Vector2 velocity = Vector2.zero();
  double direction = 0.0;
  double horizontalMovement = 1;
  double moveSpeed = 100;

  Fish({required position, required this.direction})
      : super(position: position);

  @override
  FutureOr<void> onLoad() {
    final sprite = Sprite(game.images.fromCache('fish1.png'));

    sprites = {
      FishType.fish1: sprite,
    };
    current = FishType.fish1;
    if (direction >= 90 && direction <= 270) {
      flipVertically();
    }
    add(TextComponent(text: direction.toString(), scale: Vector2(2, 2)));
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
    transform.angleDegrees = direction;

    velocity.x = ((moveSpeed) * (math.cos(transform.angle)));
    velocity.y = ((moveSpeed) * (math.sin(transform.angle)));
    // velocity.y =  moveSpeed * direction.y;
    position.x -= velocity.x * dt;
    position.y -= velocity.y * dt;
    // position.y += velocity.y * dt * transform.angle;
    // position.y += velocity.y * dt;
  }
}
