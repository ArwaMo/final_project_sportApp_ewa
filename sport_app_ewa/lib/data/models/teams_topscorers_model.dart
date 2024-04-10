import 'package:sport_app_ewa/data/models/players_model.dart';

class ApiResponse {
  final int success;
  final List<TeamTopscorersModel> result;

  ApiResponse({required this.success, required this.result});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    var list = json['result'] as List;
    List<TeamTopscorersModel> resultList =
        list.map((i) => TeamTopscorersModel.fromJson(i)).toList();
    return ApiResponse(success: json['success'], result: resultList);
  }
}

class TeamTopscorersModel {
  final int teamKey;
  final String teamName;
  final String? teamLogo;
  final List<PlayersModel> players;

  TeamTopscorersModel({
    required this.teamKey,
    required this.teamName,
    required this.teamLogo,
    required this.players,
  });

  factory TeamTopscorersModel.fromJson(Map<String, dynamic> json) {
    var list = json['players'] as List;
    List<PlayersModel> playersList =
        list.map((i) => PlayersModel.fromJson(i)).toList();
    return TeamTopscorersModel(
      teamKey: json['team_key'],
      teamName: json['team_name'],
      teamLogo: json['team_logo'],
      players: playersList,
    );
  }
}

class Player {
  final int? playerKey;
  final String? playerName;
  final String? playerNumber;
  final dynamic playerCountry;
  final String? playerType;
  final String? playerAge;
  final String? playerMatchPlayed;
  final String? playerGoals;
  final String? playerYellowCards;
  final String? playerRedCards;
  final String? playerImage;

  Player({
    required this.playerKey,
    required this.playerName,
    required this.playerNumber,
    this.playerCountry,
    required this.playerType,
    required this.playerAge,
    required this.playerMatchPlayed,
    required this.playerGoals,
    required this.playerYellowCards,
    required this.playerRedCards,
    required this.playerImage,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      playerKey: json['player_key'],
      playerName: json['player_name'],
      playerNumber: json['player_number'] ?? "",
      playerCountry: json['player_country'],
      playerType: json['player_type'],
      playerAge: json['player_age'] ?? "",
      playerMatchPlayed: json['player_match_played'] ?? "",
      playerGoals: json['player_goals'] ?? "",
      playerYellowCards: json['player_yellow_cards'] ?? "",
      playerRedCards: json['player_red_cards'] ?? "",
      playerImage: json['player_image'],
    );
  }
}
