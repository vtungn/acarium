import 'package:carium/domain/entity/ocean_obj_model.dart';

sealed class Fish extends OceanObjModel {
  final double hungerTime;
  final double reproduceRate;
  final double spriteScale;
  final double oneFoodIncrease;
  final double speedA;
  final double hunger;
  final List<FoodType> food;

  Fish(
      {this.hungerTime = 0.2,
      this.reproduceRate = 5,
      this.spriteScale = 1,
      this.speedA = 1,
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
  Buommonhon({super.spriteScale})
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
  Maotien({super.spriteScale})
      : super(
          sprite: 'maotien.png',
          food: [FoodType.seaweed],
        );
}

class Maptrang extends Fish {
  Maptrang({
    super.hunger = 10,
    super.speedA = 2,
    super.oneFoodIncrease = 10,
  }) : super(
          sprite: 'maptrang.png',
          foodType: FoodType.notfood,
          food: [FoodType.smallfish, FoodType.bigfish],
        );
}

class Moi extends Fish {
  Moi()
      : super(
          sprite: 'moi.png',
          reproduceRate: 1,
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
          reproduceRate: 10,
          food: [FoodType.seaweed],
        );
}

class Nguvayxanh extends Fish {
  Nguvayxanh()
      : super(
          sprite: 'nguvayxanh.png',
          reproduceRate: 10,
          food: [FoodType.smallfish],
        );
}

class Thantien extends Fish {
  Thantien()
      : super(
          sprite: 'thantien.png',
          food: [FoodType.smallfish],
        );
}

class Thu extends Fish {
  Thu({super.speedA = 1, super.spriteScale = 1})
      : super(
          sprite: 'thu.png',
          reproduceRate: 0.5,
          foodType: FoodType.smallfish,
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
