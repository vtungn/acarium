import 'dart:async';

import 'package:carium/acarium_flame_game.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class Shark extends SpriteAnimationGroupComponent
    with HasGameRef<Acarium>, CollisionCallbacks {
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
  @override
  FutureOr<void> onLoad() {
    final sprite = Sprite(game.images.fromCache('shark.png'));
    current = sprite;
    return super.onLoad();
  }
}
