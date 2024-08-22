import 'package:carium/domain/entity/ocean_obj_model.dart';

sealed class Fish extends OceanObjModel {
  final double hungerTime;
  final double reproduceRate;
  final double spriteScale;
  final double oneFoodIncrease;
  final double hunger;
  final List<FoodType> food;

  Fish(
      {this.hungerTime = 0.2,
      this.reproduceRate = 5,
      this.spriteScale = 1,
      this.oneFoodIncrease = 80,
      this.hunger = 100,
      super.foodType = FoodType.notfood,
      this.food = const [],
      required super.sprite});
}

class Bapbepxanh extends Fish {
  Bapbepxanh()
      : super(
          sprite: 'bapnexanh.png',
          // foodType: FoodType.smallfish,
          hungerTime: 0.2,
          food: [FoodType.seaweed, FoodType.algae],
        );
}

class Buommonhon extends Fish {
  Buommonhon()
      : super(
          sprite: 'buommonhon.png',
          food: [FoodType.seaweed, FoodType.plankton],
        );
}

class Duoigai extends Fish {
  Duoigai()
      : super(
          sprite: 'duoigai.png',
          food: [FoodType.seaweed],
        );
}

class Maotien extends Fish {
  Maotien()
      : super(
          sprite: 'maotien.png',
          food: [FoodType.seaweed],
        );
}

class Maptrang extends Fish {
  Maptrang({super.hunger = 100})
      : super(
          sprite: 'maptrang.png',
          foodType: FoodType.bigfish,
          oneFoodIncrease: 10,
          food: [FoodType.smallfish],
        );
}

class Moi extends Fish {
  Moi()
      : super(
          sprite: 'moi.png',
          reproduceRate: 0.3,
          foodType: FoodType.smallfish,
          food: [FoodType.seaweed],
        );
}

class Ngua extends Fish {
  Ngua()
      : super(
          sprite: 'ngua.png',
          food: [FoodType.seaweed],
        );
}

class Nguvayvang extends Fish {
  Nguvayvang()
      : super(
          sprite: 'nguvayvang.png',
          food: [FoodType.seaweed],
        );
}

class Nguvayxanh extends Fish {
  Nguvayxanh()
      : super(
          sprite: 'nguvayxanh.png',
          food: [FoodType.seaweed],
        );
}

class Thantien extends Fish {
  Thantien()
      : super(
          sprite: 'thantien.png',
          food: [FoodType.seaweed],
        );
}

class Thu extends Fish {
  Thu()
      : super(
          sprite: 'thu.png',
          food: [FoodType.seaweed],
        );
}

class Vogia extends Fish {
  Vogia()
      : super(
          sprite: 'vogia.png',
          food: [FoodType.seaweed],
        );
}
