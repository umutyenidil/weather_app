part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

class InitialWeatherState extends WeatherState {}

class LoadingWeatherState extends WeatherState {}

class LoadedWeatherState extends WeatherState {
  final WeatherModel weatherData;

  LoadedWeatherState({required this.weatherData});
}
