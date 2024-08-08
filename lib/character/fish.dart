import 'dart:async';
import 'dart:math' as math;

import 'package:carium/acarium_flame_game.dart';
import 'package:carium/character/seaweed.dart';
import 'package:carium/config/constants.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

enum FishType { fish1, fish2 }

class Fish extends SpriteComponent
    with HasGameRef<Acarium>, CollisionCallbacks {
  double accumulateTime = 0;
  final fixedDeltaTime = 1 / 60;
  final hungerDeltaTime = 0.1;
  double accHungerTime = 0;
  final eatDeltaTime = 10000;
  double accEatTime = 0;
  Vector2 velocity = Vector2.zero();
  double direction = 0.0;
  Vector2 directionVector;
  double moveSpeed = 900;
  double scaleFactor = 1;
  double separationRadius = 600;
  double updateDirection = 0;
  Vector2 steerFactor = Vector2.zero();
  double hunger = 100;

  Fish(
      {required position,
      required this.directionVector,
      required this.scaleFactor})
      : super(position: position);

  @override
  FutureOr<void> onLoad() {
    sprite = Sprite(game.images.fromCache('fish1.png'));
    scale = Vector2.all(scaleFactor);

    anchor = Anchor.center;

    add(RectangleHitbox());
    return super.onLoad();
  }

  @override
  void update(double dt) {
    accumulateTime += dt;
    while (accumulateTime >= fixedDeltaTime) {
      _onMove(dt);
      accumulateTime -= fixedDeltaTime;
    }
    hungerDrain(dt);
    super.update(dt);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Seaweed) {
      eatFood(other);
    }
    super.onCollision(intersectionPoints, other);
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

  _onMove(double dt) {
    velocity.x = ((moveSpeed) * directionVector.x);
    velocity.y = ((moveSpeed) * directionVector.y);
    transform.angle = math.atan2(velocity.y, velocity.x);
    _tankBoundary();
    position.x += velocity.x * dt;
    position.y += velocity.y * dt;
  }

  Vector2 seekFood(List<PositionComponent> weeds) {
    Vector2 sum = Vector2.zero();
    final other = weeds[0];
    if (other is Seaweed) {
      // print(other.absolutePosition);
      final lineBtw = other.position - position;
      // double d = math.Point(lineBtw.x, lineBtw.y).magnitude;
      // if (d > 0) {
      //   sum.add(lineBtw);
      // }
      final newDirection = lineBtw;
      directionVector = newDirection.normalized();
    }

    // Vector2 steer = sum + velocity;
    // sum.x < 0 ? directionVector + sum : directionVector - sum;
    return sum;
  }

  hungerDrain(double dt) {
    accHungerTime += dt;
    while (accHungerTime >= hungerDeltaTime) {
      hunger--;
      accHungerTime -= hungerDeltaTime;
      if (hunger < -20) {
        death();
      }
    }
  }

  eatFood(Seaweed weed) {
    // accHungerTime++;
    while (accHungerTime >= (hungerDeltaTime / 3)) {
      if (hunger <= 100) {
        weed.gotEaten();
        hunger++;
      }
      // accHungerTime -= hungerDeltaTime;
    }
  }

  death() {
    print('isDeath');
    removeFromParent();
  }
}
