import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:sport_app_ewa/data/models/countries_model.dart';
import 'package:sport_app_ewa/data/models/leagues_model.dart';
import 'package:sport_app_ewa/data/models/players_model.dart';
import 'package:sport_app_ewa/data/models/teams_topscorers_model.dart';
import 'package:sport_app_ewa/data/models/topscorers_model.dart';
import 'package:sport_app_ewa/services/services.dart';

part 'get_info_state.dart';

class GetInfoCubit extends Cubit<GetInfoState> {
  GetInfoCubit() : super(GetInfoInitial());

  getInfoCountry() async {
    emit(GetInfoCountryLoading());

    CountriesList? countriesList = await Services().getCountryAPI();

    if (countriesList != null) {
      emit(GetInfoCountrySuccess(countriesList));
    } else {
      emit(GetInfoCountryError());
    }
  }

  getInfoLeagues(dynamic countryKey) async {
    emit(GetInfoLeagueLoading());

    LeaguesList? leaguesList;

    leaguesList = await Services().getLeaguesAPI(countryKey);

    if (leaguesList != null) {
      emit(GetInfoLeagueSuccess(leaguesList));
    } else {
      emit(GetInfoLeagueError());
    }
  }

  Future<dynamic> getInfoTeam(dynamic leagueId, String? teamName) async {
    try {
      emit(GetInfoTeamLoading());

      List<TeamTopscorersModel>? result =
          await Services().getTeamsAPI(leagueId, teamName);

      List<TeamTopscorersModel>? teamsResult;
      if (result != null) {
        teamsResult = result;

        emit(GetInfoTeamSuccess(teamsResult));
      } else {
        emit(GetInfoTeamError());
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<TopscorersModel>?> getInfoTopscorers(dynamic leagueId) async {
    try {
      emit(GetInfoTopscorersLoading());
      List<TopscorersModel>? topScorer =
          await Services().getTopscorersAPI(leagueId);

      if (topScorer != null) {
        emit(GetInfoTopscorersSuccess(topScorer));
      } else {
        emit(GetInfoTopscorersError());
      }
    } catch (er) {
      throw Exception(er);
    }
    return null;
  }

  Future<void> getInfoPlayers(
      List<PlayersModel> players, String? playerName) async {
    try {
      emit(GetInfoPlayersLoading());

      List<Future<List<PlayersModel>?>> futures = [];

      for (var player in players) {
        futures.add(Services().getPlayersAPI(player.playerKey, playerName));
      }

      List<List<PlayersModel>?> results = await Future.wait(futures);

      List<PlayersModel> finalResults = [];

      for (var result in results) {
        if (result != null) {
          finalResults.addAll(result);
        }
      }

      emit(GetInfoPlayersSuccess(finalResults));
    } catch (e) {
      emit(GetInfoPlayersError());
    }
  }
}
