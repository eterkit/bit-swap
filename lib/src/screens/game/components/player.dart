import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

import '../../../configuration/configuration.dart';
import '../game.dart';
import '../utils/constants.dart';

class PlayerComponent extends BodyComponent<BitSwap> with KeyboardHandler {
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
      gameRef.size.y - PlayerConstants.initialPositionYOffset,
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

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    final isSpace = keysPressed.contains(LogicalKeyboardKey.space);
    if (isSpace) {
      if (body.position.x < camera.gameSize.x / 2) {
        jumpRight();
      } else {
        jumpLeft();
      }
      return false; // eat event
    }
    return true;
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
