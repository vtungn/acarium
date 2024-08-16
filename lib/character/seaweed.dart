import 'dart:async';

import 'package:carium/acarium_flame_game.dart';
import 'package:carium/bloc/scoring/scoring_resource_bloc.dart';
import 'package:carium/domain/entity/ocean_static_model.dart';
import 'package:carium/domain/index.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame_bloc/flame_bloc.dart';

class Seaweed extends SpriteComponent
    with
        HasGameRef<Acarium>,
        DragCallbacks,
        FlameBlocListenable<ScoringResourceBloc, ScoringResourceState> {
  final OceanStaticModel seaweed;
  double accGenerateTime = 0;
  double generateRate = 0.5;
  double capacity = 100;

  Seaweed({required this.seaweed});
  @override
  Future<void> onLoad() async {
    sprite = Sprite(game.images.fromCache(seaweed.sprite));
    position = seaweed.position;
    generateRate = seaweed.regenRate;
    add(RectangleHitbox());
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
      if (capacity <= 100) {
        capacity += 10;
      }
      // if (capacity < -10) {
      //   removeFromParent();
      // }
      accGenerateTime -= generateRate;
      scale = Vector2.all((capacity.abs()) / 100);
    }
    super.update(dt);
  }

  void gotEaten() {
    capacity--;
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    position = event.deviceEndPosition;
    super.onDragUpdate(event);
  }
}
