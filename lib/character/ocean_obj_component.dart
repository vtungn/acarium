import 'dart:async';

import 'package:carium/acarium_flame_game.dart';
import 'package:carium/bloc/scoring/scoring_resource_bloc.dart';
import 'package:carium/character/food_pellet.dart';
import 'package:carium/domain/entity/ocean_static_model.dart';
import 'package:carium/domain/index.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame_bloc/flame_bloc.dart';

class OceanObjComponent extends SpriteComponent
    with
        HasGameRef<Acarium>,
        DragCallbacks,
        FlameBlocListenable<ScoringResourceBloc, ScoringResourceState> {
  final OceanStaticModel oceanObj;
  double accGenerateTime = 0;
  double generateRate = 0.5;
  late TextComponent text;
  List<FoodPellet> foodPellet = [];

  OceanObjComponent({required this.oceanObj});
  @override
  Future<void> onLoad() async {
    sprite = Sprite(game.images.fromCache(oceanObj.sprite));
    position = oceanObj.position;
    generateRate = oceanObj.regenRate;
    text =
        TextComponent(text: children.length.toString(), scale: Vector2.all(10));
    add(text);

    return super.onLoad();
  }

  @override
  void onNewState(ScoringResourceState state) {
    // TODO: implement onNewState
    super.onNewState(state);
  }

  @override
  void update(double dt) {
    accGenerateTime += dt;
    while (accGenerateTime >= generateRate) {
      accGenerateTime -= generateRate;
      if (children.length < 10) {
        generateFood();
      }
    }
    text.text = children.length.toString();
    super.update(dt);
  }

  generateFood() {
    final food = FoodPellet(foodType: oceanObj.foodType, foodSize: size);
    add(food);
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    position += event.localDelta;
    super.onDragUpdate(event);
  }
}
