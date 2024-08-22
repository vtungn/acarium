import 'dart:ui';

import 'package:carium/character/fish_component.dart';
import 'package:flame/components.dart';

enum FishState { idle, hungry, reproduce }

mixin FishMoveMixin on SpriteComponent {
  double accHungerTime = 0;
  double hungerStat = 100;
  double accReproduceTime = 0;
  double reproduceStat = 0;
  double get hungerDeltaTime;
  double get reProduceTimeRate;
  double get oneFoodIncrease;
  int get boidsCount;
  FishState state = FishState.idle;

  @override
  void update(double dt) {
    hungerDrain(dt);
    produceGain(dt);
    super.update(dt);
  }

  produceGain(double dt) {
    if (boidsCount > 20) return;
    accReproduceTime += dt;
    while (accReproduceTime >= reProduceTimeRate) {
      accReproduceTime -= reProduceTimeRate;
      if (reproduceStat >= 100 && state != FishState.hungry && !isRemoved) {
        state = FishState.reproduce;
        seekPartner();
        tint(const Color.fromARGB(123, 0, 248, 0));
      } else {
        reproduceStat++;
      }
    }
  }

  hungerDrain(double dt) {
    accHungerTime += dt;
    while (accHungerTime >= hungerDeltaTime) {
      hungerStat--;
      accHungerTime -= hungerDeltaTime;
      if (hungerStat < 50 && !isRemoved) {
        state = FishState.hungry;
        seekFood();
        tint(const Color.fromARGB(113, 248, 0, 0));
      }
      if (hungerStat < -20) {
        death();
      }
    }
  }

  death() {
    removeFromParent();
  }

  eatFood() {
    hungerStat += oneFoodIncrease;
    if (hungerStat >= 80) {
      state = FishState.idle;
      tint(const Color(0x00000000));
    }
  }

  reproduceNewFish(fish) {
    reproduceStat = 0;
    tint(const Color(0x00000000));
    state = FishState.idle;
    parent?.add(FishComponent(
        fish: fish,
        position: Vector2.random(),
        directionVector: Vector2.random()));
  }

  seekFood();
  seekPartner();
}
