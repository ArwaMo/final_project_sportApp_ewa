import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sport_app_ewa/data/models/countries_model.dart';
import 'package:sport_app_ewa/data/models/leagues_model.dart';
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
}
