import 'dart:convert';

import 'package:collection/collection.dart';

import '../appwrite/utils.dart';
import 'leaderboard_score.dart';

class Leaderboard {
  Leaderboard({
    required this.id,
    required this.scores,
  });

  final String id;
  final List<LeaderboardScore> scores;

  // ignore: sort_constructors_first
  factory Leaderboard.fromJsonString(String source) =>
      Leaderboard.fromJson(jsonDecode(source) as Map<String, dynamic>);

  // ignore: sort_constructors_first
  factory Leaderboard.fromJson(Map<String, dynamic> json) => Leaderboard(
        id: json[idKey] as String,
        scores: (jsonDecode(json['scores'] as String) as List)
            .cast<Map<String, dynamic>>()
            .map(LeaderboardScore.fromJson)
            .toList(),
      );
  String toJsonString() => jsonEncode(toJson());

  Map<String, dynamic> toApiData() => toJson()..remove(idKey);

  Map<String, dynamic> toJson() => {
        idKey: id,
        'scores': jsonEncode(scores.map((e) => e.toJson()).toList()),
      };

  @override
  String toString() => 'Leaderboard(scores: $scores)';

  @override
  bool operator ==(covariant Leaderboard other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return listEquals(other.scores, scores);
  }

  @override
  int get hashCode => scores.hashCode;
}
