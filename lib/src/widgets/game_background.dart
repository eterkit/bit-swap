import 'package:flutter/material.dart';

class GameBackground extends StatelessWidget {
  const GameBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      color: Theme.of(context).primaryColor,
    );
  }
}
