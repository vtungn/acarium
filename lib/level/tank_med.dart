import 'dart:async';

import 'package:carium/level/tank_layer.dart';
import 'package:flame/components.dart';

class TankMed extends World {
  @override
  FutureOr<void> onLoad() {
    add(BackgroundLayer(backgroundImage: 'static/farsea.jpg'));
    add(StaticObjFarLayer());
    add(FishLayerFar());
    add(StaticObjNearLayer());
    add(FishLayerNear());
    add(CloseupLayer());
    return super.onLoad();
  }
}
