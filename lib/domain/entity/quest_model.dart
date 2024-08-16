import 'package:carium/domain/entity/ocean_obj_model.dart';
import 'package:carium/domain/entity/reward_model.dart';

class QuestModel {
  final String title;
  final String description;
  final String? image;
  final List<OceanObjModel> requiredObject;
  final List<RewardQuestModel> reward;

  QuestModel(
      {required this.title,
      required this.description,
      required this.image,
      required this.requiredObject,
      required this.reward});
}
