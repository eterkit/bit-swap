import 'package:flame/components.dart';
import 'package:flame_bloc/flame_bloc.dart';

import '../../../configuration/configuration.dart';
import '../../../cubits/score/score_cubit.dart';
import '../utils/constants.dart';

class ScoreComponent extends TextComponent
    with HasGameRef, FlameBlocListenable<ScoreCubit, ScoreState> {
  ScoreComponent()
      : super(
          text: '0',
          anchor: Anchor.center,
          textRenderer: TextPaint(
            style: GameTextStyles.regular15.copyWith(
              fontSize: 3,
            ),
          ),
        );

  bool _canCount = true;

  @override
  Future<void>? onLoad() async {
    await super.onLoad();
    position = Vector2(gameRef.size.x * 0.5, gameRef.size.y * 0.1);
  }

  @override
  void onNewState(ScoreState state) {
    text = state.score.toStringAsFixed(3);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (!_canCount) return;
    _updateScore(dt);
  }

  void _updateScore(double dt) {
    bloc.incrementScore(GameConstants.scoreIncrement * dt);
  }

  void stopCounting() => _canCount = false;
}
