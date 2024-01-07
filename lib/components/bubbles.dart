import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:fish_game/game/assets.dart';
import 'package:fish_game/game/configuration.dart';

import '../game/fish_game.dart';

class BubblesGroup extends PositionComponent with HasGameRef<FishGame> {
  BubblesGroup();

  @override
  Future<void> onLoad() async {
    position.x = gameRef.size.x;
    position.y = (Random().nextInt(Config.bottom) + Config.top).toDouble();
    add(_Bubbles());
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= Config.gameSpeed * dt;
  }
}

class _Bubbles extends SpriteComponent {
  @override
  Future<void> onLoad() async {
    final bubbles = await Flame.images.load(Assets.bubbles);
    sprite = Sprite(bubbles);
  }
}
