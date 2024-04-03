import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sport_app_ewa/services/services.dart';

part 'get_current_country_state.dart';

class GetCurrentCountryCubit extends Cubit<GetCurrentCountryState> {
  GetCurrentCountryCubit() : super(GetCurrentCountryInitial());

  getCurrentCountry() async {
    emit(GetCurrentCountryLoading());
    String? currentCountry;
    String? country = await Services().getCurrentCountry();
    if (country != null) {
      currentCountry = country;
      print('-------$currentCountry');
      emit(GetCurrentCountrySuccess(currentCountry));
    } else {
      emit(GetCurrentCountryError());
    }

    //scrollToCountry(currentCountry ?? '');
  }
}
