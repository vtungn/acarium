import 'dart:async';

import 'package:carium/domain/index.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class FoodPellet extends PositionComponent with CollisionCallbacks {
  FoodType foodType;
  Vector2 foodSize;
  FoodPellet({required this.foodSize, required this.foodType, super.position});

  @override
  FutureOr<void> onLoad() {
    add(RectangleHitbox(size: foodSize));
    return super.onLoad();
  }

  gotEaten() {
    removeFromParent();
  }
}
