import 'package:carium/domain/entity/index.dart';
import 'package:carium/domain/index.dart';
import 'package:flame/components.dart';

// enum QuestLevel {
//   tutorial,
//   q1,
//   q2,
//   q3,
//   q4,
//   q5,
//   q6,
//   q7,
// }

sealed class QuestModel {
  final String title;
  final String description;
  final String? image;
  final int questTimeSec;
  final Map<OceanObjModel, int> requiredObject;
  final Map<OceanObjModel, int> reward;
  final bool canReplay;

  QuestModel(
      {required this.title,
      required this.description,
      required this.questTimeSec,
      required this.image,
      this.canReplay = false,
      required this.requiredObject,
      required this.reward});
}

class QuestTutorial extends QuestModel {
  QuestTutorial()
      : super(
          title: 'Feeding Frenzy',
          description:
              'Seaweed is a source of food for your fish, and can regrow. Send you fish for an adventure to find the source of seaweed for your fish!',
          questTimeSec: 15,
          image: 'assets/images/static/seaweed2.png',
          canReplay: true,
          requiredObject: {Moi(): 4},
          reward: {Seaweed2(position: Vector2(1167, 683)): 1},
        );
}

class SmallQuest1 extends QuestModel {
  SmallQuest1()
      : super(
          title: 'Coral need your help',
          description:
              "Collect this radiant coral to enhance your aquarium's beauty and boost the health of your marine life. But beware—territorial sea creatures guard this treasure. Secure the coral to create a vibrant, thriving habitat",
          questTimeSec: 10,
          image: 'assets/images/static/coral2.png',
          requiredObject: {Moi(): 4},
          canReplay: false,
          reward: {
            Coral1(position: Vector2(-93 / 2, 858 / 2)): 1,
            Coral2(position: Vector2(3369 / 2, 912 / 2)): 1,
            Coral3(position: Vector2(2828 / 2, 1576 / 2)): 1,
          },
        );
}

class SmallQuest2 extends QuestModel {
  SmallQuest2()
      : super(
          title: 'A new fish',
          description:
              "Whispers tell of a mysterious fish that only appears under specific conditions. Venture to the moonlit shores of the Whispering Lagoon, where the water shimmers with an ethereal glow. Solve the ancient puzzle hidden within the coral formations to lure the enigmatic fish into your nets. Capture this rare species to add an air of mystery and allure to your aquarium, drawing the awe of all who see it",
          questTimeSec: 10,
          canReplay: false,
          image: 'assets/images/quest/qmark.png',
          requiredObject: {Moi(): 2},
          reward: {
            Maptrang(hunger: 25, speedA: 3): 1,
          },
        );
}

class SmallQuest3 extends QuestModel {
  SmallQuest3()
      : super(
          title: 'Perfect Habitat',
          description:
              "Collect this radiant coral to enhance your aquarium's beauty and boost the health of your marine life. But beware—territorial sea creatures guard this treasure. Secure the coral to create a vibrant, thriving habitat",
          questTimeSec: 10,
          canReplay: true,
          image: 'assets/images/maotien.png',
          requiredObject: {Moi(): 3},
          reward: {
            Maotien(): 1,
            Duoigai(): 1,
            Buommonhon(): 1,
            Moi(): 3,
          },
        );
}

class MedQuestNavigate extends QuestModel {
  MedQuestNavigate()
      : super(
          title: 'Navigate the Coral Reef',
          description:
              'Legends tell of an ancient shipwreck filled with gold and rare artifacts lying in the Graveyard of Ships. Brave the depths, solve the riddles left by the ship’s captain, and retrieve the lost treasures. Beware of the cursed spirits that guard their riches jealously',
          questTimeSec: 20,
          image: 'assets/images/static/Corallayer3.png',
          requiredObject: {
            Moi(): 8,
          },
          reward: {
            Coral1(position: Vector2(-93 / 2, 858 / 2)): 1,
          },
        );
}

class MedQuest3 extends QuestModel {
  MedQuest3()
      : super(
          title: 'Protect the Hatchlings',
          description:
              "A school of newly hatched Mackerel needs to reach the open ocean, but dangerous predators and obstacles stand in their way. Guide them safely",
          questTimeSec: 10,
          image: 'assets/images/thu.png',
          canReplay: true,
          requiredObject: {Thu(): 9},
          reward: {
            Thu(): 2,
            Buommonhon(spriteScale: 0.5): 5,
          },
        );
}

class MedQuest4 extends QuestModel {
  MedQuest4()
      : super(
          title: 'Save the Tuna',
          description:
              "A majestic tuna has become entangled in a dangerous ghost net drifting in the open ocean. The powerful fish is struggling to break free, weakening with each passing moment. Dive into the deep waters, carefully cut away the net, and free the tuna before it's too late",
          questTimeSec: 10,
          canReplay: true,
          image: 'assets/images/nguvayxanh.png',
          requiredObject: {Thu(): 5},
          reward: {
            Nguvayvang(): 1,
            Nguvayxanh(): 2,
          },
        );
}

class MedQuest5 extends QuestModel {
  MedQuest5()
      : super(
          title: 'The Lost Pearl',
          description:
              "Rumors speak of a legendary pearl hidden deep within the coral caves of the Abyssal Trench. Ancient guardians protect it, and only the bravest can retrieve it. Navigate the treacherous waters, avoid the lurking predators, and bring back the Lost Pearl to prove your worth to the Ocean King",
          questTimeSec: 10,
          image: 'assets/images/static/Shell8.png',
          requiredObject: {Nguvayxanh(): 1},
          canReplay: false,
          reward: {
            Shell1(position: Vector2(959, 677)): 1,
          },
        );
}

class MedQuest6 extends QuestModel {
  MedQuest6()
      : super(
          title: 'The shark is back',
          description: "Follow the Bluefin Tuna, the shark is back",
          questTimeSec: 5,
          image: 'assets/images/maptrang.png',
          requiredObject: {Shell1(position: Vector2(959, 677)): 1},
          reward: {
            Maptrang(hunger: 25, speedA: 3): 1,
          },
        );
}

class YouWinGameQuest extends QuestModel {
  YouWinGameQuest()
      : super(
          title: 'To be continued',
          description: "Acarium will continue to update",
          questTimeSec: 2,
          image: 'assets/images/quest/qmark.png',
          requiredObject: {Thu(): 1},
          reward: {
            Maptrang(hunger: 25, speedA: 3): 1,
          },
        );
}
