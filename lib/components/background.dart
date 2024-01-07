import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:fish_game/game/assets.dart';

import '../game/fish_game.dart';

class Background extends SpriteComponent with HasGameRef<FishGame> {
  Background();

  @override
  Future<void> onLoad() async {
    final background = await Flame.images.load(Assets.background);
    size = gameRef.size;
    sprite = Sprite(background);
  }
}
