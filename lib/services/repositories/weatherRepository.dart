import 'dart:convert';

import 'package:weather_app/datas/datas.dart';
import 'package:weather_app/locator.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/apiClients/weatherApiClient.dart';

class WeatherRepository {

  final WeatherApiClient _apiClient = Locator.locator<WeatherApiClient>();

  Future<WeatherModel> getWeather(String cityName) async {
    final data = await _apiClient.getData(cityName);
    return data;
  }
}
