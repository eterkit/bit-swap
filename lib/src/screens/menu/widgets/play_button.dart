import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../../widgets/game_elevated_button.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({
    super.key,
  });

  static const double _width = 150;
  static const double _height = 50;

  @override
  Widget build(BuildContext context) {
    return GameElevatedButton(
      label: L10n.of(context).mainMenuPlay,
      width: _width,
      height: _height,
      // TODO: Navigate to game screen.
      onPressed: () {},
    );
  }
}
