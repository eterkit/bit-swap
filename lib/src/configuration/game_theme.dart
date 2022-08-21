import 'package:flutter/material.dart';

import 'configuration.dart';

ThemeData buildGameTheme() => ThemeData(
      primaryColor: GameColors.lightColor,
      canvasColor: GameColors.lightColor,
      colorScheme: const ColorScheme.light(
        secondary: GameColors.darkColor,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: GameColors.lightColor,
      ),
      fontFamily: 'MisterPixel',
      splashColor: GameColors.darkColor.withOpacity(0.1),
      highlightColor: GameColors.darkColor.withOpacity(0.3),
    );
