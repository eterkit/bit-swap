import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../generated/l10n.dart';
import '../../../../utils/game_router.dart';
import '../../../configuration/configuration.dart';
import '../../../cubits/score/score_cubit.dart';
import '../../../widgets/game_icon_button.dart';
import '../../../widgets/spacer.dart';
import '../game.dart';

class GameOverMenu extends StatelessWidget {
  const GameOverMenu({
    super.key,
    required this.gameRef,
  });

  final BitSwap gameRef;

  static const String id = 'game_over_menu';

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
      contentPadding: const EdgeInsets.all(GameMargins.margin),
      title: Text(
        L10n.of(context).gameOverMenuTitle,
        textAlign: TextAlign.center,
        style: GameTextStyles.title.copyWith(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildScoreInfo(context),
          const VerticalSpacer(GameSpacers.space),
          Row(
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
                path: GameIcons.replay,
                color: Theme.of(context).colorScheme.secondary,
                size: GameSizes.menuOverlayIconButtonSize,
                onPressed: () async {
                  gameRef.overlays.remove(GameOverMenu.id);
                  context.replaceNamed(GameScreenRoute.name);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildScoreInfo(BuildContext context) {
    final scoreState = context.read<ScoreCubit>().state;
    final score = scoreState.score;
    final highScore = scoreState.highScore;

    if (score > highScore) _buildNewHighScoreInfo(highScore);

    final strings = L10n.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${strings.gameOverMenuScore}: ${score.toStringAsFixed(3)}',
          style: GameTextStyles.regular28,
        ),
        Text(
          '${strings.gameOverMenuHighScore}: ${highScore.toStringAsFixed(3)}',
          style: GameTextStyles.regular28,
        ),
      ],
    );
  }

  Widget _buildNewHighScoreInfo(double highScore) {
    return Row(
      children: [
        Container(),
      ],
    );
  }
}
