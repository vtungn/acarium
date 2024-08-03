import 'dart:async';

import 'package:carium/level/tank.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class Acarium extends FlameGame with HasCollisionDetection {
  final world = Tank();
  late final CameraComponent cam;
  @override
  Color backgroundColor() {
    return Colors.blueGrey;
  }

  @override
  FutureOr<void> onLoad() async {
    await images.loadAllImages();
    Tank world = Tank(
        // player: player,
        // levelName: levelNames[currentLevelIndex],
        );

    cam = CameraComponent.withFixedResolution(
        world: world, width: 3840, height: 2160);
    cam.viewfinder.anchor = Anchor.topLeft;

    addAll([cam, world]);
    return super.onLoad();
  }
}
