import 'dart:async';

import 'package:carium/bloc/scoring/scoring_resource_bloc.dart';
import 'package:carium/config/constants.dart';
import 'package:carium/level/tank.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flutter/material.dart';

class Acarium extends FlameGame
    with HasCollisionDetection, MouseMovementDetector {
  late final CameraComponent cam;
  @override
  Vector2 get size => Vector2(tvWidth, tvHeight);

  Acarium({super.children, super.world, super.camera});
  @override
  Color backgroundColor() {
    return const Color(0xff72D2ED);
  }

  @override
  FutureOr<void> onLoad() async {
    await images.loadAllImages();
    Tank world = Tank();

    cam = CameraComponent.withFixedResolution(
        world: world, width: tvWidth, height: tvHeight);
    cam.viewfinder.anchor = Anchor.topLeft;

    await add(FlameBlocProvider<ScoringResourceBloc, ScoringResourceState>(
        create: () => ScoringResourceBloc(), children: [cam, world]));

    return super.onLoad();
  }
}
