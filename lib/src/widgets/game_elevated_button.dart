import 'package:flutter/material.dart';

import '../configuration/configuration.dart';

class GameElevatedButton extends StatelessWidget {
  const GameElevatedButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor = GameColors.charcoal,
    this.labelColor = GameColors.lavenderGrey,
    this.width,
    this.height,
  });

  final String label;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color labelColor;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final labelColor = this.labelColor.withOpacity(onPressed != null ? 1 : 0.5);
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (states) {
              return states.contains(MaterialState.disabled)
                  ? backgroundColor.withOpacity(0.5)
                  : backgroundColor;
            },
          ),
        ),
        child: Text(
          label,
          style: GameTextStyles.regular15.copyWith(color: labelColor),
        ),
      ),
    );
  }
}
