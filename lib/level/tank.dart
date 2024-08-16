import 'dart:async';
import 'dart:math' as math;

import 'package:carium/bloc/scoring/scoring_resource_bloc.dart';
import 'package:carium/character/fish_animation.dart';
import 'package:carium/config/constants.dart';
import 'package:flame/components.dart';
import 'package:flame_bloc/flame_bloc.dart';

import '../character/seaweed.dart';
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
    add(Seaweed(
        seaweed:
            Seaweed1(position: Vector2(tvWidth / 2 + 10, tvHeight / 2 + 20))));
  }

  void fishLayerFar() {
    var rnd = math.Random();
    for (var i = 0; i < 30; i++) {
      final fish = FishAnimationComponent(
        fish: Shark1(),
        position:
            Vector2(rnd.nextDouble() * tvWidth, rnd.nextDouble() * tvHeight),
        directionVector:
            Vector2(rnd.nextDouble() * 1 - 0.5, rnd.nextDouble() * 1 - 0.5),
        // direction: 0,
        scaleFactor: rnd.nextDouble() * 2 + 1,
      );
      add(fish);
    }
    // add(FishAnimationComponent(
    //   fish: Shark1(),
    //   position:
    //       Vector2(rnd.nextDouble() * tvWidth, rnd.nextDouble() * tvHeight),
    //   directionVector:
    //       Vector2(rnd.nextDouble() * 1 - 0.5, rnd.nextDouble() * 1 - 0.5),
    //   // direction: 0,
    //   scaleFactor: rnd.nextDouble() * 2 + 1,
    // ));
  }

  void staticObjNear() {}

  void fishLayerNear() {}
}
