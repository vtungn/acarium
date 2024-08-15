import 'package:carium/domain/entity/index.dart';
import 'package:flame/components.dart';

sealed class OceanStaticModel extends OceanObjModel {
  final Vector2 position;
  OceanStaticModel({required this.position, required super.sprite});
}

class Seaweed1 extends OceanStaticModel {
  Seaweed1({required super.position}) : super(sprite: 'static/seaweed1.png');
}

class Coral1 extends OceanStaticModel {
  Coral1({required super.position}) : super(sprite: 'coral.png');
}
