import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class TankComponent extends PositionComponent with CollisionCallbacks {
  @override
  FutureOr<void> onLoad() {
    // add(RectangleHitbox(
    //   position: Vector2(0, 0),
    //   size: Vector2(1, 2160),
    //   collisionType: CollisionType.passive,
    // ));
    // add(RectangleHitbox(
    //   position: Vector2(0, 0),
    //   size: Vector2(3840, 1),
    //   collisionType: CollisionType.passive,
    // ));
    // add(RectangleHitbox(
    //   position: Vector2(0, 2160),
    //   size: Vector2(3840, 1),
    //   collisionType: CollisionType.passive,
    // ));
    // add(RectangleHitbox(
    //   position: Vector2(3840, 0),
    //   size: Vector2(1, 2160),
    //   collisionType: CollisionType.passive,
    // ));
    add(RectangleHitbox(
      position: Vector2(0, 0),
      size: Vector2(3840, 2160),
      // collisionType: CollisionType.passive,
    ));
    debugMode = true;
    return super.onLoad();
  }
}
