import 'dart:async';
import 'dart:math' as math;

import 'package:carium/acarium_flame_game.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

enum FishType { fish1, fish2 }

class Fish extends SpriteComponent
    with HasGameRef<Acarium>, CollisionCallbacks {
  double accumulateTime = 0;
  double fixedDeltaTime = 1 / 60;
  Vector2 velocity = Vector2.zero();
  double direction = 0.0;
  Vector2 directionVector;
  double horizontalMovement = 1;
  double moveSpeed = 500;
  double scaleFactor = 1;
  double separationRadius = 600;
  double updateDirection = 0;
  Vector2 steerFactor = Vector2.zero();

  Fish(
      {required position,
      required this.directionVector,
      required this.scaleFactor})
      : super(position: position);

  @override
  FutureOr<void> onLoad() {
    sprite = Sprite(game.images.fromCache('fish1.png'));
    scale = Vector2.all(2);

    // if (direction >= 90 && direction <= 270) {
    //   flipVertically();
    // }
    anchor = Anchor.center;
    // transform.angle = -math.atan2(directionVector.x, directionVector.y);

    // transform.angleDegrees = direction;
    // updateDirection = transform.angle;
    add(CircleHitbox(
      radius: separationRadius,
      anchor: Anchor.center,
      position: Vector2(size.x / 2, size.y / 2),
      collisionType: CollisionType.active,
      // anchor: Anchor.center,
    ));

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
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    // if (other is TankComponent) {
    //   print('hit');
    //   updateDirection = transform.angle + math.pi / 2;
    // }
    super.onCollisionStart(intersectionPoints, other);
  }

  Vector2 separation(List<PositionComponent> boids,
      {double minDistance = 500}) {
    var separation = Vector2.zero();
    for (var boid in boids) {
      var lineBtw = position - boid.position;
      final distance = math.Point(lineBtw.x, lineBtw.y).magnitude;
      lineBtw = lineBtw.normalized();
      if (distance < minDistance && distance != 0) {
        // print(distance);
        final ratio = (distance / separationRadius).clamp(0, 0.05).toDouble();
        // here the vector2
        separation += lineBtw * ratio;
        // separation += lineBtw * 0.01;
        // separation
        // print(separation);
        // updateDirection = separation.angleTo(Vector2(1, 0));
      }
    }
    // separation = separation.normalized();
    // final newDirection = velocity + separation;
    // separation = separation.normalized();
    // print(separation);
    final newDirection = directionVector + separation;
    directionVector = newDirection.normalized();

    // print(velocity.angleTo(Vector2(1, 0)));
    // print(updateDirection);
    // print(velocity);
    // updateDirection = velocity.angleTo(Vector2(1, 0));
    return separation;
  }

  _onMove(double dt) {
    // transform.angleDegrees = 45;
    // print(math.atan2(1, 1));
    // print(transform.angle);
    // print(math.pi / 4);
    // transform.angle = updateDirection;
    // print(transform.angle);
    // velocity.x = ((moveSpeed) * (math.cos(transform.angle)));
    // velocity.y = ((moveSpeed) * (math.sin(transform.angle)));
    velocity.x = ((moveSpeed) * directionVector.x);
    velocity.y = ((moveSpeed) * directionVector.y);
    transform.angle = math.atan2(velocity.y, velocity.x);
    position.x += velocity.x * dt;
    position.y += velocity.y * dt;
    // print(velocity.angleTo(Vector2(1, 0)));
    // position.y += velocity.y * dt * transform.angle;
    // position.y += velocity.y * dt;
  }
}
