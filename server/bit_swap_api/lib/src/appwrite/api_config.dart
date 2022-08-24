import 'dart:convert';

import 'package:yaml/yaml.dart';

// A wrapper class around Appwrite API configuration.
// Hints > Location > In > Appwrite > Console
class ApiConfig {
  ApiConfig({
    required this.endpoint,
    required this.projectId,
    required this.scoreProcessorId,
    required this.databaseId,
    required this.leaderboardsId,
    required this.scoresId,
  });

  static late final ApiConfig instance;

  static void initialize(String yamlString) {
    instance = ApiConfig.fromYaml(yamlString);
  }

  // Endpoint of the Appwrite application API.
  // > Home > Settings > Overview
  final String endpoint;
  // ID of the game project.
  // > Home > Settings > Overview
  final String projectId;
  // ID of the score processor function.
  // > Functions > [function-name] Settings > Overview
  final String scoreProcessorId;
  // ID of the game database.
  // > Database > [database-name] > Settings
  final String databaseId;
  // ID of the leaderboards collection.
  // > Database > [database-name] > [collection-name] > Settings
  final String leaderboardsId;
  // ID of the scores collection.
  // > Database > [database-name] > [collection-name] > Settings
  final String scoresId;

  factory ApiConfig.fromYaml(String yamlString) =>
      ApiConfig.fromJson(jsonDecode(jsonEncode(loadYaml(yamlString))));

  factory ApiConfig.fromJson(Map<String, dynamic> json) => ApiConfig(
        endpoint: json['endpoint'],
        projectId: json['project_id'],
        scoreProcessorId: json['score_processor_id'],
        databaseId: json['database_id'],
        leaderboardsId: json['leaderboards_id'],
        scoresId: json['scores_id'],
      );
}
