import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

import '../../../configuration/configuration.dart';
import '../game.dart';
import '../utils/constants.dart';
import '../utils/dirt_position.dart';
import '../utils/player_state.dart';

class PlayerComponent extends BodyComponent<BitSwap> with KeyboardHandler {
  late SpriteAnimationGroupComponent<PlayerState> _spriteComponent;

  _Direction _direction = _Direction.left;

  @override
  Paint get paint => super.paint
    ..colorFilter = const ColorFilter.mode(
      GameColors.darkColor,
      BlendMode.srcATop,
    );

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    final playerWallImage = await Sprite.load(
      GameSprites.playerWall,
      images: gameRef.imagesLoader,
    );
    final playerJumpImage = await Sprite.load(
      GameSprites.playerJump,
      images: gameRef.imagesLoader,
    );

    _spriteComponent = SpriteAnimationGroupComponent<PlayerState>(
      size: PlayerConstants.spriteSize,
      paint: paint,
      anchor: Anchor.center,
      animations: {
        PlayerState.wall: SpriteAnimation.spriteList(
          [playerWallImage],
          stepTime: 1,
        ),
        PlayerState.jump: SpriteAnimation.spriteList(
          [playerJumpImage],
          stepTime: 1,
        ),
      },
      current: PlayerState.wall,
    );
    await add(_spriteComponent);
  }

  @override
  bool get renderBody => false;

  @override
  Body createBody() {
    final shape = CircleShape()..radius = PlayerConstants.bodyRadius;
    final fixtureDefinition = FixtureDef(shape);
    final bodyDef = BodyDef(
      userData: this,
      position: PlayerConstants.initialPosition,
      type: BodyType.dynamic,
      gravityOverride: Vector2.zero(),
    );

    return world.createBody(bodyDef)..createFixture(fixtureDefinition);
  }

  @override
  void update(double dt) {
    super.update(dt);
    _checkPosition();
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

    _spriteComponent.scale = Vector2(-_direction.value, 1);
    _spriteComponent.current = PlayerState.jump;

    gameRef.dirt.position = DirtPosition.none;
  }

  void _checkPosition() {
    if (_spriteComponent.current == PlayerState.wall) return;
    if (body.linearVelocity.x != 0) return;

    _spriteComponent.current = PlayerState.wall;
    switch (_direction) {
      case _Direction.left:
        gameRef.dirt.position = DirtPosition.left;
        break;
      case _Direction.right:
        gameRef.dirt.position = DirtPosition.right;
        break;
    }
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
