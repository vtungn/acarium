import 'package:carium/domain/index.dart';

class OceanAnimModel extends OceanObjModel {
  final double size;
  final int frames;
  OceanAnimModel({
    required this.size,
    required this.frames,
    required super.foodType,
    required super.sprite,
  });
}
