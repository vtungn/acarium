import 'dart:async';
import 'dart:math' as math;

import 'package:carium/character/fish.dart';
import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';

class Tank extends World {
  late TiledComponent level;
  @override
  FutureOr<void> onLoad() async {
    level = await TiledComponent.load('ocean.tmx', Vector2.all(32));
    // level = PositionComponent();
    add(level);
    // final spawnFish =
    // add(Fish());
    _generateFish();
    return super.onLoad();
  }

  _generateFish() {
    var rnd = math.Random();
    for (var i = 0; i < 20; i++) {
      final fish = Fish(
        position: Vector2(rnd.nextDouble() * 2500, rnd.nextDouble() * 1500),
        direction: rnd.nextDouble() * 360,
        scaleFactor: rnd.nextDouble() * 0.5,
      );
      // const math.Point(1,  2).magnitude;
      // Vector2.all(2).mag
      add(fish);
    }
  }
}
