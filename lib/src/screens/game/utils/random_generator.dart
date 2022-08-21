import 'dart:math';

import 'package:flame/game.dart';

final _random = Random();

/// Generates a positive random integer distributed on the range
/// from [min], inclusive, to [max], exclusive.
int randomInt(int min, int max) => min + _random.nextInt(max - min);

/// Generates a positive random double distributed on the range
/// from [min], inclusive, to [max], exclusive.
double randomDouble(num min, num max) =>
    min + _random.nextDouble() * (max - min);

/// Generates random bool value on the range.
bool randomBool() => _random.nextBool();

/// Generates random Vector2.
Vector2 randomVector2({double? multiplier}) =>
    (Vector2.random(_random) - Vector2.random(_random)) * (multiplier ?? 150);
