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
  final List<Map<OceanObjModel, int>> requiredObject;
  final List<Map<OceanObjModel, int>> reward;

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
          title: 'Tutorial',
          description:
              'Welcome to Carium! Here your first step into the deep ocean. ',
          questTimeSec: 10,
          image: 'quest/seaweed1.png',
          requiredObject: [
            {Bapbepxanh(): 1}
          ],
          reward: [
            {Seaweed1(position: Vector2.all(10)): 1}
          ],
        );
}
