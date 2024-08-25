import 'dart:async';
import 'dart:math';

import 'package:carium/character/food_pellet.dart';
import 'package:carium/config/constants.dart';
import 'package:carium/quest/quest_mixin.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

import 'domain/index.dart';
import 'level/index.dart';

class Acarium extends FlameGame with HasCollisionDetection, QuestMixin {
  late final CameraComponent cam;
  late World tank;
  final FoodPellet plankton =
      FoodPellet(foodType: FoodType.plankton, foodSize: Vector2(10, 10));

  @override
  Vector2 get size => Vector2(tvWidth, tvHeight);

  final random = Random();
  final Tween<double> noise = Tween(begin: -1, end: 1);
  final ColorTween colorTween = ColorTween(
      begin: Colors.white, end: const Color.fromARGB(255, 129, 125, 125));

  Acarium({super.children, super.world, super.camera});
  @override
  Color backgroundColor() {
    return const Color(0xff72D2ED);
  }

  @override
  FutureOr<void> onLoad() async {
    await images.loadAllImages();
    tank = TankMed();
    cam = CameraComponent.withFixedResolution(
        world: tank, width: tvWidth, height: tvHeight);
    cam.viewfinder.anchor = Anchor.topLeft;

    addAll([cam, tank]);

    return super.onLoad();
  }

  @override
  void onDispose() {
    FlameAudio.bgm.dispose();
    super.onDispose();
  }

  @override
  void renderMedTank() {
    removeWhere((compnent) => compnent is Tank);
    tank = TankMed();
    cam.world = tank;
    add(tank);
  }
}
