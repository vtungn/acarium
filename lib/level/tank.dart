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
    for (var i = 0; i < 10; i++) {
      final fish = Fish(
        // fruit: spawnPoint.name,
        position: Vector2(rnd.nextDouble() * 3000, rnd.nextDouble() * 2000),
        direction: rnd.nextDouble() * 360,
        // direction: 180,
        // size: Vector2(spawnPoint.width, spawnPoint.height),
      );
      add(fish);
    }
  }
}
