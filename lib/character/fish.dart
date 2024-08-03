import 'dart:async';
import 'dart:math' as math;

import 'package:carium/acarium_flame_game.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

enum FishType { fish1, fish2 }

class Fish extends SpriteGroupComponent
    with HasGameRef<Acarium>, CollisionCallbacks {
  double accumulateTime = 0;
  double fixedDeltaTime = 1 / 60;
  Vector2 velocity = Vector2.zero();
  double direction = 0.0;
  double horizontalMovement = 1;
  double moveSpeed = 100;
  double scaleFactor = 1;
  double separationRadius = 1000;
  double updateDirection = 0;
  Vector2 updateDirection2 = Vector2.zero();

  Fish({required position, required this.direction, required this.scaleFactor})
      : super(position: position);

  @override
  FutureOr<void> onLoad() {
    final sprite = Sprite(game.images.fromCache('fish1.png'));
    scale = Vector2.all(0.2);
    // scale = 0.2;
    sprites = {
      FishType.fish1: sprite,
    };
    current = FishType.fish1;
    if (direction >= 90 && direction <= 270) {
      flipVertically();
    }
    updateDirection = direction;
    // anchor = Anchor.topCenter;
    transform.angleDegrees = direction;
    add(CircleHitbox(
      radius: separationRadius,
      anchor: Anchor.center,
      position: Vector2(size.x / 2, size.y / 2),
      collisionType: CollisionType.active,
      // anchor: Anchor.center,
    ));
    // add(RectangleHitbox(position: Vector2(10, 10), size: Vector2(10, 10)));
    //   radius: 2,
    //   position: Vector2.all(100),
    //   // isSolid: true,
    //   collisionType: CollisionType.active,
    // ));
    // debugMode = true;
    // add(CircleComponent(
    //     radius: 100, position: Vector2.all(100), anchor: Anchor.center));
    // add(CircleHitbox(radius: 100, position: Vector2.all(100)));
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

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    final lineBtw = position - other.position;
    final ratio =
        (math.Point(lineBtw.x, lineBtw.y).magnitude / separationRadius)
            .clamp(0, 1)
            .toDouble();
    updateDirection2 -= lineBtw * ratio;
    // updateDirection2 = updateDirection2.normalized();
    updateDirection = updateDirection2.angleTo(Vector2(1, 0));

    super.onCollision(intersectionPoints, other);
  }

  _onMove(double dt) {
    transform.angle = updateDirection;
    velocity.x = ((moveSpeed) * (math.cos(transform.angle)));
    velocity.y = ((moveSpeed) * (math.sin(transform.angle)));
    position.x -= velocity.x * dt;
    position.y -= velocity.y * dt;
    // position.y += velocity.y * dt * transform.angle;
    // position.y += velocity.y * dt;
  }
}
