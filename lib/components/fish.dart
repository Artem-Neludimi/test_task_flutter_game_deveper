import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:fish_game/game/assets.dart';
import 'package:fish_game/game/configuration.dart';

import '../game/fish_game.dart';

class Fish extends SpriteComponent with HasGameRef<FishGame>, CollisionCallbacks {
  Fish();

  @override
  Future<void> onLoad() async {
    final fish = await gameRef.loadSprite(Assets.fish);

    size = Vector2(Config.horizontalMargin, Config.verticalMargin);
    position = Vector2(
      gameRef.size.x / 2 - Config.horizontalMargin / 2,
      gameRef.size.y / 2 - Config.verticalMargin / 2,
    );
    sprite = fish;
  }

  @override
  void update(double dt) {
    super.update(dt);
    _joystickMovements(dt);
  }

  void _joystickMovements(double dt) {
    final delta = gameRef.joystick.delta;
    if (gameRef.fish.position.y - Config.top < 0) {
      position.add(Vector2(0, 1));
    } else if (gameRef.fish.position.y + Config.groundHeight > gameRef.size.y - Config.verticalMargin) {
      position.add(Vector2(0, -1));
    } else if (gameRef.fish.position.x < 0) {
      position.add(Vector2(1, 0));
    } else if (gameRef.fish.position.x > gameRef.size.x - Config.horizontalMargin) {
      position.add(Vector2(-1, 0));
    } else {
      position.add(delta * dt);
    }
  }
}
