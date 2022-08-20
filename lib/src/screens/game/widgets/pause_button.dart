import 'package:flutter/material.dart';

import '../../../configuration/configuration.dart';
import '../../../widgets/game_icon_button.dart';
import '../game.dart';
import 'pause_menu.dart';

class PauseButton extends StatelessWidget {
  const PauseButton({
    super.key,
    required this.gameRef,
  });

  final BitSwap gameRef;

  static const String id = 'pause_button';

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.only(
          right: GameMargins.small,
          top: MediaQuery.of(context).padding.top,
        ),
        child: Row(
          children: [
            const Spacer(),
            GameIconButton.image(
              path: GameIcons.pause,
              onPressed: () {
                gameRef.pauseEngine();
                gameRef.overlays.add(PauseMenu.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
