import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../../../generated/l10n.dart';
import '../../configuration/configuration.dart';
import '../../widgets/game_app_bar.dart';
import '../../widgets/game_icon_button.dart';
import '../../widgets/spacer.dart';
import '../game/utils/constants.dart';
import 'models/settings_option.dart';
import 'widgets/credits_button.dart';
import 'widgets/settings_option.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final strings = L10n.of(context);
    return Scaffold(
      appBar: GameAppBar(
        title: Text(strings.settingsMenuTitle),
        actions: [
          GameIconButton.image(
            path: GameIcons.close,
            onPressed: context.pop,
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(GameMargins.margin),
          child: Column(
            children: [
              Expanded(child: _buildSettingsList(context)),
              const Spacer(),
              const CreditsButton(),
              const VerticalSpacer(120),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsList(BuildContext context) {
    final strings = L10n.of(context);
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: kIsWeb ? GameConstants.gameResolution.x : double.infinity,
          maxHeight: kIsWeb ? GameConstants.gameResolution.y : double.infinity,
        ),
        child: ListView(
          padding: const EdgeInsets.only(top: 100),
          children: ListTile.divideTiles(
            context: context,
            tiles: [
              // TODO: Add functionality to switches.
              SettingsOptionWidget(
                label: SettingsOption.sound.name(strings),
                iconPath: SettingsOption.sound.iconPath(isEnabled: true),
                value: true,
                onChanged: (value) {},
              ),
              SettingsOptionWidget(
                label: SettingsOption.music.name(strings),
                iconPath: SettingsOption.music.iconPath(isEnabled: true),
                value: true,
                onChanged: (value) {},
              ),
            ],
          ).toList(growable: false),
        ),
      ),
    );
  }
}
