// A wrapper class around Appwrite API configuration.
// Hints > Location > In > Appwrite > Console
class ApiConfig {
  // Endpoint of the Appwrite application API.
  // > Home > Settings > Overview
  static const String endpoint = '<api-endpoint>';
  // ID of the game project.
  // > Home > Settings > Overview
  static const String projectId = '<game-project-id>';
  // ID of the score processor function.
  // > Functions > [function-name] Settings > Overview
  static const String scoreProcessorId = '<score-processor-function-id>';
  // ID of the game database.
  // > Database > [database-name] > Settings
  static const String databaseId = '<game-database-id>';
  // ID of the leaderboards collection.
  // > Database > [database-name] > [collection-name] > Settings
  static const String leaderboardsId = '<leaderboards-collection-id>';
  // ID of the scores collection.
  // > Database > [database-name] > [collection-name] > Settings
  static const String scoresId = '<scores-collection-id>';
}
