import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/particles.dart';
import 'package:flutter/material.dart';

class PlanktonComponent extends PositionComponent {
  late ParticleSystemComponent particle;
  @override
  FutureOr<void> onLoad() {
    particle = ParticleSystemComponent(
      particle: Particle.generate(
        count: 100,
        generator: (i) => CircleParticle(
          paint: Paint()..color = Colors.white,
        ),
      ),
    );
    add(particle);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    // if (particle.removed) removeFromParent();
    super.update(dt);
  }
}
