import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../../configuration/configuration.dart';
import '../../../widgets/spacer.dart';
import '../utils/constants.dart';
import 'credits_section_item.dart';

class CreditsDialog extends StatelessWidget {
  const CreditsDialog({
    super.key,
  });

  static const double _maxHeight = 600;

  @override
  Widget build(BuildContext context) {
    final strings = L10n.of(context);
    return AlertDialog(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.secondary,
          width: 6,
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      title: Text(
        strings.settingsMenuCredits,
        style: GameTextStyles.title.copyWith(fontSize: 28),
        textAlign: TextAlign.center,
      ),
      content: LimitedBox(
        maxHeight: _maxHeight,
        child: Scrollbar(
          thumbVisibility: true,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: GameMargins.large),
            child: Column(
              children: [
                ...CreditsSectionItem.build(
                  title: strings.creditsAuthors,
                  entries: GameCreditsConstants.authors,
                ),
                const VerticalSpacer(GameSpacers.space),
                ...CreditsSectionItem.build(
                  title: strings.creditsGraphics,
                  entries: GameCreditsConstants.graphicsAuthors,
                ),
                const VerticalSpacer(GameSpacers.space),
                ...CreditsSectionItem.build(
                  title: strings.creditsFonts,
                  entries: GameCreditsConstants.fonts,
                ),
                const VerticalSpacer(GameSpacers.space),
                ...CreditsSectionItem.build(
                  title: strings.creditsMusic,
                  entries: GameCreditsConstants.music,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
