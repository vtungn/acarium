import 'dart:async';

import 'package:carium/acarium_flame_game.dart';
import 'package:carium/character/food_pellet.dart';
import 'package:carium/domain/entity/ocean_static_model.dart';
import 'package:carium/domain/index.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';

class OceanObjComponent extends SpriteComponent
    with HasGameRef<Acarium>, DragCallbacks {
  final OceanStaticModel oceanObj;
  double accGenerateTime = 0;
  double generateRate = 0.5;
  bool canRegen = true;

  List<FoodPellet> foodPellet = [];

  OceanObjComponent({required this.oceanObj});
  @override
  Future<void> onLoad() async {
    sprite = Sprite(game.images.fromCache(oceanObj.sprite));
    position = oceanObj.position;
    generateRate = oceanObj.regenRate;
    canRegen = oceanObj.regenRate != 0;

    return super.onLoad();
  }

  @override
  void update(double dt) {
    accGenerateTime += dt;
    if (canRegen) {
      while (accGenerateTime >= generateRate) {
        accGenerateTime -= generateRate;
        if (children.length < 10) {
          generateFood();
        }
      }
    }

    super.update(dt);
  }

  generateFood() {
    final food = FoodPellet(foodType: oceanObj.foodType, foodSize: size);
    add(food);
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    position += event.localDelta;
    // print(oceanObj.runtimeType.toString() + ':' + position.toString());
    super.onDragUpdate(event);
  }
}
