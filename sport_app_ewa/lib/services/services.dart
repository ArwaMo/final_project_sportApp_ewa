import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sport_app_ewa/data/models/countries_model.dart';
import 'package:sport_app_ewa/data/models/leagues_model.dart';
import 'package:geocoding/geocoding.dart';
import 'package:sport_app_ewa/data/models/teams_model.dart';
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
          return LeaguesList(leagues: leagues);
        }
      }
      return null;
    } catch (e) {
      print('Error fetching leagues');
      return null;
    }
  }

  Future<List<TeamModel>?> getTeamsAPI(int leagueId, String? teamName) async {
    try {
      final response = await dio.post(
        'https://apiv2.allsportsapi.com/football/?&met=Teams&teamId=$leagueId&APIkey=037b2205da5369b0242afd963c92f07b3f7105c095c399105d53a811f78202f1',
      );

      if (response.statusCode == 200) {
        final getData = response.data;

        if (getData != null &&
            getData['success'] == 1 &&
            getData['result'] != null) {
          List<dynamic> resultsData = getData['result'];
          List<TeamModel> results =
              resultsData.map((item) => TeamModel.fromJson(item)).toList();

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

  Future<List<TopscorersModel>?> getTopscorersAPI(int leagueId) async {
    try {
      final response = await dio.get(
        'https://apiv2.allsportsapi.com/football/?&met=Topscorers&leagueId=$leagueId&APIkey=037b2205da5369b0242afd963c92f07b3f7105c095c399105d53a811f78202f1',
      );
      // print(leagueId);
      if (response.statusCode == 200) {
        final data = response.data;
        // print(data);
        if (data != null && data['success'] == 1 && data['result'] != null) {
          //  print('object');
          final List<dynamic> results = data['result'];
          //  print(results);

          List<TopscorersModel> topScorer =
              results.map((item) => TopscorersModel.fromJson(item)).toList();
          // final List<TopscorersModel> topScorer = results
          //     .map<TopscorersModel>(
          //         (dynamic item) => TopscorersModel.fromJson(item))
          //     .toList();
          print('=================');
          print(topScorer);
          return topScorer;
        } else {
          print('Error: Invalid API response');

          //hanling this is not found
          return null;
        }
      } else {
        //   print('HTTP Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      //  print('Error fetching teams: $e');
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
