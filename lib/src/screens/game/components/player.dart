import 'package:flutter/material.dart';

import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

import '../../../configuration/configuration.dart';
import '../game.dart';
import '../utils/constants.dart';

class PlayerComponent extends BodyComponent<BitSwap> {
  late SpriteComponent _playerSpriteComponent;
  late Vector2 _initialSpawnPosition;

  @override
  Paint get paint => super.paint..color = GameColors.charcoal;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    _playerSpriteComponent = SpriteComponent.fromImage(
      gameRef.playerImage,
      size: PlayerConstants.spriteSize,
      paint: Paint()..color = GameColors.charcoal,
      anchor: Anchor.center,
    );
    await add(_playerSpriteComponent);
  }

  @override
  bool get renderBody => true;

  @override
  Body createBody() {
    _initialSpawnPosition = Vector2(
      gameRef.size.x - PlayerConstants.bodyRadius,
      PlayerConstants.initialPositionYOffset,
    );

    final shape = CircleShape()..radius = PlayerConstants.bodyRadius;
    final fixtureDefinition = FixtureDef(shape);
    final bodyDef = BodyDef(
      userData: this,
      position: _initialSpawnPosition,
      type: BodyType.dynamic,
      gravityScale: Vector2.zero(),
    );

    return world.createBody(bodyDef)..createFixture(fixtureDefinition);
  }

  @override
  void update(double dt) {
    super.update(dt);
  }

  void jumpRight() {
    _playerSpriteComponent.scale = Vector2(1, 1);
    body.linearVelocity = Vector2(1, 0) * PlayerConstants.jumpForce;
  }

  void jumpLeft() {
    _playerSpriteComponent.scale = Vector2(-1, 1);
    body.linearVelocity = Vector2(-1, 0) * PlayerConstants.jumpForce;
  }
}
