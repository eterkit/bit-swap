import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide Image;

import 'package:flame/cache.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flame_forge2d/flame_forge2d.dart' show Forge2DGame;

import '../../cubits/score/score_cubit.dart';
import '../../widgets/game_background.dart';
import '../../widgets/game_loading_indicator.dart';
import 'components/boundary.dart';
import 'components/dirt.dart';
import 'components/player.dart';
import 'components/score.dart';
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

class BitSwap extends Forge2DGame
    with TapDetector, HasKeyboardHandlerComponents {
  BitSwap() : super(gravity: GameConstants.gravity);
  final Images imagesLoader = Images();

  late final DirtComponent dirt;

  late final PlayerComponent _player;
  late final ScoreComponent _score;

  @override
  void onTapDown(TapDownInfo info) => _player.jump();

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    await _loadImages();

    final boundaries = Boundaries.walls(this);
    boundaries.forEach(add);

    _setGameResolution();

    await _initializeDirt();
    await _initializePlayer();
    await _initializeScore();
  }

  Future<void> _loadImages() async {
    await Future.wait([]);
  }

  void _setGameResolution() {
    // Set fixed resolution only for web version.
    if (!kIsWeb) return;
    camera.viewport = FixedResolutionViewport(GameConstants.gameResolution);
  }

  Future<void>? _initializePlayer() {
    _player = PlayerComponent();
    return add(_player);
  }

  Future<void>? _initializeScore() {
    _score = ScoreComponent();
    return add(
      FlameBlocProvider<ScoreCubit, ScoreState>.value(
        value: ScoreCubit()..load(),
        children: [_score],
      ),
    );
  }

  Future<void>? _initializeDirt() {
    dirt = DirtComponent();
    return add(dirt);
  }
}
