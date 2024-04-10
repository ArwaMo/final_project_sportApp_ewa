part of 'get_info_cubit.dart';

@immutable
sealed class GetInfoState {}

final class GetInfoInitial extends GetInfoState {}

final class GetInfoCountryLoading extends GetInfoState {}

final class GetInfoCountrySuccess extends GetInfoState {
  final CountriesList countriesList;
  GetInfoCountrySuccess(this.countriesList);
}

final class GetInfoCountryError extends GetInfoState {}

final class GetInfoLeagueLoading extends GetInfoState {}

final class GetInfoLeagueSuccess extends GetInfoState {
  final LeaguesList leaguesList;
  GetInfoLeagueSuccess(this.leaguesList);
}

final class GetInfoLeagueError extends GetInfoState {}

final class GetInfoTeamLoading extends GetInfoState {}

final class GetInfoTeamSuccess extends GetInfoState {
  final List<TeamTopscorersModel>? teamList;
  GetInfoTeamSuccess(this.teamList);
}

final class GetInfoTeamError extends GetInfoState {}
final class GetInfoTopscorersLoading extends GetInfoState {}

final class GetInfoTopscorersSuccess extends GetInfoState {
  final List<TopscorersModel>? topScorersList;
  GetInfoTopscorersSuccess(this.topScorersList);
}

final class GetInfoTopscorersError extends GetInfoState {}


final class GetInfoPlayersLoading extends GetInfoState {}

final class GetInfoPlayersSuccess extends GetInfoState {
  final List<PlayersModel>? playerList;
  GetInfoPlayersSuccess(this.playerList);
}

final class GetInfoPlayersError extends GetInfoState {}