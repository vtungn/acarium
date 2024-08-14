import 'package:carium/acarium_flame_game.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(builder: (context) {
        return Scaffold(
          body: Column(
            children: [
              TextButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return GameWidget(game: Acarium());
                    }));
                  },
                  label: const Text('New Game')),
              TextButton.icon(onPressed: () {}, label: const Text('Settings')),
            ],
          ),
        );
      }),
    );
  }
}
