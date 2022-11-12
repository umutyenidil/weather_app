import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/locator.dart';
import 'package:weather_app/models/weather_model.dart';


import 'package:weather_app/services/repositories/weatherRepository.dart';


part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository = Locator.locator<WeatherRepository>();

  WeatherBloc() : super(InitialWeatherState()) {
    on<WeatherEvent>((event, emit) async {
      if (event is GetWeatherEvent) {
        emit(LoadingWeatherState());
        WeatherModel data = await weatherRepository.getWeather(event.cityName);

        emit(LoadedWeatherState(weatherData: data));
      }
    });
  }
}
