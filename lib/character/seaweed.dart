import 'dart:async';

import 'package:carium/acarium_flame_game.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class Seaweed extends SpriteComponent
    with HasGameRef<Acarium>, CollisionCallbacks {
  double accGenerateTime = 0;
  final generateRate = 1;
  double capacity = 100;

  Seaweed({required super.position});
  @override
  FutureOr<void> onLoad() {
    sprite = Sprite(game.images.fromCache('seaweed.png'));
    add(RectangleHitbox());
    return super.onLoad();
  }

  @override
  void update(double dt) {
    accGenerateTime += dt;
    while (accGenerateTime >= generateRate) {
      if (capacity <= 100) {
        capacity++;
      }
      if (capacity < -10) {
        removeFromParent();
      }
      accGenerateTime -= generateRate;
    }
    super.update(dt);
  }

  void gotEaten() {
    capacity--;
  }
}
