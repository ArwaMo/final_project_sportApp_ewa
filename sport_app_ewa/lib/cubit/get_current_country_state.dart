part of 'get_current_country_cubit.dart';

@immutable
sealed class GetCurrentCountryState {}

final class GetCurrentCountryInitial extends GetCurrentCountryState {}

final class GetCurrentCountryLoading extends GetCurrentCountryState {}

final class GetCurrentCountrySuccess extends GetCurrentCountryState {
  final String? currentCountry;
  GetCurrentCountrySuccess(this.currentCountry);
}

final class GetCurrentCountryError extends GetCurrentCountryState {}
