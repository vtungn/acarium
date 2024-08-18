abstract class OceanObjModel {
  final String sprite;
  final FoodType foodType;
  OceanObjModel({required this.foodType, required this.sprite});
}

enum FoodType {
  notfood,
  poison,
  seaweed,
  algae,
  plankton,
  smallfish,
  bigfish,
}
