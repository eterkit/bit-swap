import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../../configuration/configuration.dart';

class Title extends StatelessWidget {
  const Title({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.15,
      child: Text(
        L10n.of(context).mainMenuGameTitle,
        textAlign: TextAlign.center,
        style: GameTextStyles.title.copyWith(fontSize: 52),
      ),
    );
  }
}
