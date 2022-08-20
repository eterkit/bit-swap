import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../../../../generated/l10n.dart';
import '../../../configuration/configuration.dart';
import '../../../widgets/game_icon_button.dart';
import '../../../widgets/spacer.dart';
import '../game.dart';

class PauseMenu extends StatelessWidget {
  const PauseMenu({
    super.key,
    required this.gameRef,
  });

  final BitSwap gameRef;

  static const String id = 'pause_menu';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 2,
        ),
      ),
      child: AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        contentPadding: const EdgeInsets.all(GameMargins.margin).copyWith(
          top: 60,
        ),
        title: Text(
          L10n.of(context).pauseMenuTitle,
          textAlign: TextAlign.center,
          style: GameTextStyles.title.copyWith(
            color: Theme.of(context).primaryColor,
          ),
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GameIconButton.image(
              path: GameIcons.home,
              color: Theme.of(context).primaryColor,
              size: GameSizes.pauseMenuIconButtonSize,
              onPressed: context.pop,
            ),
            const HorizontalSpacer(40),
            GameIconButton.image(
              path: GameIcons.play,
              color: Theme.of(context).primaryColor,
              size: GameSizes.pauseMenuIconButtonSize,
              onPressed: () async {
                gameRef.overlays.remove(PauseMenu.id);
                await Future.delayed(const Duration(seconds: 1));
                gameRef.resumeEngine();
              },
            ),
          ],
        ),
      ),
    );
  }
}
