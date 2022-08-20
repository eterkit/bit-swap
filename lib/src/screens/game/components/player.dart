import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

import '../../../configuration/configuration.dart';
import '../game.dart';
import '../utils/constants.dart';

class PlayerComponent extends BodyComponent<BitSwap> with KeyboardHandler {
  late SpriteComponent _spriteComponent;

  _Direction _direction = _Direction.left;

  @override
  Paint get paint => super.paint..color = GameColors.charcoal;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    final playerImage = await gameRef.imagesLoader.load(GameSprites.player);
    _spriteComponent = SpriteComponent.fromImage(
      playerImage,
      size: PlayerConstants.spriteSize,
      paint: Paint()..color = GameColors.charcoal,
      anchor: Anchor.center,
    );
    await add(_spriteComponent);
  }

  @override
  bool get renderBody => true;

  @override
  Body createBody() {
    final shape = CircleShape()..radius = PlayerConstants.bodyRadius;
    final fixtureDefinition = FixtureDef(shape);
    final bodyDef = BodyDef(
      userData: this,
      position: PlayerConstants.initialPosition,
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
  bool onKeyEvent(
    RawKeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    final isSpace = keysPressed.contains(LogicalKeyboardKey.space);

    // one press is one jump. Repeats are ignored.
    if (isSpace && !event.repeat) {
      jump();
      return false; // eat event
    }
    return true;
  }

  void jump() {
    _direction = _direction.swap();

    body.linearVelocity = Vector2(
      _direction.value * PlayerConstants.jumpForce,
      0,
    );
  }
}

enum _Direction {
  left(-1),
  right(1);

  const _Direction(this.value);
  final double value;

  _Direction swap() {
    switch (this) {
      case _Direction.left:
        return _Direction.right;
      case _Direction.right:
        return _Direction.left;
    }
  }
}
