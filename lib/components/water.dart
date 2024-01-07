import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';
import 'package:fish_game/game/configuration.dart';

import '../game/fish_game.dart';

class Water extends ParallaxComponent<FishGame> with HasGameRef<FishGame> {
  Water();

  @override
  Future<void> onLoad() async {
    final water = await Flame.images.load('water.png');
    parallax = Parallax([
      ParallaxLayer(
        ParallaxImage(water, fill: LayerFill.none),
      ),
    ]);
  }

  @override
  void update(double dt) {
    super.update(dt);
    parallax?.baseVelocity.x = Config.gameSpeed;
  }
}
