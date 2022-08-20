import 'package:flutter/foundation.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'score_state.dart';

class ScoreCubit extends Cubit<ScoreState> {
  ScoreCubit() : super(ScoreState.initial());

  static const String _highScoreKey = 'high_score';

  void incrementScore() => emit(state.copyWith(score: state.score + 1));

  void resetScore() => emit(state.copyWith(score: ScoreState.initial().score));

  void updateHighScore(int highScore) {
    emit(state.copyWith(highScore: highScore));
    _store();
  }

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    emit(
      state.copyWith(
        highScore: prefs.getInt(_highScoreKey) ?? state.highScore,
      ),
    );
  }

  Future<void> _store() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(_highScoreKey, state.highScore);
  }
}
