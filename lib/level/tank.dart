import 'dart:async';

import 'package:carium/character/fish.dart';
import 'package:carium/character/fish_boid.dart';
import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';

class Tank extends World {
  late TiledComponent level;

  @override
  FutureOr<void> onLoad() async {
    add(FishBoid<Fish>(boidNumber: 10));
    return super.onLoad();
  }
}
