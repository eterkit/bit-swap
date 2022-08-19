import 'package:flutter/material.dart';

class GameLoadingIndicator extends StatelessWidget {
  const GameLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
