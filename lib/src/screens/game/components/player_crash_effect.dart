import 'package:flutter/material.dart';

import 'package:flame/components.dart';
import 'package:flame/particles.dart';

import '../../../configuration/configuration.dart';
import '../utils/constants.dart';
import '../utils/random_generator.dart';

class PlayerCrashEffectComponent extends ParticleSystemComponent {
  PlayerCrashEffectComponent(this.spawnPosition)
      : super(
          position: spawnPosition,
          particle: Particle.generate(
            generator: (_) => AcceleratedParticle(
              lifespan: _lifespan,
              acceleration: randomVector2(),
              child: CircleParticle(
                lifespan: _lifespan,
                radius: randomDouble(0.1, 0.5),
                paint: Paint()..color = GameColors.charcoal,
              ),
            ),
          ),
        );

  final Vector2 spawnPosition;

  static const double _lifespan = PlayerConstants.crashEffectDuration / 1000;
}
