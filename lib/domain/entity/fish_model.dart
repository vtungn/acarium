import 'package:carium/domain/entity/ocean_obj_model.dart';

sealed class Fish extends OceanObjModel {
  final double hunger;
  final int reproduceRate;

  final List<FoodType> food;

  Fish(
      {required this.hunger,
      required this.reproduceRate,
      super.foodType = FoodType.notfood,
      this.food = const [],
      required super.sprite});
}

class Bapbepxanh extends Fish {
  Bapbepxanh()
      : super(
          hunger: 100,
          reproduceRate: 5,
          sprite: 'bapnexanh.png',
          // foodType: FoodType.smallfish,
          food: [FoodType.seaweed, FoodType.algae],
        );
}

class Buommonhon extends Fish {
  Buommonhon()
      : super(
          hunger: 100,
          reproduceRate: 5,
          sprite: 'buommonhon.png',
          food: [FoodType.seaweed, FoodType.plankton],
        );
}

class Duoigai extends Fish {
  Duoigai()
      : super(
          hunger: 100,
          reproduceRate: 5,
          sprite: 'duoigai.png',
          food: [FoodType.seaweed],
        );
}

class Maotien extends Fish {
  Maotien()
      : super(
          hunger: 100,
          reproduceRate: 5,
          sprite: 'maotien.png',
          food: [FoodType.seaweed],
        );
}

class Maptrang extends Fish {
  Maptrang()
      : super(
          hunger: 100,
          reproduceRate: 5,
          sprite: 'maptrang.png',
          foodType: FoodType.bigfish,
          food: [FoodType.smallfish],
        );
}

class Moi extends Fish {
  Moi()
      : super(
          hunger: 100,
          reproduceRate: 5,
          sprite: 'moi.png',
          foodType: FoodType.smallfish,
          food: [FoodType.seaweed],
        );
}

class Ngua extends Fish {
  Ngua()
      : super(
          hunger: 100,
          reproduceRate: 5,
          sprite: 'ngua.png',
          food: [FoodType.seaweed],
        );
}

class Nguvayvang extends Fish {
  Nguvayvang()
      : super(
          hunger: 100,
          reproduceRate: 5,
          sprite: 'nguvayvang.png',
          food: [FoodType.seaweed],
        );
}

class Nguvayxanh extends Fish {
  Nguvayxanh()
      : super(
          hunger: 100,
          reproduceRate: 5,
          sprite: 'nguvayxanh.png',
          food: [FoodType.seaweed],
        );
}

class Thantien extends Fish {
  Thantien()
      : super(
          hunger: 100,
          reproduceRate: 5,
          sprite: 'thantien.png',
          food: [FoodType.seaweed],
        );
}

class Thu extends Fish {
  Thu()
      : super(
          hunger: 100,
          reproduceRate: 5,
          sprite: 'thu.png',
          food: [FoodType.seaweed],
        );
}

class Vogia extends Fish {
  Vogia()
      : super(
          hunger: 100,
          reproduceRate: 5,
          sprite: 'vogia.png',
          food: [FoodType.seaweed],
        );
}
