import 'package:flutter/material.dart';

import '../../../configuration/configuration.dart';
import '../../../widgets/spacer.dart';

class SettingsOptionWidget extends StatelessWidget {
  const SettingsOptionWidget({
    super.key,
    required this.label,
    required this.iconPath,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final String iconPath;
  final bool value;
  final ValueSetter<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Row(
        children: [
          Image.asset(
            iconPath,
            width: GameSizes.settingsOptionIconSize,
            height: GameSizes.settingsOptionIconSize,
            fit: BoxFit.cover,
            filterQuality: FilterQuality.none,
            color: GameColors.darkColor,
          ),
          const HorizontalSpacer(GameSpacers.small),
          Text(
            label,
            style: GameTextStyles.regular15,
          ),
        ],
      ),
      value: value,
      onChanged: onChanged,
      activeTrackColor: GameColors.darkColor.withOpacity(0.6),
      activeColor: GameColors.darkColor,
      inactiveTrackColor: GameColors.darkColor.withOpacity(0.3),
      inactiveThumbColor: GameColors.darkColor.withOpacity(0.6),
    );
  }
}
