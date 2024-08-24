import 'dart:async';
import 'dart:math' as math;

import 'package:carium/acarium_flame_game.dart';
import 'package:flame/components.dart';
import 'package:flame/rendering.dart';

class BackgroundLayer extends Component with HasGameRef<Acarium> {
  final String backgroundImage;

  BackgroundLayer(
      {super.children,
      super.priority,
      super.key,
      required this.backgroundImage});
  @override
  FutureOr<void> onLoad() {
    add(SpriteComponent.fromImage(game.images.fromCache(backgroundImage)));
    return super.onLoad();
  }
}

class StaticObjFarLayer extends Component {}

class FishLayerFar extends Component {}

class StaticObjNearLayer extends Component {}

class FishLayerNear extends Component {}

class CloseupLayer extends Component with HasGameRef<Acarium> {
  @override
  FutureOr<void> onLoad() async {
    final rnd = math.Random();
    add(TimerComponent(
        period: 5,
        repeat: true,
        onTick: () {
          add(BubbleComponent(
            position: Vector2(game.size.x * (0.5 + (0.5 - rnd.nextDouble())),
                game.size.y - 100),
            // position: Vector2.all(10),
          ));
        }));
    return super.onLoad();
  }
}

class BubbleComponent extends SpriteComponent with HasGameRef<Acarium> {
  final double speed = 800;
  BubbleComponent({required super.position});
  @override
  FutureOr<void> onLoad() async {
    sprite = Sprite(game.images.fromCache('static/bubble.png'));
    decorator.addLast(PaintDecorator.blur(2.0));
    opacity = 0.5;
    scale = Vector2.all(3);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    y -= dt * speed;
    if ((y + size.y) < 0) {
      removeFromParent();
    }
    super.update(dt);
  }
}
