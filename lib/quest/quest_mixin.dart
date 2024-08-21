import 'package:carium/domain/entity/quest_model.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';

mixin QuestMixin on FlameGame {
  QuestModel nextQuest = QuestTutorial();
  QuestState qState = QuestState.idle;
  int timerDisplay = 0;
  double questDt = 0;
  TimerComponent? timer;
  QuestModel? currentQuest;
  void startQuest() {
    qState = QuestState.questStarted;
    overlays.remove('quest');
    timerDisplay = nextQuest.questTimeSec;
    currentQuest = nextQuest;
    timer = TimerComponent(
        period: nextQuest.questTimeSec.toDouble(),
        removeOnFinish: true,
        onTick: () {
          // success
          print('done!!');
          qState = QuestState.questSuccess;
        });
    add(timer!);
  }

  void nextQuestPress() {
    qState = QuestState.questSkip;
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
  questFailed,
  questSkip,
}
