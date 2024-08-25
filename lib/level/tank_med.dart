import 'dart:async';
import 'dart:math' as math;
import 'dart:ui';

import 'package:carium/character/crab_component.dart';
import 'package:carium/character/fish_component.dart';
import 'package:carium/character/ocean_obj_component.dart';
import 'package:carium/config/constants.dart';
import 'package:carium/domain/index.dart';
import 'package:carium/level/tank_layer.dart';
import 'package:flame/components.dart';

class TankMed extends World {
  final fish1Layer = FishLayerFar();
  final backFarLayer = StaticObjFarLayer();
  @override
  FutureOr<void> onLoad() {
    add(BackgroundLayer(backgroundImage: 'static/farsea.jpg'));
    add(backFarLayer);
    add(fish1Layer);
    add(StaticObjNearLayer()
      ..add(RectangleComponent.fromRect(Rect.largest,
          paint: Paint()..color = Color.fromARGB(106, 2, 40, 69))));
    // add
    addRock();
    add(FishLayerNear()..add(CrabComponent()));
    addFish();
    add(CloseupLayer());
    return super.onLoad();
  }

  addRock() {
    add(OceanObjComponent(
        oceanObj: CoralLayer1(position: Vector2(0 / 2, 1212 / 2))));
    backFarLayer.add(OceanObjComponent(
        oceanObj: CoralLayer2(position: Vector2(1269 / 2, 1497 / 2))));
    backFarLayer.add(OceanObjComponent(
        oceanObj: CoralLayer3(position: Vector2(1882 / 2, 1006 / 2))));
    backFarLayer.add(OceanObjComponent(
        oceanObj: CoralLayer4(position: Vector2(2346 / 2, 935 / 2))));
  }

  addFish() {
    add(FishComponent(
        fish: Maotien(spriteScale: 0.5),
        position: Vector2.all(10),
        directionVector: Vector2.all(10)));
    add(FishComponent(
        fish: Maotien(spriteScale: 0.5),
        position: Vector2.all(10),
        directionVector: Vector2.all(10)));

    var rnd = math.Random();
    for (var i = 0; i < 12; i++) {
      final fish = FishComponent(
        fish: Thu(speedA: 0.5),
        position:
            Vector2(rnd.nextDouble() * tvWidth, rnd.nextDouble() * tvHeight),
        directionVector:
            Vector2(rnd.nextDouble() * 1 - 0.5, rnd.nextDouble() * 1 - 0.5),
        // direction: 0,
      );
      fish1Layer.add(fish);
    }
  }
}
