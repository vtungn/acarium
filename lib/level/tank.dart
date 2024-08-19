import 'dart:async';
import 'dart:math' as math;

import 'package:carium/acarium_flame_game.dart';
import 'package:carium/character/fish_component.dart';
import 'package:carium/character/ocean_obj_component.dart';
import 'package:carium/config/constants.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';

import '../domain/index.dart';
import 'tank_layer.dart';

class Tank extends World with HasGameRef<Acarium>, PointerMoveCallbacks {
  final fish1Layer = FishLayerFar();
  @override
  FutureOr<void> onLoad() async {
    add(BackgroundLayer()
      ..add(OceanObjComponent(
          oceanObj: Seaweed1(
              position: Vector2(tvWidth / 2 + 10, tvHeight / 2 + 20)))));
    add(StaticObjFarLayer());
    add(fish1Layer);
    add(StaticObjNearLayer());
    add(FishLayerNear());
    add(CloseupLayer());
    fishLayerFar();
    return super.onLoad();
  }

  void fishLayerFar() {
    // final thisLayer = game.descendants().whereType<OceanObjComponent>();
    // print(thisLayer);
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

  @override
  void onPointerMove(PointerMoveEvent event) {
    // TODO: implement onPointerMove
    super.onPointerMove(event);
  }
}
