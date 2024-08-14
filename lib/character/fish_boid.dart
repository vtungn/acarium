import 'dart:async';
import 'dart:math' as math;

import 'package:carium/acarium_flame_game.dart';
import 'package:carium/character/fish.dart';
import 'package:carium/character/seaweed.dart';
import 'package:carium/character/shark.dart';
import 'package:carium/config/constants.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class FishBoid<T extends Fish> extends PositionComponent
    with HasGameRef<Acarium>, CollisionCallbacks {
  final int boidNumber;

  List<PositionComponent> fishBoid = [];
  List<PositionComponent> weed = [];
  List<PositionComponent> shark = [];

  FishBoid(
      {super.children, super.priority, super.key, required this.boidNumber});
  @override
  FutureOr<void> onLoad() {
    final weed1 =
        Seaweed(position: Vector2(tvWidth / 2 + 10, tvHeight / 2 + 20));
    add(weed1);
    weed.add(weed1);
    final shark1 = Shark();
    add(shark1);
    shark.add(shark1);
    var rnd = math.Random();
    for (var i = 0; i < boidNumber; i++) {
      final fish = Fish(
        position:
            Vector2(rnd.nextDouble() * tvWidth, rnd.nextDouble() * tvHeight),
        directionVector:
            Vector2(rnd.nextDouble() * 1 - 0.5, rnd.nextDouble() * 1 - 0.5),
        // direction: 0,
        scaleFactor: rnd.nextDouble() * 2 + 1,
      );
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
        if (boid.hunger < 50 && !boid.isRemoved) {
          boid.seekFood(weed);
        }
      }
    }
    super.update(dt);
  }
}
