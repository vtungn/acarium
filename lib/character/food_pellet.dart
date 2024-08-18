import 'dart:async';

import 'package:carium/domain/index.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class FoodPellet extends PositionComponent with CollisionCallbacks {
  FoodType foodType;
  FoodPellet({required this.foodType, super.position});

  @override
  FutureOr<void> onLoad() {
    add(RectangleHitbox(size: Vector2.all(100)));
    return super.onLoad();
  }

  gotEaten() {
    removeFromParent();
  }
}
