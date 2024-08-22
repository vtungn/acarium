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
  // List<QuestModel> questList = [];
  final nextQuestTimer = Timer(secBtwQuest);

  @override
  FutureOr<void> onLoad() {
    // questList = questsSmallAqua;
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
      sendTroopToFinishQuest();
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
    overlays.add('quest_success');
    for (var oceanObj in currentQuest!.reward.keys) {
      final rewardAmount = currentQuest!.reward[oceanObj]!;
      if (oceanObj is OceanStaticModel) {
        final staticClose = descendants().whereType<StaticObjNearLayer>().first;
        for (var i = 0; i < rewardAmount; i++) {
          staticClose.add(OceanObjComponent(oceanObj: oceanObj));
        }
      }
      if (oceanObj is Fish) {
        final fishClose = descendants().whereType<FishLayerNear>().first;
        final rnd = Random();
        for (var i = 0; i < rewardAmount; i++) {
          fishClose.add(FishComponent(
            fish: oceanObj,
            position: Vector2(
                rnd.nextDouble() * tvWidth, rnd.nextDouble() * tvHeight),
            directionVector:
                Vector2(rnd.nextDouble() * 1 - 0.5, rnd.nextDouble() * 1 - 0.5),
          ));
        }
      }
    }
    for (var oceanObj in currentQuest!.requiredObject.keys) {
      final returnAmount = currentQuest!.requiredObject[oceanObj]!;
      if (oceanObj is OceanStaticModel) {
        final staticClose = descendants().whereType<StaticObjNearLayer>().first;
        for (var i = 0; i < returnAmount; i++) {
          staticClose.add(OceanObjComponent(oceanObj: oceanObj));
        }
      }
      if (oceanObj is Fish) {
        final fishClose = descendants().whereType<FishLayerNear>().first;
        final rnd = Random();
        for (var i = 0; i < returnAmount; i++) {
          fishClose.add(FishComponent(
            fish: oceanObj,
            position: Vector2(
                rnd.nextDouble() * tvWidth, rnd.nextDouble() * tvHeight),
            directionVector:
                Vector2(rnd.nextDouble() * 1 - 0.5, rnd.nextDouble() * 1 - 0.5),
          ));
        }
      }
    }
  }

  Future sendTroopToFinishQuest() async {
    for (var type in currentQuest!.requiredObject.keys) {
      // final type = element.keys;
      var questAmount = currentQuest!.requiredObject[type]!;

      for (var i = 0; i < questAmount; i++) {
        final eliminate = descendants().firstWhere((obj) {
          if (obj is FishComponent) {
            return obj.fish.runtimeType == type.runtimeType;
          }
          if (obj is OceanObjComponent) {
            return obj.oceanObj.runtimeType == type.runtimeType;
          }
          return false;
        });
        eliminate.removeFromParent();
        await eliminate.removed;
      }
    }
  }

  bool questCost() {
    for (var type in currentQuest!.requiredObject.keys) {
      // final type = element.keys;
      var questAmount = currentQuest!.requiredObject[type]!;
      final tankAmount = descendants().where((obj) {
        if (obj is FishComponent) {
          return obj.fish.runtimeType == type.runtimeType;
        }
        if (obj is OceanObjComponent) {
          return obj.oceanObj.runtimeType == type.runtimeType;
        }
        return false;
      });

      if (questAmount > tankAmount.length) {
        overlays.add('quest_fail_require');
        return false;
      }
    }

    return true;
  }

  void doneAndWaitNextQuest() {
    overlays.remove('quest_success');
    overlays.remove('quest_fail_require');
    overlays.remove('quest');

    qState = QuestState.idle;
    final crab = descendants().whereType<CrabComponent>().first;
    crab.removeWhere((com) => com is BubbleBtnComponent);
    prepareNextQuest();
  }

  void prepareNextQuest({bool firstQuest = false}) {
    if (qState != QuestState.idle) return;
    final newQuest = firstQuest ? QuestTutorial() : questsSmallAqua.random();
    questsSmallAqua.remove(newQuest);
    nextQuest = newQuest;
    nextQuestTimer.reset();
    nextQuestTimer.start();
  }
}

List<QuestModel> questsSmallAqua = [
  QuestTutorial(),
  SmallQuest1(),
  SmallQuest2(),
  SmallQuest3(),
];
List questsMedAqua = [];

enum QuestState {
  idle,
  newQuestAvailable,
  questStarted,
  questSuccess,
  questFailed,
  questSkip,
  gameover,
}
