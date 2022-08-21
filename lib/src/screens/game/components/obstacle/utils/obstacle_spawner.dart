import 'package:flame/components.dart';

import '../../../utils/constants.dart';
import '../../../utils/random_generator.dart';
import '../obstacle.dart';

class ObstacleSpawner extends TimerComponent with HasGameRef {
  ObstacleSpawner(this.rate) : super(period: 0.01, repeat: true);

  // rate * 10 = number of milliseconds between spawns.
  // rate = 50 means one spawn every half second.
  int rate;

  // 1 tick is 50ms.
  int _ticks = 0;

  static const double _initialYPosition = ObstacleConstants.initialYPosition;

  @override
  void onTick() {
    _ticks++;
    if (_ticks % rate != 0) return;
    add(ObstacleComponent(_getRandomPosition()));
    _ticks = 0;
  }

  @override
  Future<void>? onLoad() async {
    await super.onLoad();
  }

  Vector2 _getRandomPosition({double? positionY}) {
    final shouldSpawnRight = randomBool();
    final positionX = shouldSpawnRight ? gameRef.size.x : 0.0;

    return Vector2(positionX, positionY ?? _initialYPosition);
  }
}
