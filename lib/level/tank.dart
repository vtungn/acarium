import 'dart:async';

import 'package:carium/character/fish.dart';
import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';

class Tank extends World {
  late TiledComponent level;
  @override
  FutureOr<void> onLoad() async {
    level = await TiledComponent.load('ocean.tmx', Vector2.all(32));
    add(level);
    // final spawnFish =
    add(Fish());
    return super.onLoad();
  }
}
