import 'package:flutter/foundation.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'score_state.dart';

class ScoreCubit extends Cubit<ScoreState> {
  ScoreCubit() : super(ScoreState.initial());

  static const String _highScoreKey = 'high_score';

  void incrementScore(double scoreToAdd) =>
      emit(state.copyWith(score: state.score + scoreToAdd));

  void resetScore() => emit(state.copyWith(score: ScoreState.initial().score));

  void updateHighScore(double highScore) {
    emit(state.copyWith(highScore: highScore));
    _store();
  }

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    emit(
      state.copyWith(
        highScore: prefs.getDouble(_highScoreKey) ?? state.highScore,
      ),
    );
  }

  Future<void> _store() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setDouble(_highScoreKey, state.highScore);
  }
}
