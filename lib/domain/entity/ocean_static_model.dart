import 'package:carium/domain/entity/index.dart';
import 'package:flame/components.dart';

sealed class OceanStaticModel extends OceanObjModel {
  final Vector2 position;
  final double regenRate;
  final bool canDrag;
  OceanStaticModel({
    this.regenRate = 0,
    this.canDrag = true,
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
          canDrag: false,
          foodType: FoodType.notfood,
        );
}

class Rock2 extends OceanStaticModel {
  Rock2({required super.position})
      : super(
          sprite: 'static/rock2.png',
          canDrag: false,
          foodType: FoodType.notfood,
        );
}

class Rock3 extends OceanStaticModel {
  Rock3({required super.position})
      : super(
          sprite: 'static/rock3.png',
          canDrag: false,
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

class Coral4 extends OceanStaticModel {
  Coral4({required super.position})
      : super(
          sprite: 'static/coral4.png',
          foodType: FoodType.notfood,
        );
}

class Coral5 extends OceanStaticModel {
  Coral5({required super.position})
      : super(
          sprite: 'static/coral5.png',
          foodType: FoodType.notfood,
        );
}

class Coral6 extends OceanStaticModel {
  Coral6({required super.position})
      : super(
          sprite: 'static/coral6.png',
          foodType: FoodType.notfood,
        );
}

class Coral7 extends OceanStaticModel {
  Coral7({required super.position})
      : super(
          sprite: 'static/coral7.png',
          foodType: FoodType.notfood,
        );
}

class Coral8 extends OceanStaticModel {
  Coral8({required super.position})
      : super(
          sprite: 'static/coral8.png',
          foodType: FoodType.notfood,
        );
}

class Coral9 extends OceanStaticModel {
  Coral9({required super.position})
      : super(
          sprite: 'static/coral9.png',
          foodType: FoodType.notfood,
        );
}

class Coral10 extends OceanStaticModel {
  Coral10({required super.position})
      : super(
          sprite: 'static/coral10.png',
          foodType: FoodType.notfood,
        );
}

class Coral11 extends OceanStaticModel {
  Coral11({required super.position})
      : super(
          sprite: 'static/coral11.png',
          foodType: FoodType.notfood,
        );
}

class Coral12 extends OceanStaticModel {
  Coral12({required super.position})
      : super(
          sprite: 'static/coral12.png',
          foodType: FoodType.notfood,
        );
}

class Coral13 extends OceanStaticModel {
  Coral13({required super.position})
      : super(
          sprite: 'static/coral13.png',
          foodType: FoodType.notfood,
        );
}

class Coral14 extends OceanStaticModel {
  Coral14({required super.position})
      : super(
          sprite: 'static/coral14.png',
          foodType: FoodType.notfood,
        );
}

class Coral15 extends OceanStaticModel {
  Coral15({required super.position})
      : super(
          sprite: 'static/coral15.png',
          foodType: FoodType.notfood,
        );
}

class Coral16 extends OceanStaticModel {
  Coral16({required super.position})
      : super(
          sprite: 'static/coral16.png',
          foodType: FoodType.notfood,
        );
}

class Coral17 extends OceanStaticModel {
  Coral17({required super.position})
      : super(
          sprite: 'static/coral17.png',
          foodType: FoodType.notfood,
        );
}

class Coral18 extends OceanStaticModel {
  Coral18({required super.position})
      : super(
          sprite: 'static/coral18.png',
          foodType: FoodType.notfood,
        );
}

class Coral19 extends OceanStaticModel {
  Coral19({required super.position})
      : super(
          sprite: 'static/coral19.png',
          foodType: FoodType.notfood,
        );
}

class Coral20 extends OceanStaticModel {
  Coral20({required super.position})
      : super(
          sprite: 'static/coral20.png',
          foodType: FoodType.notfood,
        );
}

class Coral21 extends OceanStaticModel {
  Coral21({required super.position})
      : super(
          sprite: 'static/coral21.png',
          foodType: FoodType.notfood,
        );
}

class Coral22 extends OceanStaticModel {
  Coral22({required super.position})
      : super(
          sprite: 'static/coral22.png',
          foodType: FoodType.notfood,
        );
}

class CoralLayer1 extends OceanStaticModel {
  CoralLayer1({required super.position})
      : super(
          sprite: 'static/Corallayer1.png',
          canDrag: false,
          foodType: FoodType.notfood,
        );
}

class CoralLayer2 extends OceanStaticModel {
  CoralLayer2({required super.position})
      : super(
          sprite: 'static/Corallayer2.png',
          canDrag: false,
          regenRate: 0.1,
          foodType: FoodType.seaweed,
        );
}

class CoralLayer3 extends OceanStaticModel {
  CoralLayer3({required super.position})
      : super(
          sprite: 'static/Corallayer3.png',
          canDrag: false,
          regenRate: 0.1,
          foodType: FoodType.seaweed,
        );
}

class CoralLayer4 extends OceanStaticModel {
  CoralLayer4({required super.position})
      : super(
          sprite: 'static/Corallayer4.png',
          canDrag: false,
          foodType: FoodType.notfood,
        );
}

class Sand1 extends OceanStaticModel {
  Sand1({required super.position})
      : super(
          sprite: 'static/cat1.png',
          canDrag: false,
          foodType: FoodType.notfood,
        );
}

class Sand2 extends OceanStaticModel {
  Sand2({required super.position})
      : super(
          sprite: 'static/cat2.png',
          canDrag: false,
          foodType: FoodType.notfood,
        );
}

class Sand3 extends OceanStaticModel {
  Sand3({required super.position})
      : super(
          sprite: 'static/cat3.png',
          canDrag: false,
          foodType: FoodType.notfood,
        );
}

class Shell1 extends OceanStaticModel {
  Shell1({required super.position})
      : super(
          sprite: 'static/Shell1.png',
          foodType: FoodType.notfood,
        );
}

class Shell2 extends OceanStaticModel {
  Shell2({required super.position})
      : super(
          sprite: 'static/Shell2.png',
          foodType: FoodType.notfood,
        );
}

class Shell3 extends OceanStaticModel {
  Shell3({required super.position})
      : super(
          sprite: 'static/Shell3.png',
          foodType: FoodType.notfood,
        );
}

class Shell4 extends OceanStaticModel {
  Shell4({required super.position})
      : super(
          sprite: 'static/Shell4.png',
          foodType: FoodType.notfood,
        );
}

class Shell5 extends OceanStaticModel {
  Shell5({required super.position})
      : super(
          sprite: 'static/Shell5.png',
          foodType: FoodType.notfood,
        );
}

class Shell6 extends OceanStaticModel {
  Shell6({required super.position})
      : super(
          sprite: 'static/Shell6.png',
          foodType: FoodType.notfood,
        );
}

class Shell7 extends OceanStaticModel {
  Shell7({required super.position})
      : super(
          sprite: 'static/Shell7.png',
          foodType: FoodType.notfood,
        );
}

class Shell8 extends OceanStaticModel {
  Shell8({required super.position})
      : super(
          sprite: 'static/Shell8.png',
          foodType: FoodType.notfood,
        );
}

class Shell9 extends OceanStaticModel {
  Shell9({required super.position})
      : super(
          sprite: 'static/Shell9.png',
          foodType: FoodType.notfood,
        );
}

class Starfish1 extends OceanStaticModel {
  Starfish1({required super.position})
      : super(
          sprite: 'static/Starfish1.png',
          foodType: FoodType.notfood,
        );
}

class Starfish2 extends OceanStaticModel {
  Starfish2({required super.position})
      : super(
          sprite: 'static/Starfish2.png',
          foodType: FoodType.notfood,
        );
}

class Starfish3 extends OceanStaticModel {
  Starfish3({required super.position})
      : super(
          sprite: 'static/Starfish3.png',
          foodType: FoodType.notfood,
        );
}

class Starfish4 extends OceanStaticModel {
  Starfish4({required super.position})
      : super(
          sprite: 'static/Starfish4.png',
          foodType: FoodType.notfood,
        );
}
