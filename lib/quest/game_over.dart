import 'package:carium/acarium_flame_game.dart';
import 'package:flutter/material.dart' hide Image, Gradient;

class GameOver extends StatelessWidget {
  const GameOver(this.game, {super.key});

  final Acarium game;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Wrap(
          children: [
            Text(
              'Player  wins!',
              style: textTheme.displayLarge,
            ),
            const SizedBox(height: 10),
            Text(
              'Time: ',
              style: textTheme.bodyLarge,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Restart'),
            ),
          ],
        ),
      ),
    );
  }
}
