import 'package:flutter/material.dart';

import '../configuration/configuration.dart';

class GameIconButton extends StatelessWidget {
  const GameIconButton.icon({
    super.key,
    required this.iconData,
    required this.onPressed,
    this.color = GameColors.darkColor,
    this.size = GameSizes.iconButtonSize,
  })  : path = null,
        assert(iconData != null);

  const GameIconButton.image({
    super.key,
    required this.path,
    required this.onPressed,
    this.color = GameColors.darkColor,
    this.size = GameSizes.iconButtonSize,
  })  : iconData = null,
        assert(path != null);

  final String? path;
  final IconData? iconData;
  final VoidCallback onPressed;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      iconSize: size,
      icon: _buildIcon(),
    );
  }

  Widget _buildIcon() {
    final path = this.path;
    if (path != null) {
      return Image.asset(
        path,
        color: color,
        width: size,
        height: size,
        fit: BoxFit.cover,
        filterQuality: FilterQuality.none,
      );
    }

    return Icon(
      iconData,
      color: color,
      size: size,
    );
  }
}
