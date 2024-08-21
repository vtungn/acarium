import 'dart:async';
import 'dart:math';

import 'package:carium/character/food_pellet.dart';
import 'package:carium/config/constants.dart';
import 'package:carium/quest/quest_mixin.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/particles.dart';
import 'package:flutter/material.dart';

import 'domain/index.dart';
import 'level/index.dart';

class Acarium extends FlameGame
    with HasCollisionDetection, MouseMovementDetector, QuestMixin {
  late final CameraComponent cam;
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
    Tank world = Tank();

    cam = CameraComponent.withFixedResolution(
        world: world, width: tvWidth, height: tvHeight);
    cam.viewfinder.anchor = Anchor.topLeft;

    addAll([cam, world]);

    return super.onLoad();
  }

  @override
  void onMouseMove(PointerHoverInfo info) {
    add(
      ParticleSystemComponent(
        position: info.eventPosition.widget,
        particle: Particle.generate(
          count: 10,
          generator: (i) {
            return AcceleratedParticle(
              lifespan: 2,
              speed: Vector2(
                    noise.transform(random.nextDouble()),
                    noise.transform(random.nextDouble()),
                  ) *
                  i.toDouble(),
              child: CircleParticle(
                radius: 2,
                paint: Paint()
                  ..color = colorTween.transform(random.nextDouble())!,
              ),
            );
          },
        ),
      ),
    );

    super.onMouseMove(info);
  }
}
