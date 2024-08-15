import 'dart:async';

import 'package:carium/bloc/index.dart';
import 'package:carium/config/constants.dart';
import 'package:carium/level/tank.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flutter/material.dart';

class Acarium extends FlameGame with HasCollisionDetection {
  late final CameraComponent cam;
  @override
  Color backgroundColor() {
    return Colors.blueGrey;
  }

  @override
  FutureOr<void> onLoad() async {
    await images.loadAllImages();
    Tank world = Tank();
    // add(ScreenHitbox());

    cam = CameraComponent.withFixedResolution(
        world: world, width: tvWidth, height: tvHeight);
    cam.viewfinder.anchor = Anchor.topLeft;

    // addAll([cam, world]);
    await add(FlameBlocProvider.value(
        value: ScoringResourceBloc(), children: [cam, world]));
    return super.onLoad();
  }
}
