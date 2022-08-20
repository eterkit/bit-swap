import 'package:flame_forge2d/flame_forge2d.dart';

import '../../../game.dart';
import '../../../utils/constants.dart';
import '../../../utils/random_generator.dart';
import '../obstacle.dart';

class ObstacleSpawner extends BodyComponent<BitSwap> with ContactCallbacks {
  late final List<ObstacleComponent> obstacles;

  static const double _initialYPosition = ObstacleConstants.initialYPosition;

  @override
  bool get renderBody => true;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    final screenOneThird = gameRef.size.y / 3;
    final obstacles = [
      ObstacleComponent(_getRandomPosition()),
      ObstacleComponent(
        _getRandomPosition(positionY: _initialYPosition + screenOneThird),
      ),
      ObstacleComponent(
        _getRandomPosition(positionY: _initialYPosition + (screenOneThird * 2)),
      ),
    ];
    addAll(obstacles);
  }

  @override
  Body createBody() {
    final shape = PolygonShape()..setAsBoxXY(gameRef.size.x, 0);

    final fixtureDefinition = FixtureDef(shape, userData: this);
    final bodyDef = BodyDef(
      userData: this,
      position: Vector2.zero(),
    );

    return world.createBody(bodyDef)..createFixture(fixtureDefinition);
  }

  void spawnObstacle(ObstacleComponent obstacleToRemove) {
    remove(obstacleToRemove);
    add(ObstacleComponent(_getRandomPosition()));
  }

  Vector2 _getRandomPosition({double? positionY}) {
    final shouldSpawnRight = randomBool();
    final positionX = shouldSpawnRight ? gameRef.size.x : 0.0;

    return Vector2(positionX, positionY ?? _initialYPosition);
  }
}
