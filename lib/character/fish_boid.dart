import 'dart:async';
import 'dart:math' as math;

import 'package:carium/acarium_flame_game.dart';
import 'package:carium/character/fish.dart';
import 'package:carium/config/constants.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class FishBoid<T extends Fish> extends PositionComponent
    with HasGameRef<Acarium>, CollisionCallbacks {
  final int boidNumber;

  List<PositionComponent> fishBoid = [];

  FishBoid(
      {super.children, super.priority, super.key, required this.boidNumber});
  @override
  FutureOr<void> onLoad() {
    var rnd = math.Random();
    for (var i = 0; i < boidNumber; i++) {
      final fish = Fish(
        position:
            Vector2(rnd.nextDouble() * tvWidth, rnd.nextDouble() * tvHeight),
        directionVector:
            Vector2(rnd.nextDouble() * 1 - 0.5, rnd.nextDouble() * 1 - 0.5),
        // direction: 0,
        scaleFactor: rnd.nextDouble() * 0.5,
      );
      // final fish = Fish(
      //   position: Vector2(tvWidth / 2, tvHeight / 2),
      //   directionVector: Vector2(0.5, 1),
      //   scaleFactor: rnd.nextDouble() * 0.5,
      // );
      add(fish);
      fishBoid.add(fish);
      // children.add(T);
    }

    return super.onLoad();
  }

  @override
  void update(double dt) {
    for (var i = 0; i < fishBoid.length; i++) {
      var boid = fishBoid[i];
      if (boid is Fish) {
        boid.separation(fishBoid, minDistance: neighborDist);
        boid.alignment(fishBoid);
        boid.cohesion(fishBoid);
      }
    }
    super.update(dt);
  }

  // Vector2 separation(PositionComponent current) {
  //   var separation = Vector2.zero();
  //   for (var boid in children) {
  //     final lineBtw = position - other.position;

  //     // ratio close 0 = hotter get away, ratio 1 = colder far enough
  //     final ratio =
  //         (math.Point(lineBtw.x, lineBtw.y).magnitude / separationRadius)
  //             .clamp(0, 1)
  //             .toDouble();
  //   }
  //   return Vector2.zero();
  // }
}
