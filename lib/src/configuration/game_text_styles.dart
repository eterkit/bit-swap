import 'package:flutter/material.dart';

import 'game_colors.dart';

abstract class GameTextStyles {
  static const String _fontFamily = 'MisterPixel';
  static const String _titleFontFamily = 'ThirteenPixel';

  static TextStyle get title => const TextStyle(
        fontFamily: _titleFontFamily,
        fontSize: 34,
        height: 1,
        color: GameColors.charcoal,
      );

  static TextStyle get regular15 => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 28,
        fontWeight: FontWeight.normal,
        color: GameColors.charcoal,
      );
}
