import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:sport_app_ewa/data/models/countries_model.dart';
import 'package:sport_app_ewa/data/models/leagues_model.dart';
import 'package:sport_app_ewa/data/models/teams_model.dart';
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

  Future<dynamic> getInfoTeam(dynamic leagueId, String searchController) async {
    try {
      emit(GetInfoTeamLoading());

      List<TeamModel>? result =
          await Services().getTeamsAPI(leagueId, searchController);
      // print('here fun getData');
      // print(leagueId);

      List<TeamModel>? teamsResult;
      if (result != null) {
        //  print('here fun getData');
        // print(result);

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
     // print(topScorer);
      if (topScorer != null) {
        emit(GetInfoTopscorersSuccess(topScorer));
      } else {
        emit(GetInfoTopscorersError());
      }
    } catch (er) {
      print('this catch $er');
    }
    return null;
  }
}
