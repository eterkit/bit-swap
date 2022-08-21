import 'dart:convert';

import '../appwrite/utils.dart';

class GameScore {
  const GameScore({
    required this.id,
    required this.playerId,
    required this.score,
  });

  final String id;
  final String playerId;
  final double score;

  // ignore: sort_constructors_first
  factory GameScore.fromJsonString(String source) =>
      GameScore.fromJson(jsonDecode(source) as Map<String, dynamic>);

  // ignore: sort_constructors_first
  factory GameScore.fromJson(Map<String, dynamic> json) => GameScore(
        id: json[idKey] as String,
        playerId: json['playerId'] as String,
        score: json['score'] as double,
      );

  String toJsonString() => jsonEncode(toJson());

  Map<String, dynamic> toApiData() => toJson()..remove(idKey);

  Map<String, dynamic> toJson() => {
        idKey: id,
        'playerId': playerId,
        'score': score,
      };

  @override
  String toString() => 'Score(playerId: $playerId, score: $score)';

  @override
  bool operator ==(covariant GameScore other) {
    if (identical(this, other)) return true;

    return other.playerId == playerId && other.score == score;
  }

  @override
  int get hashCode => playerId.hashCode ^ score.hashCode;
}
