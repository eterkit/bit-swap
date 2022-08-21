import 'package:flutter/rendering.dart';

import 'package:flame/components.dart';
import 'package:flame/particles.dart';

import '../../../configuration/configuration.dart';
import '../utils/constants.dart';
import '../utils/dirt_position.dart';
import '../utils/random_generator.dart';

class DirtComponent extends TimerComponent with HasGameRef {
  DirtComponent() : super(period: 0.1, repeat: true);

  DirtPosition position = DirtPosition.left;

  static const _xBaseSpeed = 5;
  static const _yBaseSpeed = -15;
  static const _speedModifier = 10;
  static const _yOffset = -2;

  int get _direction {
    switch (position) {
      case DirtPosition.none:
        return 0;
      case DirtPosition.left:
        return 1;
      case DirtPosition.right:
        return -1;
    }
  }

  @override
  void onTick() {
    final Vector2 componentPosition;

    switch (position) {
      case DirtPosition.none:
        return;
      case DirtPosition.left:
        componentPosition = Vector2(
          0,
          PlayerConstants.initialPosition.y + _yOffset,
        );
        break;
      case DirtPosition.right:
        componentPosition = Vector2(
          gameRef.size.x,
          PlayerConstants.initialPosition.y + _yOffset,
        );
        break;
    }
    add(_createComponent(componentPosition));
  }

  ParticleSystemComponent _createComponent(Vector2 position) {
    return ParticleSystemComponent(
      position: position,
      particle: Particle.generate(
        lifespan: 0.2,
        generator: (_) {
          final direction = _direction;
          return AcceleratedParticle(
            speed: Vector2(
              direction * _xBaseSpeed +
                  direction * randomDouble(0, _speedModifier),
              _yBaseSpeed - randomDouble(0, _speedModifier),
            ),
            child: CircleParticle(
              radius: randomDouble(0.05, 0.15),
              paint: Paint()..color = GameColors.darkColor,
            ),
          );
        },
      ),
    );
  }
}
