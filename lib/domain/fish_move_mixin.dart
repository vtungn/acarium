import 'package:flame/components.dart';

mixin FishMoveMixin on SpriteComponent {
  double accHungerTime = 0;
  double hunger = 100;
  double get hungerDeltaTime;

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
      if (hunger < -20) {
        death();
      }
    }
  }

  death() {
    removeFromParent();
  }
}
