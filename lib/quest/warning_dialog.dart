import 'package:carium/acarium_flame_game.dart';
import 'package:flutter/material.dart';

class WarningDialog extends StatelessWidget {
  final Acarium game;
  const WarningDialog(
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
              const Text(
                '⚠️',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 12),
              const Text(
                  'You not have enough resources to complete this quest.'),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: game.doneAndWaitNextQuest,
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
