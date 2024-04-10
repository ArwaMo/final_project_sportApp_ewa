import 'package:sport_app/views/resulty_view/widgets/resulty_view_body.dart';

class ResultyViewBody {
  final int success;
  final List<scorersModel> result;

  ResultyViewBody({
    required this.success,
    required this.result,
  });

  factory ResultyViewBody.fromJson(Map<String, dynamic> json) {
    var resultList = json['result'] as List;
    List<scorersModel> playersList =
        resultList.map((player) => scorersModel.fromJson(player)).toList();
    return ResultyViewBody(
      success: json['success'],
      result: playersList,
    );
  }
}

class scorersModel {
  final String playerPlace;
  final String playerName;
  final int playerKey;
  final String teamName;
  final String teamKey;
  final String goals;
  final String? assists;
  final String? penaltyGoals;

  scorersModel({
    required this.playerPlace,
    required this.playerName,
    required this.playerKey,
    required this.teamName,
    required this.teamKey,
    required this.goals,
    required this.assists,
    required this.penaltyGoals,
  });

  factory scorersModel.fromJson(Map<String, dynamic> json) {
    return scorersModel(
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
