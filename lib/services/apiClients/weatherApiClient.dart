import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherApiClient {

  final http.Client httpClient = http.Client();

  Future<WeatherModel> getData(String cityName) async {

    final String _url = 'yahoo-weather5.p.rapidapi.com';
    final Map<String, dynamic> _parameters = {
      'location': cityName,
      'format': 'json',
      'u': 'c',
    };
    final Map<String, String> _headers = {
      'X-RapidAPI-Key': '87c69055c4msh2fe620635e2cf20p197371jsn4b285a5bc52f',
      'X-RapidAPI-Host': 'yahoo-weather5.p.rapidapi.com',
    };



    final response = await httpClient.get(Uri.https(_url, '/weather', _parameters), headers: _headers);

    if (response.statusCode != 200) {
      throw Exception('An error occured');
    }

    return WeatherModel.fromJson(jsonDecode(response.body));
  }
}
