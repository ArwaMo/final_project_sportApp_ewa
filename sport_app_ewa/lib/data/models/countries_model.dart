import 'package:flutter/rendering.dart';

class CountryModel {
  final int countryKey;
  final String? countryName;
  final String? countryIso2;
  final String? countryLogo;

  CountryModel({
    required this.countryKey,
    required this.countryName,
    this.countryIso2,
    required this.countryLogo,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      countryKey: json['country_key'],
      countryName: json['country_name'],
      countryIso2: json['country_iso2'],
      countryLogo: json['country_logo'],
    );
  }
}

class CountriesList {
  final List<CountryModel> countries;

  CountriesList({required this.countries});

  factory CountriesList.fromJson(List<dynamic> parsedJson) {
    List<CountryModel> countries =
        parsedJson.map((i) => CountryModel.fromJson(i)).toList();
    return CountriesList(countries: countries);
  }
}
