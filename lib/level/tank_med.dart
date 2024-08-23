import 'dart:async';

import 'package:carium/character/crab_component.dart';
import 'package:carium/character/fish_component.dart';
import 'package:carium/character/ocean_obj_component.dart';
import 'package:carium/domain/index.dart';
import 'package:carium/level/tank_layer.dart';
import 'package:flame/components.dart';

class TankMed extends World {
  @override
  FutureOr<void> onLoad() {
    add(BackgroundLayer(backgroundImage: 'static/farsea.jpg'));
    add(StaticObjFarLayer());
    add(FishLayerFar());
    add(StaticObjNearLayer());
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
    add(OceanObjComponent(
        oceanObj: CoralLayer2(position: Vector2(1269 / 2, 1497 / 2))));
    add(OceanObjComponent(
        oceanObj: CoralLayer3(position: Vector2(1882 / 2, 1006 / 2))));
    add(OceanObjComponent(
        oceanObj: CoralLayer4(position: Vector2(2346 / 2, 935 / 2))));
  }

  addFish() {
    add(FishComponent(
        fish: Maotien(),
        position: Vector2.all(10),
        directionVector: Vector2.all(10)));
    add(FishComponent(
        fish: Maotien(),
        position: Vector2.all(10),
        directionVector: Vector2.all(10)));
    add(FishComponent(
        fish: Maotien(),
        position: Vector2.all(10),
        directionVector: Vector2.all(10)));
  }
}
