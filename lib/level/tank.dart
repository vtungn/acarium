import 'dart:async';
import 'dart:math' as math;

import 'package:carium/acarium_flame_game.dart';
import 'package:carium/character/crab_component.dart';
import 'package:carium/character/fish_component.dart';
import 'package:carium/character/ocean_obj_component.dart';
import 'package:carium/config/constants.dart';
import 'package:flame/components.dart';

import '../domain/index.dart';
import 'tank_layer.dart';

class Tank extends World with HasGameRef<Acarium> {
  final fish1Layer = FishLayerFar();
  final back1Layer = StaticObjFarLayer();
  final back2Layer = StaticObjNearLayer();
  @override
  FutureOr<void> onLoad() async {
    add(BackgroundLayer(backgroundImage: 'static/closesea.jpg'));
    addRock();
    add(back1Layer);
    add(fish1Layer);
    add(back2Layer);
    add(FishLayerNear()..add(CrabComponent()));
    add(CloseupLayer());
    fishLayerFar();
    return super.onLoad();
  }

  void fishLayerFar() {
    var rnd = math.Random();
    for (var i = 0; i < 5; i++) {
      final fish = FishComponent(
        fish: Moi(),
        position:
            Vector2(rnd.nextDouble() * tvWidth, rnd.nextDouble() * tvHeight),
        directionVector:
            Vector2(rnd.nextDouble() * 1 - 0.5, rnd.nextDouble() * 1 - 0.5),
        // direction: 0,
      );
      fish1Layer.add(fish);
    }
    // for (var i = 0; i < 1; i++) {
    //   final fish = FishComponent(
    //     fish: Nguvayxanh(),
    //     position:
    //         Vector2(rnd.nextDouble() * tvWidth, rnd.nextDouble() * tvHeight),
    //     directionVector:
    //         Vector2(rnd.nextDouble() * 1 - 0.5, rnd.nextDouble() * 1 - 0.5),
    //   );
    //   fish1Layer.add(fish);
    // }
  }

  void addRock() {
    // add(OceanObjComponent(oceanObj: Seaweed1(position: Vector2.all(10))));
    // add(OceanObjComponent(
    //     oceanObj: Coral2(position: Vector2(3369 / 2, 912 / 2))));
    back1Layer.add(
        OceanObjComponent(oceanObj: Sand3(position: Vector2(0, 1580 / 2))));
    back1Layer.add(OceanObjComponent(
        oceanObj: Sand1(position: Vector2(1633 / 2, 1526 / 2))));
    back1Layer.add(OceanObjComponent(
        oceanObj: Sand2(position: Vector2(1463 / 2, 1882 / 2))));
    // add(OceanObjComponent(
    //     oceanObj: Coral3(position: Vector2(2828 / 2, 1576 / 2))));
    // add(OceanObjComponent(
    //     oceanObj: Coral1(position: Vector2(-93 / 2, 858 / 2))));
    back1Layer.add(OceanObjComponent(
        oceanObj: Rock3(position: Vector2(2552 / 2, 1735 / 2))));
    back1Layer.add(OceanObjComponent(
        oceanObj: Rock2(position: Vector2(3416 / 2, 1515 / 2))));
    back1Layer.add(OceanObjComponent(
        oceanObj: Rock1(position: Vector2(-188 / 2, 1118 / 2))));
  }

  @override
  void update(double dt) {
    final checkEndGame = game.descendants().whereType<FishComponent>();
    if (checkEndGame.isEmpty) {
      game.overlays.add('game_over');
    }
    super.update(dt);
  }
}
