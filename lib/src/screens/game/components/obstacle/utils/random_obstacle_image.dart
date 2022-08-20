import 'package:flame/image_composition.dart';

import '../../../game.dart';
import '../../../utils/random_generator.dart';

abstract class RandomObstacleImage {
  static Image create(BitSwap gameRef) {
    final obstacleImages = gameRef.obstacleImages;
    return obstacleImages[randomInt(0, obstacleImages.length)];
  }
}
