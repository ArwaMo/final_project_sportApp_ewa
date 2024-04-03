class PlayerData {
  final int success;
  final List<TopscorersModel> result;

  PlayerData({
    required this.success,
    required this.result,
  });

  factory PlayerData.fromJson(Map<String, dynamic> json) {
    var resultList = json['result'] as List;
    List<TopscorersModel> playersList =
        resultList.map((player) => TopscorersModel.fromJson(player)).toList();
    return PlayerData(
      success: json['success'],
      result: playersList,
    );
  }
}

class TopscorersModel {
  final String playerPlace;
  final String playerName;
  final int playerKey;
  final String teamName;
  final String teamKey;
  final String goals;
  final String? assists;
  final String penaltyGoals;

  TopscorersModel({
    required this.playerPlace,
    required this.playerName,
    required this.playerKey,
    required this.teamName,
    required this.teamKey,
    required this.goals,
    required this.assists,
    required this.penaltyGoals,
  });

  factory TopscorersModel.fromJson(Map<String, dynamic> json) {
    return TopscorersModel(
      playerPlace: json['player_place'],
      playerName: json['player_name'],
      playerKey: json['player_key'],
      teamName: json['team_name'],
      teamKey: json['team_key'],
      goals: json['goals'],
      assists: json['assists'],
      penaltyGoals: json['penalty_goals'],
    );
  }
}
