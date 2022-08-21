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
  Paint get paint => super.paint
    ..colorFilter = const ColorFilter.mode(
      GameColors.charcoal,
      BlendMode.srcATop,
    );

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
        ? Anchor.topRight
        : Anchor.topLeft;

    final isOnLeft = _anchor == Anchor.topLeft;

    _obstacleSpriteComponent = SpriteComponent.fromImage(
      RandomObstacleImage.create(gameRef),
      size: _size,
      // we have to flip a sprite if it's on the right side of the screen.
      scale: Vector2(isOnLeft ? 1 : -1, 1),
      // also position must be adjusted.
      position: Vector2(isOnLeft ? 0 : -_size.x, 0),
      paint: paint,
      anchor: _anchor,
    );
    await add(_obstacleSpriteComponent);
  }

  @override
  bool get renderBody => false;

  @override
  Body createBody() {
    _size = Vector2(gameRef.size.x / 2, 4);
    final shape = PolygonShape()..setAsBoxXY(_size.x * 0.95, _size.y / 4);

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
