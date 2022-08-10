import 'package:geolocator/geolocator.dart';
import 'base_viewmodel.dart';
import '../models/weather_model.dart';
import '../services/weather_service.dart';
import '../../locator.dart';

class WeatherViewModel extends BaseViewModel {
  final WeatherService weatherApi = locator<WeatherService>();
  bool callOnModelready = true;
  dynamic weather;
  String error = '';

  Future<WeatherModel> getWeatherForCity(String city) async {
    if (callOnModelready) {
      setState(true);
      var rawWeatherData = await weatherApi.getdataFromJsonForACity(city);
      weather = WeatherModel.fromJson(rawWeatherData ?? '');
      setState(false);
      callOnModelready = false;
    }
    return weather;
  }

  Future<WeatherModel> serchForCity(String city) async {
    setsecondState(true);
    var rawWeatherData = await weatherApi.getdataFromJsonForACity(city);
    weather = WeatherModel.fromJson(rawWeatherData ?? '');
    setsecondState(false);
    return weather;
  }

  Future<WeatherModel> getRawWeatherFromCurrentLocation(
    double lat,
    double lon,
  ) async {
    setState(true);
    var rawWeatherData =
        await weatherApi.getdataFromJsonForALocation(lat: lat, lon: lon);
    weather = WeatherModel.fromJson(rawWeatherData);
    error = '';
    setState(false);
    return weather;
  }

  Future<Position> determinePosition() async {
    setState(true);
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(false);
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(false);
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      setState(false);
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    setState(false);
    return await Geolocator.getCurrentPosition();
  }
}
