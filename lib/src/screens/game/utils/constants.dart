import 'package:flame/game.dart';

abstract class GameConstants {
  static final Vector2 gameResolution = Vector2(400, 800);
  static final Vector2 gravity = Vector2(0, 150);
}

abstract class PlayerConstants {
  static const double jumpForce = 120;
  static final Vector2 spriteSize = Vector2(3, 3);
  static const double bodyRadius = 2;
  static final Vector2 initialPosition = Vector2(0, 20);
}
