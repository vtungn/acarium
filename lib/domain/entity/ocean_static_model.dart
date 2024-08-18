import 'package:carium/domain/entity/index.dart';
import 'package:flame/components.dart';

sealed class OceanStaticModel extends OceanObjModel {
  final Vector2 position;
  final double regenRate;
  OceanStaticModel({
    required this.regenRate,
    required this.position,
    required super.sprite,
    required super.foodType,
  });
}

class Seaweed1 extends OceanStaticModel {
  Seaweed1({required super.position})
      : super(
          sprite: 'static/seaweed1.png',
          regenRate: 0.3,
          foodType: FoodType.seaweed,
        );
}

class Plankton extends OceanStaticModel {
  Plankton({required super.position})
      : super(
          sprite: '',
          regenRate: 0.3,
          foodType: FoodType.plankton,
        );
}
