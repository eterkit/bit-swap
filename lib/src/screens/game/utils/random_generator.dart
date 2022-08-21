import 'dart:math';

final _random = Random();

/// Generates a positive random integer distributed on the range
/// from [min], inclusive, to [max], exclusive.
int randomInt(int min, int max) => min + _random.nextInt(max - min);

/// Generates a positive random double distributed on the range
/// from [min], inclusive, to [max], exclusive.
double randomDouble(num min, num max) =>
    min + _random.nextDouble() * (max - min);

/// Generates random bool value on the range
bool randomBool() => _random.nextBool();
