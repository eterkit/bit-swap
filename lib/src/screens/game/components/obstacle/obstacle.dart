import 'package:flutter/material.dart';

import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

import '../../../../configuration/configuration.dart';
import '../../game.dart';
import '../../utils/constants.dart';
import '../player.dart';
import 'utils/random_obstacle_image.dart';

class ObstacleComponent extends BodyComponent<BitSwap> with ContactCallbacks {
  ObstacleComponent(this.initialPosition);

  final Vector2 initialPosition;

  late final Vector2 _size;
  late final Anchor _anchor;
  late final SpriteComponent _obstacleSpriteComponent;

  @override
  void beginContact(Object other, Contact contact) {
    super.beginContact(other, contact);
    if (other is PlayerComponent) {
      gameRef.gameOver();
    }
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    _anchor = initialPosition.x >= gameRef.size.x / 2
        ? Anchor.centerRight
        : Anchor.centerLeft;

    _obstacleSpriteComponent = SpriteComponent.fromImage(
      RandomObstacleImage.create(gameRef),
      size: _size,
      position: Vector2(0, 0),
      paint: super.paint
        ..colorFilter = const ColorFilter.mode(
          GameColors.charcoal,
          BlendMode.srcATop,
        ),
      anchor: _anchor,
    );
    await add(_obstacleSpriteComponent);
  }

  @override
  bool get renderBody => false;

  @override
  Body createBody() {
    _size = Vector2(gameRef.size.x / 2, 3);
    final shape = PolygonShape()..setAsBoxXY(_size.x, _size.y / 2);

    final fixtureDefinition = FixtureDef(
      shape,
      // Should not move the body on collisions, but trigger events.
      isSensor: true,
    );
    final bodyDef = BodyDef(
      userData: this,
      position: initialPosition,
      type: BodyType.dynamic,
      gravityOverride: Vector2.zero(),
      // Move obstacle up with constant speed.
      linearVelocity: Vector2(0, -ObstacleConstants.movementSpeed),
    );

    return world.createBody(bodyDef)..createFixture(fixtureDefinition);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (body.position.y < -_size.y) removeFromParent();
  }
}
