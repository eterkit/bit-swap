import 'package:flutter/material.dart';

import 'configuration.dart';

ThemeData buildGameTheme() => ThemeData(
      primaryColor: GameColors.lavenderGrey,
      canvasColor: GameColors.lavenderGrey,
      colorScheme: const ColorScheme.light(
        secondary: GameColors.charcoal,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: GameColors.lavenderGrey,
      ),
      fontFamily: 'MotionControl',
      splashColor: GameColors.charcoal.withOpacity(0.1),
      highlightColor: GameColors.charcoal.withOpacity(0.3),
    );
