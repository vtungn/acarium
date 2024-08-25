import 'package:carium/acarium_flame_game.dart';
import 'package:carium/quest/index.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    FlameAudio.bgm.initialize();
    FlameAudio.bgm.play('nobody.mp3');
    _controller = VideoPlayerController.asset('assets/main_menu.mp4',
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        _controller.setLooping(true);
        _controller.play();

        setState(() {});
      });
  }

  @override
  void dispose() {
    FlameAudio.bgm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Brixton'),
      home: Builder(builder: (context) {
        return Scaffold(
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                VideoPlayer(_controller),
                Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Acarium',
                          style: TextStyle(
                            fontFamily: 'Shell',
                            fontSize: 100,
                            color: Color(0xff1098af),
                          ),
                        ),
                        _TextBtnMenu(
                          text: 'New game',
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) {
                                      return GameWidget<Acarium>(
                                        game: Acarium(),
                                        mouseCursor: SystemMouseCursors.move,
                                        overlayBuilderMap: {
                                          'quest': (_, game) =>
                                              QuestTemplate(game),
                                          'quest_success': (_, game) =>
                                              YouwinDialog(game),
                                          'game_over': (_, game) =>
                                              GameOver(game),
                                          'you_win': (_, game) => Youwin(game),
                                          'quest_fail_require': (_, game) =>
                                              WarningDialog(game),
                                        },
                                      );
                                    },
                                    maintainState: false));
                          },
                        ),
                        // _TextBtnMenu(
                        //   text: 'Settings',
                        //   onPressed: () {
                        //     // show the overlay settings
                        //   },
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class _TextBtnMenu extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const _TextBtnMenu({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset('assets/menubtn.png'),
          Center(
              child: TextButton(
                  onPressed: onPressed,
                  // style: ButtonStyle(),
                  child: Text(
                    text,
                    style: const TextStyle(
                      color: Color(0xff204450),
                      fontSize: 56,
                    ),
                  )))
        ],
      ),
    );
  }
}
