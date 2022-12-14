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
    return AlertDialog(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.secondary,
          width: 6,
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      contentPadding: const EdgeInsets.all(GameMargins.margin).copyWith(
        top: 60,
      ),
      title: Text(
        L10n.of(context).pauseMenuTitle,
        textAlign: TextAlign.center,
        style: GameTextStyles.title.copyWith(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GameIconButton.image(
            path: GameIcons.home,
            color: Theme.of(context).colorScheme.secondary,
            size: GameSizes.menuOverlayIconButtonSize,
            onPressed: context.pop,
          ),
          const HorizontalSpacer(40),
          GameIconButton.image(
            path: GameIcons.play,
            color: Theme.of(context).colorScheme.secondary,
            size: GameSizes.menuOverlayIconButtonSize,
            onPressed: () async {
              gameRef.overlays.remove(PauseMenu.id);
              await Future.delayed(const Duration(seconds: 1));
              gameRef.resumeEngine();
            },
          ),
        ],
      ),
    );
  }
}
