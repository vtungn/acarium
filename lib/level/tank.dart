import 'dart:async';
import 'dart:math' as math;

import 'package:carium/acarium_flame_game.dart';
import 'package:carium/character/crab_component.dart';
import 'package:carium/character/fish_component.dart';
import 'package:carium/character/ocean_obj_component.dart';
import 'package:carium/config/constants.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';

import '../domain/index.dart';
import 'tank_layer.dart';

class Tank extends World with HasGameRef<Acarium>, PointerMoveCallbacks {
  final fish1Layer = FishLayerFar();
  final back1Layer = StaticObjFarLayer();
  final back2Layer = StaticObjNearLayer();
  @override
  FutureOr<void> onLoad() async {
    add(BackgroundLayer(backgroundImage: 'static/closesea.jpg'));
    add(back1Layer
      ..add(OceanObjComponent(
          oceanObj: Seaweed1(
              position: Vector2(tvWidth / 2 + 10, tvHeight / 2 + 20)))));
    add(fish1Layer);
    add(back2Layer);
    add(FishLayerNear()..add(CrabComponent()));
    add(CloseupLayer());
    // fishLayerFar();
    addRock();
    return super.onLoad();
  }

  void fishLayerFar() {
    var rnd = math.Random();
    for (var i = 0; i < 5; i++) {
      final fish = FishComponent(
        fish: Ngua(),
        position:
            Vector2(rnd.nextDouble() * tvWidth, rnd.nextDouble() * tvHeight),
        directionVector:
            Vector2(rnd.nextDouble() * 1 - 0.5, rnd.nextDouble() * 1 - 0.5),
        // direction: 0,
      );
      fish1Layer.add(fish);
    }
    for (var i = 0; i < 1; i++) {
      final fish = FishComponent(
        fish: Nguvayxanh(),
        position:
            Vector2(rnd.nextDouble() * tvWidth, rnd.nextDouble() * tvHeight),
        directionVector:
            Vector2(rnd.nextDouble() * 1 - 0.5, rnd.nextDouble() * 1 - 0.5),
      );
      fish1Layer.add(fish);
    }
  }

  void addRock() {
    // add(OceanObjComponent(oceanObj: Seaweed1(position: Vector2.all(10))));
    add(OceanObjComponent(oceanObj: Coral2(position: Vector2(3369, 912))));
    add(OceanObjComponent(oceanObj: Sand3(position: Vector2(0, 1580))));
    add(OceanObjComponent(oceanObj: Sand1(position: Vector2(1633, 1526))));
    add(OceanObjComponent(oceanObj: Sand2(position: Vector2(1463, 1882))));
    add(OceanObjComponent(oceanObj: Coral3(position: Vector2(2828, 1576))));
    add(OceanObjComponent(oceanObj: Coral1(position: Vector2(-93, 858))));
    add(OceanObjComponent(oceanObj: Rock3(position: Vector2(2552, 1735))));
    add(OceanObjComponent(oceanObj: Rock2(position: Vector2(3416, 1515))));
    add(OceanObjComponent(oceanObj: Rock1(position: Vector2(-188, 1118))));
  }

  @override
  void onPointerMove(PointerMoveEvent event) {
    // TODO: implement onPointerMove
    super.onPointerMove(event);
  }
}
