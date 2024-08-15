import 'dart:async';
import 'dart:math' as math;

import 'package:carium/character/fish.dart';
import 'package:carium/config/constants.dart';
import 'package:flame/components.dart';

import '../character/seaweed.dart';
import '../domain/index.dart';

class Tank extends World {
  @override
  FutureOr<void> onLoad() async {
    background();
    staticObjFar();
    fishLayerFar();
    staticObjNear();
    return super.onLoad();
  }

  void background() {}
  void staticObjFar() {
    add(
      Seaweed(
          seaweed:
              Seaweed1(position: Vector2(tvWidth / 2 + 10, tvHeight / 2 + 20))),
    );
  }

  void fishLayerFar() {
    var rnd = math.Random();
    for (var i = 0; i < 30; i++) {
      final fish = FishComponent(
        fish: Smallfish1(),
        position:
            Vector2(rnd.nextDouble() * tvWidth, rnd.nextDouble() * tvHeight),
        directionVector:
            Vector2(rnd.nextDouble() * 1 - 0.5, rnd.nextDouble() * 1 - 0.5),
        // direction: 0,
        scaleFactor: rnd.nextDouble() * 2 + 1,
      );
      add(fish);
    }
  }

  void staticObjNear() {}

  void fishLayerNear() {}
}
