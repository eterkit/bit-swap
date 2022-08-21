import 'package:flutter/material.dart';

import '../../../configuration/configuration.dart';
import '../../../widgets/spacer.dart';

abstract class CreditsSectionItem {
  static List<Widget> build({
    required String title,
    required List<String> entries,
  }) {
    return [
      Text(title, style: GameTextStyles.regular28),
      const VerticalSpacer(GameSpacers.small),
      ...entries.map(
        (entry) => Text(
          entry,
          style: GameTextStyles.regular20,
          textAlign: TextAlign.center,
        ),
      ),
    ];
  }
}
