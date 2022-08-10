import 'package:get_it/get_it.dart';
import 'core/services/weather_service.dart';
import 'core/view_model/home_viewmodel.dart';
import 'core/view_model/weather_viewmodel.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => HomeViewModel());
  locator.registerLazySingleton(() => WeatherService());
  locator.registerLazySingleton(() => WeatherViewModel());
}
