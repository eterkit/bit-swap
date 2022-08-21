import 'package:flutter/material.dart' hide Title;

import 'package:go_router/go_router.dart';

import '../../../generated/l10n.dart';
import '../../../utils/game_router.dart';
import '../../configuration/configuration.dart';
import '../../widgets/game_app_bar.dart';
import '../../widgets/game_icon_button.dart';
import '../../widgets/spacer.dart';
import 'widgets/play_button.dart';
import 'widgets/title.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GameAppBar(
        actions: [
          GameIconButton.image(
            path: GameIcons.settings,
            onPressed: () => context.goNamed(SettingsScreenRoute.name),
          ),
        ],
      ),
      body: _buildBody(context),
    );
  }

  SafeArea _buildBody(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(GameMargins.margin),
        child: Column(
          children: [
            const VerticalSpacer(60),
            const Center(child: Title()),
            const Spacer(),
            const PlayButton(),
            const VerticalSpacer(20),
            Text(
              L10n.of(context).mainMenuPlayInstructions,
              style: GameTextStyles.regular15,
              textAlign: TextAlign.center,
            ),
            const VerticalSpacer(120),
          ],
        ),
      ),
    );
  }
}
