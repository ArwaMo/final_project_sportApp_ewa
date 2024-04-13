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
    List<CountryModel> country=[];

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

  Future<dynamic> getInfoTeam(dynamic leagueId, String searchController) async {
    try {
      emit(GetInfoTeamLoading());

      List<TeamTopscorersModel>? result =
          await Services().getTeamsAPI(leagueId, searchController);

      List<TeamTopscorersModel>? teamsResult;
      if (result != null) {
        teamsResult = result;

        emit(GetInfoTeamSuccess(teamsResult));
      } else {
        emit(GetInfoTeamError());
      }
    } catch (e) {
      print('Error fetching teams');
    }
  }

  Future<List<TopscorersModel>?> getInfoTopscorers(dynamic leagueId) async {
    try {
      emit(GetInfoTopscorersLoading());
      List<TopscorersModel>? topScorer =
          await Services().getTopscorersAPI(leagueId);
      print(topScorer);
      print('-------------');
      if (topScorer != null) {
        print(topScorer);
        emit(GetInfoTopscorersSuccess(topScorer));
      } else {
        print('here errror');
        emit(GetInfoTopscorersError());
      }
    } catch (er) {
      print('this catch $er');
    }
    return null;
  }

  Future<List<PlayersModel>?> getInfoPlayers(dynamic teamKey) async {
    try {
      emit(GetInfoPlayersLoading());
      List<PlayersModel>? players = await Services().getPlayersAPI(teamKey);
      print('team');
      print('-------------');
      if (players != null) {
        print(players);
        emit(GetInfoPlayersSuccess(players));
      } else {
        print('here errror');
        emit(GetInfoPlayersError());
      }
    } catch (er) {
      print('this catch $er');
    }
    return null;
  }
}
