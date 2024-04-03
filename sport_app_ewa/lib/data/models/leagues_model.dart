class LeagueModel {
  final int leagueKey;
  final String? leagueName;
  final int countryKey;
  final String? countryName;
  final String? leagueLogo;
  final String? countryLogo;

  LeagueModel({
    required this.leagueKey,
    required this.leagueName,
    required this.countryKey,
    required this.countryName,
    required this.leagueLogo,
    required this.countryLogo,
  });

  factory LeagueModel.fromJson(Map<String, dynamic> json) {
    return LeagueModel(
      leagueKey: json['league_key'],
      leagueName: json['league_name'],
      countryKey: json['country_key'],
      countryName: json['country_name'],
      leagueLogo: json['league_logo'],
      countryLogo: json['country_logo'],
    );
  }
}

class LeaguesList {
  final List<LeagueModel> leagues;

  LeaguesList({required this.leagues});

  factory LeaguesList.fromJson(Map<String, dynamic> json) {
    List<dynamic> result = json['result'];
    List<LeagueModel> leagues =
        result.map((league) => LeagueModel.fromJson(league)).toList();
    return LeaguesList(leagues: leagues);
  }
}
