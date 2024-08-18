import 'package:carium/domain/entity/ocean_obj_model.dart';

sealed class Fish extends OceanObjModel {
  final double hunger;
  final int reproduceRate;
  final List<OceanObj> food;
  final List<OceanObj> predators;

  Fish(
      {required this.hunger,
      required this.reproduceRate,
      this.food = const [],
      this.predators = const [],
      required super.sprite});
}

class Smallfish1 extends Fish {
  Smallfish1()
      : super(
          hunger: 100,
          reproduceRate: 5,
          sprite: 'fish1.png',
          food: [OceanObj.seaweed1],
        );
}

class Smallfish2 extends Fish {
  Smallfish2()
      : super(
          hunger: 100,
          reproduceRate: 5,
          sprite: 'moi.png',
          food: [OceanObj.seaweed1],
        );
}

class Shark1 extends Fish {
  Shark1()
      : super(
          hunger: 100,
          reproduceRate: 5,
          sprite: 'shark2.png',
          food: [OceanObj.smallfish1, OceanObj.smallfish2],
        );
}
