import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../../widgets/game_elevated_button.dart';
import 'credits_dialog.dart';

class CreditsButton extends StatelessWidget {
  const CreditsButton({
    super.key,
  });

  static const double _width = 150;
  static const double _height = 50;

  @override
  Widget build(BuildContext context) {
    return GameElevatedButton(
      label: L10n.of(context).settingsMenuCredits,
      width: _width,
      height: _height,
      onPressed: () => showDialog<void>(
        context: context,
        builder: (context) => const CreditsDialog(),
      ),
    );
  }
}
