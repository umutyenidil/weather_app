import 'package:get_it/get_it.dart';
import 'package:weather_app/services/apiClients/weatherApiClient.dart';
import 'package:weather_app/services/repositories/weatherRepository.dart';

class Locator {
  static GetIt locator = GetIt.asNewInstance();

  static void setupLocator() {
    locator.registerLazySingleton(() => WeatherRepository());
    locator.registerLazySingleton(() => WeatherApiClient());
  }
}
