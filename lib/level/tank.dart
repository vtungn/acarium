import 'dart:async';
import 'dart:math' as math;

import 'package:carium/bloc/scoring/scoring_resource_bloc.dart';
import 'package:carium/character/fish_component.dart';
import 'package:carium/config/constants.dart';
import 'package:flame/components.dart';
import 'package:flame_bloc/flame_bloc.dart';

import '../character/ocean_obj_component.dart';
import '../domain/index.dart';

class Tank extends World
    with FlameBlocListenable<ScoringResourceBloc, ScoringResourceState> {
  @override
  FutureOr<void> onLoad() async {
    background();
    staticObjFar();
    fishLayerFar();
    staticObjNear();
    fishLayerNear();
    return super.onLoad();
  }

  void background() {}
  void staticObjFar() async {
    add(OceanObjComponent(
        oceanObj:
            Seaweed1(position: Vector2(tvWidth / 2 + 10, tvHeight / 2 + 20))));
  }

  void fishLayerFar() {
    var rnd = math.Random();
    for (var i = 0; i < 10; i++) {
      final fish = FishComponent(
        fish: Moi(),
        position:
            Vector2(rnd.nextDouble() * tvWidth, rnd.nextDouble() * tvHeight),
        directionVector:
            Vector2(rnd.nextDouble() * 1 - 0.5, rnd.nextDouble() * 1 - 0.5),
        // direction: 0,
        scaleFactor: rnd.nextDouble() * 0.5 + 1,
      );
      add(fish);
    }
    for (var i = 0; i < 1; i++) {
      final fish = FishComponent(
        fish: Moi(),
        position:
            Vector2(rnd.nextDouble() * tvWidth, rnd.nextDouble() * tvHeight),
        directionVector:
            Vector2(rnd.nextDouble() * 1 - 0.5, rnd.nextDouble() * 1 - 0.5),
        // direction: 0,
        scaleFactor: rnd.nextDouble() * 0.5 + 1,
      );
      add(fish);
    }
  }

  void staticObjNear() {}

  void fishLayerNear() {}
}
