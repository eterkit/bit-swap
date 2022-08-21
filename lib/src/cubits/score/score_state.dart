part of 'score_cubit.dart';

@immutable
class ScoreState extends Equatable {
  const ScoreState({
    required this.score,
    required this.highScore,
  });

  factory ScoreState.initial() => const ScoreState(
        score: 0,
        highScore: 0,
      );

  final double score;
  final double highScore;

  @override
  List<Object> get props => [score, highScore];

  ScoreState copyWith({
    double? score,
    double? highScore,
  }) =>
      ScoreState(
        score: score ?? this.score,
        highScore: highScore ?? this.highScore,
      );
}
