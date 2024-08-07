// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:carium/gpt_game.dart';
import 'package:flame/components.dart';

class Boid extends PositionComponent with HasGameRef<BoidGame> {
  static const double maxSpeed = 100;
  static const double maxForce = 10;
  static const double desiredSeparation = 25;
  static const double neighborDist = 50;
  static final Random random = Random();

  Vector2 velocity;
  Vector2 acceleration = Vector2.zero();

  Boid(
    this.velocity,
  );
  @override
  FutureOr<void> onLoad() {
    // sprite = Sprite(game.images.fromCache('fish1.png'));
    position = position;
    velocity =
        Vector2(random.nextDouble() * 2 - 1, random.nextDouble() * 2 - 1);
    velocity.scaleTo(maxSpeed);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    acceleration = Vector2.zero();

    Vector2 sep = separate(gameRef.boids);
    Vector2 ali = align(gameRef.boids);
    Vector2 coh = cohesion(gameRef.boids);

    sep.scaleTo(maxForce);
    ali.scaleTo(maxForce);
    coh.scaleTo(maxForce);

    acceleration.add(sep);
    acceleration.add(ali);
    acceleration.add(coh);

    velocity.add(acceleration);
    velocity.scaleTo(maxSpeed);
    position.add(velocity * dt);

    super.update(dt);
  }

  Vector2 separate(List<Boid> boids) {
    Vector2 steer = Vector2.zero();
    int count = 0;
    for (Boid other in boids) {
      double d = position.distanceTo(other.position);
      if ((d > 0) && (d < desiredSeparation)) {
        Vector2 diff = position - other.position;
        diff.normalize();
        diff /= d;
        steer.add(diff);
        count++;
      }
    }
    if (count > 0) {
      steer /= count.toDouble();
    }
    if (steer.length > 0) {
      steer.normalize();
      steer *= maxSpeed;
      steer -= velocity;
      steer.scaleTo(maxForce);
    }
    return steer;
  }

  Vector2 align(List<Boid> boids) {
    Vector2 sum = Vector2.zero();
    int count = 0;
    for (Boid other in boids) {
      double d = position.distanceTo(other.position);
      if ((d > 0) && (d < neighborDist)) {
        sum.add(other.velocity);
        count++;
      }
    }
    if (count > 0) {
      sum /= count.toDouble();
      sum.normalize();
      sum *= maxSpeed;
      Vector2 steer = sum - velocity;
      steer.scaleTo(maxForce);
      return steer;
    } else {
      return Vector2.zero();
    }
  }

  Vector2 cohesion(List<Boid> boids) {
    Vector2 sum = Vector2.zero();
    int count = 0;
    for (Boid other in boids) {
      double d = position.distanceTo(other.position);
      if ((d > 0) && (d < neighborDist)) {
        sum.add(other.position);
        count++;
      }
    }
    if (count > 0) {
      sum /= count.toDouble();
      return seek(sum);
    } else {
      return Vector2.zero();
    }
  }

  Vector2 seek(Vector2 target) {
    Vector2 desired = target - position;
    desired.normalize();
    desired *= maxSpeed;
    Vector2 steer = desired - velocity;
    steer.scaleTo(maxForce);
    return steer;
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    final paint = Paint()..color = Color(0xFF00FF00);
    canvas.drawCircle(Offset.zero, 5, paint);
  }
}
