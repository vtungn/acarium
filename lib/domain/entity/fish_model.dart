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

class Bapbepxanh extends Fish {
  Bapbepxanh()
      : super(
          hunger: 100,
          reproduceRate: 5,
          sprite: 'bapnexanh.png',
          food: [OceanObj.seaweed1],
        );
}

class Buommonhon extends Fish {
  Buommonhon()
      : super(
          hunger: 100,
          reproduceRate: 5,
          sprite: 'buommonhon.png',
          food: [OceanObj.seaweed1],
        );
}

class Duoigai extends Fish {
  Duoigai()
      : super(
          hunger: 100,
          reproduceRate: 5,
          sprite: 'duoigai.png',
          food: [OceanObj.seaweed1],
        );
}

class Maotien extends Fish {
  Maotien()
      : super(
          hunger: 100,
          reproduceRate: 5,
          sprite: 'maotien.png',
          food: [OceanObj.seaweed1],
        );
}

class Maptrang extends Fish {
  Maptrang()
      : super(
          hunger: 100,
          reproduceRate: 5,
          sprite: 'maptrang.png',
          food: [OceanObj.seaweed1],
        );
}

class Moi extends Fish {
  Moi()
      : super(
          hunger: 100,
          reproduceRate: 5,
          sprite: 'moi.png',
          food: [OceanObj.seaweed1],
        );
}

class Ngua extends Fish {
  Ngua()
      : super(
          hunger: 100,
          reproduceRate: 5,
          sprite: 'ngua.png',
          food: [OceanObj.seaweed1],
        );
}

class Nguvayvang extends Fish {
  Nguvayvang()
      : super(
          hunger: 100,
          reproduceRate: 5,
          sprite: 'nguvayvang.png',
          food: [OceanObj.seaweed1],
        );
}

class Nguvayxanh extends Fish {
  Nguvayxanh()
      : super(
          hunger: 100,
          reproduceRate: 5,
          sprite: 'nguvayxanh.png',
          food: [OceanObj.seaweed1],
        );
}

class Thantien extends Fish {
  Thantien()
      : super(
          hunger: 100,
          reproduceRate: 5,
          sprite: 'thantien.png',
          food: [OceanObj.seaweed1],
        );
}

class Thu extends Fish {
  Thu()
      : super(
          hunger: 100,
          reproduceRate: 5,
          sprite: 'thu.png',
          food: [OceanObj.seaweed1],
        );
}

class Vogia extends Fish {
  Vogia()
      : super(
          hunger: 100,
          reproduceRate: 5,
          sprite: 'vogia.png',
          food: [OceanObj.seaweed1],
        );
}
