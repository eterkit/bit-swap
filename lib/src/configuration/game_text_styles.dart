import 'package:flutter/material.dart';

import 'game_colors.dart';

abstract class GameTextStyles {
  static const String _fontFamily = 'MisterPixel';
  static const String _titleFontFamily = 'ThirteenPixel';

  static TextStyle get title => const TextStyle(
        fontFamily: _titleFontFamily,
        fontSize: 34,
        height: 1,
        color: GameColors.darkColor,
      );

  static TextStyle get regular28 => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 28,
        fontWeight: FontWeight.normal,
        color: GameColors.darkColor,
      );

  static TextStyle get regular20 => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 20,
        fontWeight: FontWeight.normal,
        color: GameColors.darkColor,
      );
}
