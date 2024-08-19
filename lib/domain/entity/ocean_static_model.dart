import 'package:carium/domain/entity/index.dart';
import 'package:flame/components.dart';

sealed class OceanStaticModel extends OceanObjModel {
  final Vector2 position;
  final double regenRate;
  OceanStaticModel({
    this.regenRate = 0,
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

class Rock1 extends OceanStaticModel {
  Rock1({required super.position})
      : super(
          sprite: 'static/rock1.png',
          foodType: FoodType.notfood,
        );
}

class Rock2 extends OceanStaticModel {
  Rock2({required super.position})
      : super(
          sprite: 'static/rock2.png',
          foodType: FoodType.notfood,
        );
}

class Rock3 extends OceanStaticModel {
  Rock3({required super.position})
      : super(
          sprite: 'static/rock3.png',
          foodType: FoodType.notfood,
        );
}

class Coral1 extends OceanStaticModel {
  Coral1({required super.position})
      : super(
          sprite: 'static/coral1.png',
          foodType: FoodType.notfood,
        );
}

class Coral2 extends OceanStaticModel {
  Coral2({required super.position})
      : super(
          sprite: 'static/coral2.png',
          foodType: FoodType.notfood,
        );
}

class Coral3 extends OceanStaticModel {
  Coral3({required super.position})
      : super(
          sprite: 'static/coral3.png',
          foodType: FoodType.notfood,
        );
}
