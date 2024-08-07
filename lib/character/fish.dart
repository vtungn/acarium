import 'dart:async';
import 'dart:math' as math;

import 'package:carium/acarium_flame_game.dart';
import 'package:carium/config/constants.dart';
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
      // final distance = math.Point(lineBtw.x, lineBtw.y).magnitude;
      final distance = position.distanceTo(boid.position);
      lineBtw = lineBtw.normalized();
      if (distance < minDistance && distance > 0) {
        // final ratio = (distance / separationRadius).clamp(0, 0.05).toDouble();
        // here the vector2
        // separation += lineBtw * ratio;
        lineBtw /= distance;
        separation.add(lineBtw);
      }
    }
    separation.normalize();
    separation *= moveSpeed;
    separation -= velocity;
    separation.scaleTo(separationForce);
    final newDirection = directionVector + separation;
    directionVector = newDirection.normalized();
    return separation;
  }

  Vector2 cohesion(List<PositionComponent> boids) {
    Vector2 sum = Vector2.zero();
    for (var other in boids) {
      double d = position.distanceTo(other.position);
      if ((d > 0) && (d < neighborDist)) {
        sum.add(other.position);
      }
    }
    sum.normalize();
    sum.scaleTo(cohesionForce);
    final newDirection = directionVector + sum;
    directionVector = newDirection.normalized();
    return sum;
  }

  Vector2 alignment(List<PositionComponent> boids) {
    Vector2 sum = Vector2.zero();
    double count = 0.0;
    for (var (other as Fish) in boids) {
      double d = position.distanceTo(other.position);
      if ((d > 0) && (d < neighborDist)) {
        sum += other.velocity;
        count++;
      }
    }
    if (count > 0) {
      sum /= count;
      sum.normalize();
      sum *= moveSpeed;
      Vector2 steer = sum - velocity;
      steer.scaleTo(alignmentForce);

      final newDirection = directionVector + steer;
      directionVector = newDirection.normalized();
    }
    return sum;
  }

  _tankBoundary() {
    const turnFactor = 1000;

    if (position.x < tankBoundaryMargin) {
      velocity.x += turnFactor;
    }
    if (position.x > tvWidth - tankBoundaryMargin) {
      velocity.x -= turnFactor;
    }
    if (position.y < tankBoundaryMargin) {
      velocity.y += turnFactor;
    }
    if (position.y > tvHeight - tankBoundaryMargin) {
      velocity.y -= turnFactor;
    }
  }

  _onMove(double dt) {
    velocity.x = ((moveSpeed) * directionVector.x);
    velocity.y = ((moveSpeed) * directionVector.y);
    transform.angle = math.atan2(velocity.y, velocity.x);
    _tankBoundary();
    position.x += velocity.x * dt;
    position.y += velocity.y * dt;
  }
}
