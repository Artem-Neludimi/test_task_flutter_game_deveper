import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:fish_game/components/background.dart';
import 'package:fish_game/components/fish.dart';
import 'package:fish_game/components/water.dart';
import 'package:fish_game/components/bubbles.dart';
import 'package:fish_game/game/configuration.dart';
import 'package:flutter/painting.dart';

class FishGame extends FlameGame with TapDetector {
  FishGame();

  late Fish fish;
  late JoystickComponent joystick;
  Timer interval = Timer(Config.waterInterval, repeat: true);
  bool isHit = false;

  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Water(),
      fish = Fish(),
      joystick = _buildJoystick(),
    ]);
    interval.onTick = () => add(BubblesGroup());
  }

  JoystickComponent _buildJoystick() {
    final knobPaint = BasicPalette.white.withAlpha(200).paint();
    final backgroundPaint = BasicPalette.white.withAlpha(100).paint();

    const double knobRadius = 30;
    const double marginVertical = 30;
    const double backgroundRadius = 100;
    final double marginHorizontal = (size.x - backgroundRadius * 2) / 2;

    return JoystickComponent(
      knob: CircleComponent(radius: knobRadius, paint: knobPaint),
      background: CircleComponent(radius: backgroundRadius, paint: backgroundPaint),
      margin: EdgeInsets.only(left: marginHorizontal, bottom: marginVertical),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);
  }
}
