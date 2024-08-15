import 'dart:async';
import 'dart:math' as math;

import 'package:carium/acarium_flame_game.dart';
import 'package:carium/character/seaweed.dart';
import 'package:carium/config/constants.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../domain/index.dart';

enum FishType { fish1, fish2 }

class FishComponent extends SpriteComponent
    with HasGameRef<Acarium>, CollisionCallbacks {
  final Fish fish;
  double accumulateTime = 0;
  double accEatTime = 0;
  double accHungerTime = 0;
  final fixedDeltaTime = 1 / 60;
  final hungerDeltaTime = 0.1;
  final eatDeltaTime = 0.2;
  Vector2 velocity = Vector2.zero();
  double direction = 0.0;
  Vector2 directionVector;
  double moveSpeed = 900;
  double scaleFactor = 1;
  double separationRadius = 600;
  double updateDirection = 0;
  Vector2 steerFactor = Vector2.zero();
  double hunger = 100;

  bool eatFactor = false;

  FishComponent(
      {required this.fish,
      required position,
      required this.directionVector,
      required this.scaleFactor})
      : super(position: position);

  @override
  FutureOr<void> onLoad() async {
    sprite = Sprite(game.images.fromCache(fish.sprite));
    scale = Vector2.all(scaleFactor);
    hunger = fish.hunger;
    anchor = Anchor.center;

    add(RectangleHitbox());
    return super.onLoad();
  }

  @override
  void update(double dt) {
    accumulateTime += dt;
    accEatTime += dt;

    eatFactor = false;
    while (accumulateTime >= fixedDeltaTime) {
      _onMove(dt);
      accumulateTime -= fixedDeltaTime;
    }
    hungerDrain(dt);
    if (hunger < 50 && !isRemoved) {
      seekFood();
    }
    super.update(dt);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    accEatTime += 0.001;
    while (accEatTime >= eatDeltaTime) {
      if (other is Seaweed) {
        eatFood();
        other.gotEaten();
      }
      // eatFactor = true;
      accEatTime -= eatDeltaTime / 3;
    }

    super.onCollision(intersectionPoints, other);
  }

  void separation({double minDistance = 500}) {
    final boids = game.descendants().whereType<FishComponent>().toList();
    if (boids.isEmpty) return;
    var separation = Vector2.zero();
    for (var boid in boids) {
      var lineBtw = position - boid.position;
      // final distance = math.Point(lineBtw.x, lineBtw.y).magnitude;
      final distance = position.distanceTo(boid.position);
      lineBtw = lineBtw.normalized();
      if (distance < minDistance && distance > 0) {
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
    // return separation;
  }

  void cohesion() {
    final boids = game.descendants().whereType<FishComponent>().toList();
    if (boids.isEmpty) return;
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
    // return sum;
  }

  void alignment() {
    final boids = game.descendants().whereType<FishComponent>().toList();
    if (boids.isEmpty) return;
    Vector2 sum = Vector2.zero();
    double count = 0.0;
    for (var other in boids) {
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
    // return sum;
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
    separation(minDistance: neighborDist);
    alignment();
    cohesion();
    position.x += velocity.x * dt;
    position.y += velocity.y * dt;
    if (velocity.x < 0 && !isFlippedVertically) {
      flipVertically();
    } else if (velocity.x > 0 && isFlippedVertically) {
      flipVertically();
    }
  }

  void seekFood() {
    final weeds2 = game.descendants().whereType<Seaweed>().toList();
    if (weeds2.isEmpty) return;
    final other = weeds2[0];
    final lineBtw = other.position - position;
    lineBtw.normalize();
    final newDirection = lineBtw;
    directionVector = newDirection.normalized();

    // Vector2 steer = sum + velocity;
    // sum.x < 0 ? directionVector + sum : directionVector - sum;
    // return sum;
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

  eatFood() {
    hunger += 5;
  }

  death() {
    print('isDeath');
    removeFromParent();
  }
}
