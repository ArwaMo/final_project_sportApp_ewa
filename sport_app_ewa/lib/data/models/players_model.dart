class PlayerResponse {
  int? success;
  List<PlayersModel>? result;

  PlayerResponse({this.success, this.result});

  factory PlayerResponse.fromJson(Map<String, dynamic> json) {
    return PlayerResponse(
      success: json['success'],
      result: json['result'] != null
          ? (json['result'] as List)
              .map((i) => PlayersModel.fromJson(i))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PlayersModel {
  int? playerKey;
  String? playerName;
  String? playerNumber;
  dynamic playerCountry;
  String? playerType;
  String? playerAge;
  String? playerMatchPlayed;
  String? playerGoals;
  String? playerYellowCards;
  String? playerRedCards;
  String? playerMinutes;
  String? playerInjured;
  String? playerSubstituteOut;
  String? playerSubstitutesOnBench;
  String? playerAssists;
  String? playerIsCaptain;
  String? teamName;
  int? teamKey;
  String? playerImage;

  PlayersModel({
    this.playerKey,
    this.playerName,
    this.playerNumber,
    this.playerCountry,
    this.playerType,
    this.playerAge,
    this.playerMatchPlayed,
    this.playerGoals,
    this.playerYellowCards,
    this.playerRedCards,
    this.playerMinutes,
    this.playerInjured,
    this.playerSubstituteOut,
    this.playerSubstitutesOnBench,
    this.playerAssists,
    this.playerIsCaptain,
    this.teamName,
    this.teamKey,
    this.playerImage,
  });

  factory PlayersModel.fromJson(Map<String, dynamic> json) {
    return PlayersModel(
      playerKey: json['player_key'],
      playerName: json['player_name'],
      playerNumber: json['player_number'],
      playerCountry: json['player_country'],
      playerType: json['player_type'],
      playerAge: json['player_age'],
      playerMatchPlayed: json['player_match_played'],
      playerGoals: json['player_goals'],
      playerYellowCards: json['player_yellow_cards'],
      playerRedCards: json['player_red_cards'],
      playerMinutes: json['player_minutes'],
      playerInjured: json['player_injured'],
      playerSubstituteOut: json['player_substitute_out'],
      playerSubstitutesOnBench: json['player_substitutes_on_bench'],
      playerAssists: json['player_assists'],
      playerIsCaptain: json['player_is_captain'],
      teamName: json['team_name'],
      teamKey: json['team_key'],
      playerImage: json['player_image'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['player_key'] = playerKey;
    data['player_name'] = playerName;
    data['player_number'] = playerNumber;
    data['player_country'] = playerCountry;
    data['player_type'] = playerType;
    data['player_age'] = playerAge;
    data['player_match_played'] = playerMatchPlayed;
    data['player_goals'] = playerGoals;
    data['player_yellow_cards'] = playerYellowCards;
    data['player_red_cards'] = playerRedCards;
    data['player_minutes'] = playerMinutes;
    data['player_injured'] = playerInjured;
    data['player_substitute_out'] = playerSubstituteOut;
    data['player_substitutes_on_bench'] = playerSubstitutesOnBench;
    data['player_assists'] = playerAssists;
    data['player_is_captain'] = playerIsCaptain;
    data['team_name'] = teamName;
    data['team_key'] = teamKey;
    data['player_image'] = playerImage;
    return data;
  }
}
