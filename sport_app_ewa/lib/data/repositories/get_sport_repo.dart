import 'package:dio/dio.dart';

class GetSportRepo {
  final dio = Dio();

  void getSport() async {
    Response response;
    response = await dio.get("http://api.worldbank.org/v2/country");

    print(" this is the response from get sport api: $response");
  }
  
  static Dio() {}
}

mixin Response {
}
