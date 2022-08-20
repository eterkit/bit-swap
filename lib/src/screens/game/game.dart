import 'dart:ui';

import 'package:flutter/material.dart' hide Image;

import 'package:flame/cache.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

import '../../configuration/configuration.dart';
import '../../widgets/game_background.dart';
import '../../widgets/game_loading_indicator.dart';
import 'utils/constants.dart';
import 'widgets/pause_button.dart';
import 'widgets/pause_menu.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // Prevent game from being closed by back button.
      onWillPop: () => Future.value(false),
      child: GameWidget<BitSwap>(
        backgroundBuilder: (_) => const GameBackground(),
        loadingBuilder: (_) => const GameLoadingIndicator(),
        initialActiveOverlays: const [PauseButton.id],
        overlayBuilderMap: {
          PauseButton.id: (_, gameRef) => PauseButton(gameRef: gameRef),
          PauseMenu.id: (_, gameRef) => PauseMenu(gameRef: gameRef),
        },
        game: BitSwap(),
      ),
    );
  }
}

class BitSwap extends Forge2DGame with TapDetector {
  BitSwap() : super(gravity: GameConstants.gravity);

  final Images imagesLoader = Images();

  late Image playerImage;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    await _loadImages();
  }

  Future<void> _loadImages() async {
    await Future.wait([
      _loadPlayerImage(),
    ]);
  }

  Future<void> _loadPlayerImage() async {
    playerImage = await imagesLoader.load(GameSprites.player);
  }
}
