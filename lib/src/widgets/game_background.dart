import 'package:flutter/material.dart';

import '../configuration/configuration.dart';

class GameBackground extends StatelessWidget {
  const GameBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      color: GameColors.charcoal,
    );
  }
}
