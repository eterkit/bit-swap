import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flame_forge2d/flame_forge2d.dart';

import '../../../configuration/configuration.dart';
import '../utils/constants.dart';

class Boundary extends BodyComponent {
  Boundary(this.start, this.end);

  final Vector2 start;
  final Vector2 end;

  @override
  Paint get paint => super.paint..color = GameColors.darkColor;

  @override
  Body createBody() {
    final shape = EdgeShape()..set(start, end);
    final fixtureDefinition = FixtureDef(shape);
    final bodyDef = BodyDef(
      userData: this,
      position: Vector2.zero(),
    );

    return world.createBody(bodyDef)..createFixture(fixtureDefinition);
  }
}

abstract class Boundaries {
  static List<Boundary> walls(Forge2DGame game) {
    final topLeft = Vector2.zero();
    final bottomRight = game.screenToWorld(
      kIsWeb
          ? GameConstants.gameResolution
          : game.camera.viewport.effectiveSize,
    );
    final topRight = Vector2(bottomRight.x, topLeft.y);
    final bottomLeft = Vector2(topLeft.x, bottomRight.y);

    return [
      Boundary(topRight, bottomRight),
      Boundary(bottomLeft, topLeft),
    ];
  }
}
