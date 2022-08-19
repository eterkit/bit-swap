import 'package:flutter/material.dart';

import '../configuration/configuration.dart';
import 'spacer.dart';

class GameAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GameAppBar({
    super.key,
    this.backgroundColor,
    this.leading,
    this.title,
    this.actions,
  });

  final Color? backgroundColor;
  final Widget? leading;
  final Widget? title;
  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: backgroundColor,
      leading: leading,
      title: title,
      titleTextStyle: GameTextStyles.title,
      centerTitle: true,
      actions: [
        ...?actions,
        const HorizontalSpacer(GameSpacers.small),
      ],
    );
  }
}
