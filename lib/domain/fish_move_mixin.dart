import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';

enum FishState { idle, hungry, reproduce }

mixin FishMoveMixin on SpriteComponent {
  double accHungerTime = 0;
  double hunger = 100;
  double get hungerDeltaTime;
  FishState state = FishState.idle;
  var hungryEffect = ColorEffect(
    Color.fromARGB(255, 248, 0, 0),
    EffectController(duration: 1.5),
    opacityTo: 0.8,
  );

  @override
  void update(double dt) {
    hungerDrain(dt);
    super.update(dt);
  }

  hungerDrain(double dt) {
    accHungerTime += dt;
    while (accHungerTime >= hungerDeltaTime) {
      hunger--;
      accHungerTime -= hungerDeltaTime;
      if (hunger < 50 && !isRemoved) {
        state = FishState.hungry;
        seekFood();
        tint(Color.fromARGB(113, 248, 0, 0));
      }
      if (hunger < -20) {
        death();
      }
    }
  }

  death() {
    removeFromParent();
  }

  eatFood() {
    hunger += 80;
    state = FishState.idle;
    // if (children.contains(hungryEffect)) {
    //   children.remove(hungryEffect);
    tint(const Color(0x00000000));
    // }
  }

  seekFood();
}
