import 'dart:convert';

class LeaderboardScore {
  LeaderboardScore({
    required this.playerId,
    required this.playerName,
    required this.score,
    required this.timestamp,
  });

  final String playerId;
  final String playerName;
  final double score;
  final DateTime timestamp;

  // ignore: sort_constructors_first
  factory LeaderboardScore.fromJsonString(String source) =>
      LeaderboardScore.fromJson(jsonDecode(source) as Map<String, dynamic>);

  // ignore: sort_constructors_first
  factory LeaderboardScore.fromJson(Map<String, dynamic> json) => LeaderboardScore(
        playerId: json['playerId'] as String,
        playerName: json['playerName'] as String,
        score: json['score'] as double,
        timestamp: DateTime.fromMillisecondsSinceEpoch(json['timestamp'] as int),
      );

  String toJsonString() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => {
        'playerId': playerId,
        'playerName': playerName,
        'score': score,
        'timestamp': timestamp.millisecondsSinceEpoch,
      };

  @override
  String toString() =>
      'LeaderboardScore(playerId: $playerId, playerName: $playerName, score: $score, timestamp: $timestamp)';

  @override
  bool operator ==(covariant LeaderboardScore other) {
    if (identical(this, other)) return true;

    return other.playerId == playerId &&
        other.playerName == playerName &&
        other.score == score &&
        other.timestamp == timestamp;
  }

  @override
  int get hashCode => playerId.hashCode ^ playerName.hashCode ^ score.hashCode ^ timestamp.hashCode;
}
