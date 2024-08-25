import 'package:carium/acarium_flame_game.dart';
import 'package:flutter/material.dart' hide Image, Gradient;

class Youwin extends StatelessWidget {
  const Youwin(this.game, {super.key});

  final Acarium game;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'You win',
              style: textTheme.displayLarge,
            ),
            const SizedBox(height: 10),
            Text(
              'All fish is alive, enjoy the relax aquarium',
              style: textTheme.bodyLarge,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Restart'),
            ),
          ],
        ),
      ),
    );
  }
}
