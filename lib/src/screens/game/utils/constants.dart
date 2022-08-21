import 'package:flame/game.dart';

abstract class GameConstants {
  static final Vector2 gameResolution = Vector2(400, 800);
  static const double scoreIncrement = 0.5;
}

abstract class PlayerConstants {
  static const double jumpForce = 120;
  static final Vector2 spriteSize = Vector2(5, 5);
  static const double bodyRadius = 2.4;
  static final Vector2 initialPosition = Vector2(0, 20);

  /// In milliseconds.
  static const int crashEffectDuration = 800;
}

abstract class ObstacleConstants {
  static const double movementSpeed = 50;
  static const double initialYPosition = 85;
  static const int maxYPositionOffset = 30;
  static const double obstacleSpawnProgress = 2; // in seconds
}
