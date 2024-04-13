import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sport_app_ewa/data/models/countries_model.dart';
import 'package:sport_app_ewa/data/models/leagues_model.dart';
import 'package:geocoding/geocoding.dart';
import 'package:sport_app_ewa/data/models/players_model.dart';
import 'package:sport_app_ewa/data/models/teams_topscorers_model.dart';
import 'package:sport_app_ewa/data/models/topscorers_model.dart';

class Services {
  final dio = Dio();
  Future<CountriesList?> getCountryAPI() async {
    try {
      Response response = await dio.get(
          'https://apiv2.allsportsapi.com/football/?met=Countries&APIkey=037b2205da5369b0242afd963c92f07b3f7105c095c399105d53a811f78202f1');

      if (response.statusCode != 200) {
        return null;
      } else {
        List<dynamic> parsedJson = response.data['result'];

        List<CountryModel> countries =
            parsedJson.map((json) => CountryModel.fromJson(json)).toList();

        CountriesList data = CountriesList(countries: countries);

        return data;
      }
    } catch (er) {
      throw Exception(er);
    }
  }

  Future<LeaguesList?> getLeaguesAPI(dynamic countryId) async {
    try {
      final response = await dio.get(
        'https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=037b2205da5369b0242afd963c92f07b3f7105c095c399105d53a811f78202f1',
        queryParameters: {"countryId": countryId},
      );

      if (response.statusCode == 200) {
        final data = response.data;
        if (data != null && data['success'] == 1 && data['result'] != null) {
          final List<dynamic> results = data['result'];
          final List<LeagueModel> leagues = results
              .map((dynamic item) => LeagueModel.fromJson(item))
              .toList();
          print('this api country$countryId');
          return LeaguesList(leagues: leagues);
        }
      }
      return null;
    } catch (e) {
      print('Error fetching leagues');
      return null;
    }
  }

// here
  Future<List<TeamTopscorersModel>?> getTeamsAPI(
      int leagueId, String? teamName) async {
    try {
      final response = await dio.get(
        'https://apiv2.allsportsapi.com/football/?&met=Teams&teamId=$leagueId&APIkey=037b2205da5369b0242afd963c92f07b3f7105c095c399105d53a811f78202f1',
      );

      // print('this res $response');
      if (response.statusCode == 200) {
        final getData = response.data;

        if (getData != null &&
            getData['success'] == 1 &&
            getData['result'] != null) {
          List<dynamic> resultsData = getData['result'];
          // print(resultsData);
          List<TeamTopscorersModel> results = resultsData
              .map((item) => TeamTopscorersModel.fromJson(item))
              .toList();
          print('this api leagueId$leagueId');

          return results;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<List<TopscorersModel>?> getTopscorersAPI(dynamic leagueId) async {
    try {
      final response = await dio.get(
        'https://apiv2.allsportsapi.com/football/?&met=Topscorers&leagueId=$leagueId&APIkey=037b2205da5369b0242afd963c92f07b3f7105c095c399105d53a811f78202f1',
      );

      if (response.statusCode == 200) {
        final data = response.data;

        if (data != null && data['success'] == 1) {
          if (data['result'] != null) {
            List<dynamic> result;
            if (data['result'] is String) {
              result = jsonDecode(data['result']);
            } else if (data['result'] is List) {
              result = data['result'];
            } else {
              // print('Error: Unexpected data structure for result');
              return null;
            }

            final List<TopscorersModel> results =
                result.map((json) => TopscorersModel.fromJson(json)).toList();
            return results;
          } else {
            //   print('Data not available');
            return null;
          }
        } else {
          // print('Error: Invalid API response');
          return null;
        }
      } else {
        //   print('Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      //  print('Error: $e');
      return null;
    }
  }

  Future<List<PlayersModel>?> getPlayersAPI(dynamic teamKey) async {
    try {
      final response = await dio.get(
        'https://apiv2.allsportsapi.com/football/?&met=Players&teamId=$teamKey&APIkey=037b2205da5369b0242afd963c92f07b3f7105c095c399105d53a811f78202f1',
      );

      if (response.statusCode == 200) {
        final data = response.data;

        if (data != null && data['success'] == 1) {
          if (data['result'] != null) {
            List<dynamic> result;
            //  print('pppp'); //done
            if (data['result'] is String) {
              result = jsonDecode(data['result']);
              //print('String');
            } else if (data['result'] is List) {
              result = data['result'];
              // print('List');
              // print('list data[' 'result' ']$result');
            } else {
              // print('Error: Unexpected data structure for result');
              return null;
            }

            final List<PlayersModel> results =
                result.map((json) => PlayersModel.fromJson(json)).toList();
            // print('after json');
            //  print(results[0].teamName);
            return results;
          } else {
            //  print('Data not available');
            return null;
          }
        } else {
          //  print('Error: Invalid API response');
          return null;
        }
      } else {
        // print('Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      //  print('Error: $e');
      return null;
    }
  }

  getCurrentCountry() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }

    if (permission == LocationPermission.whileInUse) {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      return placemarks.first.country;
    }
  }
}
