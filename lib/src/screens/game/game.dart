import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide Image;

import 'package:flame/cache.dart';
import 'package:flame/game.dart';
import 'package:flame/image_composition.dart';
import 'package:flame/input.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flame_forge2d/flame_forge2d.dart' show Forge2DGame;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../configuration/configuration.dart';
import '../../cubits/score/score_cubit.dart';
import '../../cubits/settings/settings_cubit.dart';
import '../../widgets/game_background.dart';
import '../../widgets/game_loading_indicator.dart';
import 'components/boundary.dart';
import 'components/dirt.dart';
import 'components/obstacle/obstacle_spawner.dart';
import 'components/player.dart';
import 'components/player_crash_effect.dart';
import 'components/score.dart';
import 'components/viewport_background.dart';
import 'utils/constants.dart';
import 'widgets/game_over_menu.dart';
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
          GameOverMenu.id: (_, gameRef) => GameOverMenu(gameRef: gameRef),
        },
        // context is passed to reuse same BlocProvider.of(context)
        // as from the initial app (for score & settings states).
        game: BitSwap(context),
      ),
    );
  }
}

class BitSwap extends Forge2DGame
    with TapDetector, HasKeyboardHandlerComponents {
  BitSwap(this.context) : super(gravity: Vector2.zero());

  final BuildContext context;

  final Images imagesLoader = Images();

  late final DirtComponent dirt;
  late final List<Image> obstacleImages;

  late final PlayerComponent _player;
  late final ScoreComponent _score;

  late final ObstacleSpawner obstacleSpawner;

  @override
  void onTapDown(TapDownInfo info) => _player.jump();

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    context.read<ScoreCubit>().resetScore();
    final settings = context.read<SettingsCubit>().state;

    pauseEngine();

    if (settings.isSoundOn && settings.isMusicOn) {
      FlameAudio.bgm.play('music/music.mp3', volume: 0.5);
    }

    await _loadImages();

    final boundaries = Boundaries.walls(this);
    boundaries.forEach(add);

    _setGameResolution();
    await _initializeBackground();
    await _initializeDirt();
    await _initializePlayer();
    await _initializeScore();
    await _initializeObstacles();

    resumeEngine();
  }

  @override
  void onRemove() {
    super.onRemove();
    FlameAudio.bgm.stop();
  }

  Future<void> _loadImages() async {
    await Future.wait([
      _loadObstacleImages(),
    ]);
  }

  Future<void> _loadObstacleImages() async {
    final futures = GameSprites.obstacleImages.map(imagesLoader.load);
    obstacleImages = await Future.wait<Image>(futures);
  }

  void _setGameResolution() {
    // Set fixed resolution only for web version.
    if (!kIsWeb) return;
    camera.viewport = FixedResolutionViewport(GameConstants.gameResolution);
  }

  Future<void>? _initializeBackground() {
    return add(ViewportBackground(size: camera.viewport.effectiveSize));
  }

  Future<void>? _initializePlayer() {
    _player = PlayerComponent();
    return add(_player);
  }

  Future<void>? _initializeScore() {
    _score = ScoreComponent();
    return add(
      FlameBlocProvider<ScoreCubit, ScoreState>.value(
        value: context.read<ScoreCubit>(),
        children: [_score],
      ),
    );
  }

  Future<void>? _initializeDirt() {
    dirt = DirtComponent();
    return add(dirt);
  }

  Future<void>? _initializeObstacles() {
    return add(
      FlameBlocProvider<ScoreCubit, ScoreState>.value(
        value: context.read<ScoreCubit>(),
        children: [ObstacleSpawner()],
      ),
    );
  }

  Future<void> gameOver() async {
    overlays.remove(PauseButton.id);
    _score.stopCounting();
    final score = _score.bloc.state.score;
    final highScore = _score.bloc.state.highScore;
    if (score > highScore) _score.bloc.updateHighScore(score);
    removeAll([_player, dirt]);
    await add(PlayerCrashEffectComponent(_player.body.position));

    await Future.delayed(
      const Duration(milliseconds: PlayerConstants.crashEffectDuration ~/ 2),
    );
    overlays.add(GameOverMenu.id);
  }
}
