import 'package:carium/domain/entity/quest_model.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';

mixin QuestMixin on FlameGame {
  QuestModel nextQuest = QuestTutorial();
  int timerDisplay = 0;
  double questDt = 0;
  TimerComponent? timer;
  QuestModel? currentQuest;
  void startQuest() {
    overlays.remove('quest');
    timerDisplay = nextQuest.questTimeSec;
    currentQuest = nextQuest;
    timer = TimerComponent(
        period: nextQuest.questTimeSec.toDouble(),
        removeOnFinish: true,
        onTick: () {
          // success

          nextQuestPress();
        });
    add(timer!);
  }

  void nextQuestPress() {
    overlays.remove('quest');
    if (nextQuest is QuestTutorial) {
      nextQuest = QuestTutorial();
    } else {
      nextQuest = QuestTutorial();
    }
  }
}

enum QuestState {
  idle,
  questStarted,
  questSuccess,
  questSkip,
}
