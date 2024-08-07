import 'package:carium/character/gpt_boid.dart';
import 'package:carium/config/constants.dart';
import 'package:flame/camera.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/widgets.dart';

class BoidGame extends FlameGame with TapDetector {
  List<Boid> boids = [];
  late final CameraComponent cam;

  @override
  Future<void> onLoad() async {
    await images.loadAllImages();

    cam = CameraComponent.withFixedResolution(
        world: world, width: tvWidth, height: tvHeight);
    cam.viewfinder.anchor = Anchor.center;

    // Create a list of boids
    for (int i = 0; i < 10; i++) {
      final boid = Boid(Vector2.random() * size.length);

      add(boid);
      boids.add(boid);
    }
    add(cam);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    // Update boids
    for (final boid in boids) {
      boid.update(dt);
    }
  }
}
