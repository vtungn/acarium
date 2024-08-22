import 'package:carium/domain/entity/index.dart';
import 'package:carium/domain/index.dart';
import 'package:flame/components.dart';

enum QuestLevel {
  tutorial,
  q1,
  q2,
  q3,
  q4,
  q5,
  q6,
  q7,
}

sealed class QuestModel {
  final String title;
  final String description;
  final String? image;
  final int questTimeSec;
  final Map<OceanObjModel, int> requiredObject;
  final Map<OceanObjModel, int> reward;

  QuestModel(
      {required this.title,
      required this.description,
      required this.questTimeSec,
      required this.image,
      required this.requiredObject,
      required this.reward});
}

class QuestTutorial extends QuestModel {
  QuestTutorial()
      : super(
          title: 'Feeding Frenzy',
          description:
              'Seaweed is a source of food for your fish, and can regrow. Send you fish for an adventure to find the source of seaweed for your fish!',
          questTimeSec: 10,
          image: 'assets/images/quest/seaweed1.png',
          requiredObject: {Ngua(): 1},
          reward: {Seaweed1(position: Vector2.all(10)): 1},
        );
}
