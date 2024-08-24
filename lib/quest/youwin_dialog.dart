// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carium/acarium_flame_game.dart';
import 'package:carium/domain/index.dart';
import 'package:flutter/material.dart';

class YouwinDialog extends StatelessWidget {
  final Acarium game;
  const YouwinDialog(
    this.game, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final questShow = game.currentQuest!;
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
                (questShow is MedQuestNavigate)
                    ? 'You move to a new water'
                    : 'You received:',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 12),
              if (questShow.image != null)
                Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/quest/questbg.jpg',
                        width: 150,
                        height: 150,
                      ),
                    ),
                    Image.asset(
                      'assets/images/${questShow.reward.keys.first.sprite}',
                      width: 90,
                      height: 90,
                    ),
                  ],
                ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => game.doneAndWaitNextQuest(isWin: true),
                    child: const Text('Done'),
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
