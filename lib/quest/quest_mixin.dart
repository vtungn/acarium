import 'dart:async';
import 'dart:math';

import 'package:carium/character/bubble_btn_component.dart';
import 'package:carium/character/crab_component.dart';
import 'package:carium/character/fish_component.dart';
import 'package:carium/character/ocean_obj_component.dart';
import 'package:carium/config/constants.dart';
import 'package:carium/domain/index.dart';
import 'package:carium/level/index.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/game.dart';

mixin QuestMixin on FlameGame {
  QuestModel nextQuest = QuestTutorial();
  QuestState qState = QuestState.idle;
  int timerDisplay = 0;
  double questDt = 0;
  TimerComponent? timer;
  QuestModel? currentQuest;
  final nextQuestTimer = Timer(secBtwQuest);

  @override
  FutureOr<void> onLoad() {
    prepareNextQuest();
    nextQuestTimer.onTick = () {
      qState = QuestState.newQuestAvailable;
      final crab = descendants().whereType<CrabComponent>().first;
      crab.add(BubbleBtnComponent(
        position: Vector2(-230, -230),
      ));
    };
    return super.onLoad();
  }

  @override
  void update(double dt) {
    nextQuestTimer.update(dt);
    super.update(dt);
  }

  void startQuest() {
    overlays.remove('quest');
    currentQuest = nextQuest;
    if (questCost()) {
      qState = QuestState.questStarted;
      timerDisplay = currentQuest!.questTimeSec;
      timer = TimerComponent(
          period: nextQuest.questTimeSec.toDouble(),
          removeOnFinish: true,
          onTick: () {
            rewardToGame();
            qState = QuestState.questSuccess;
          });
      add(timer!);
    }
  }

  rewardToGame() {
    for (var oceanObj in currentQuest!.reward.keys) {
      // final type = element.keys;
      if (oceanObj is OceanStaticModel) {
        final staticClose = descendants().whereType<StaticObjNearLayer>().first;
        staticClose.add(OceanObjComponent(oceanObj: oceanObj));
      }
      if (oceanObj is Fish) {
        final fishClose = descendants().whereType<FishLayerNear>().first;
        final rnd = Random();
        fishClose.add(FishComponent(
          fish: oceanObj,
          position:
              Vector2(rnd.nextDouble() * tvWidth, rnd.nextDouble() * tvHeight),
          directionVector:
              Vector2(rnd.nextDouble() * 1 - 0.5, rnd.nextDouble() * 1 - 0.5),
        ));
      }
    }
  }

  bool questCost() {
    for (var type in currentQuest!.requiredObject.keys) {
      // final type = element.keys;
      final questAmount = currentQuest!.requiredObject[type]!;
      final tankAmount =
          descendants().where((obj) => obj.runtimeType == type.runtimeType);
      if (questAmount > tankAmount.length) {
        overlays.add('quest_fail_require');
        return false;
      }
      tankAmount
          .take(questAmount)
          .map((oceanElement) => oceanElement.removeFromParent());
    }
    return true;
  }

  void doneAndWaitNextQuest() {
    overlays.remove('quest_success');
    overlays.remove('quest_fail_require');
    overlays.remove('quest');
    qState = QuestState.idle;
    removeWhere((com) => com is BubbleBtnComponent);
    prepareNextQuest();
  }

  void prepareNextQuest({double? questTime}) {
    if (qState != QuestState.idle) return;
    final newQuest = questsSmallAqua.random();
    nextQuest = newQuest;
  }
}

List<QuestModel> questsSmallAqua = [
  QuestTutorial(),
];
List questsMedAqua = [];

enum QuestState {
  idle,
  newQuestAvailable,
  questStarted,
  questSuccess,
  questFailed,
  questSkip,
}
