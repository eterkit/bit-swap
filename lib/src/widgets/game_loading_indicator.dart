import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../configuration/configuration.dart';

class GameLoadingIndicator extends StatelessWidget {
  const GameLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: GameColors.lightColor,
      child: Center(
        child: Text(
          L10n.of(context).generalLoading,
          style: GameTextStyles.regular15,
        ),
      ),
    );
  }
}
