// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carium/acarium_flame_game.dart';
import 'package:flutter/material.dart';

class QuestTemplate extends StatelessWidget {
  final Acarium game;
  const QuestTemplate(
    this.game, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final questShow = game.nextQuest;
    return Center(
        child: Dialog(
      child: SizedBox(
        width: 100,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                questShow.title,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 12),
              Text(questShow.description),
              const SizedBox(height: 12),
              Text('Quest duration: ${questShow.questTimeSec}s'),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: game.nextQuestPress,
                    child: const Text('Skip'),
                  ),
                  ElevatedButton(
                    onPressed: game.startQuest,
                    child: const Text('Start'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
