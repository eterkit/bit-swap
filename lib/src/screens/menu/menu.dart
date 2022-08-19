import 'package:flutter/material.dart' hide Title;

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
            // TODO: Navigate to settings screen.
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(GameMargins.margin),
          child: Column(
            children: const [
              VerticalSpacer(80),
              Center(child: Title()),
              Spacer(),
              PlayButton(),
              VerticalSpacer(160),
            ],
          ),
        ),
      ),
    );
  }
}
