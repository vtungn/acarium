import 'dart:async';

import 'package:carium/acarium_flame_game.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';

class BubbleBtnComponent extends SpriteComponent
    with HasGameRef<Acarium>, TapCallbacks {
  BubbleBtnComponent({required super.position});
  @override
  FutureOr<void> onLoad() {
    sprite = Sprite(game.images.fromCache('speech.png'));
    return super.onLoad();
  }

  @override
  void onTapUp(TapUpEvent event) {
    print('taptap');
    super.onTapUp(event);
  }
}
