import 'dart:async';

import 'package:carium/character/fish.dart';
import 'package:carium/character/fish_boid.dart';
import 'package:flame/components.dart';

class Tank extends World {
  @override
  FutureOr<void> onLoad() async {
    add(FishBoid<Fish>(boidNumber: 30));
    return super.onLoad();
  }
}
