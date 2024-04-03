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
