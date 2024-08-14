import 'dart:async';
import 'dart:math' as math;

import 'package:carium/acarium_flame_game.dart';
import 'package:carium/config/constants.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';

class Shark extends SpriteComponent
    with HasGameReference<Acarium>, CollisionCallbacks, DragCallbacks {
  double accumulateTime = 0;
  double fixedDeltaTime = 1 / 60;
  Vector2 velocity = Vector2.zero();
  double direction = 0.0;
  double horizontalMovement = 1;
  double moveSpeed = 900;
  double scaleFactor = 1;
  double separationRadius = 600;
  double updateDirection = 0;
  Vector2 steerFactor = Vector2.zero();
  Vector2 directionVector = Vector2(1, 1);
  @override
  FutureOr<void> onLoad() {
    sprite = Sprite(game.images.fromCache('shark.png'));
    // current = sprite;
    scale = Vector2.all(3);

    anchor = Anchor.center;
    return super.onLoad();
  }

  @override
  void update(double dt) {
    accumulateTime += dt;
    while (accumulateTime >= fixedDeltaTime) {
      _onMove(dt);
      accumulateTime -= fixedDeltaTime;
    }
    // hungerDrain(dt);
    super.update(dt);
  }

  _onMove(double dt) {
    velocity.x = ((moveSpeed) * directionVector.x);
    velocity.y = ((moveSpeed) * directionVector.y);
    transform.angle = math.atan2(velocity.y, velocity.x);
    _tankBoundary();
    position.x += velocity.x * dt;
    position.y += velocity.y * dt;
    if (velocity.x < 0 && !isFlippedVertically) {
      flipVertically();
    } else if (velocity.x > 0 && isFlippedVertically) {
      flipVertically();
    }
  }

  _tankBoundary() {
    if (position.x < tankBoundaryMargin) {
      // velocity.x += turnFactor;
      final newDirection = directionVector + Vector2(1, 0);
      directionVector = newDirection.normalized();
    }
    if (position.x > tvWidth - tankBoundaryMargin) {
      final newDirection = directionVector + Vector2(-1, 0);
      directionVector = newDirection.normalized();
    }
    if (position.y < tankBoundaryMargin) {
      final newDirection = directionVector + Vector2(0, 1);
      directionVector = newDirection.normalized();
    }
    if (position.y > tvHeight - tankBoundaryMargin) {
      final newDirection = directionVector + Vector2(0, -1);
      directionVector = newDirection.normalized();
    }
  }
}
