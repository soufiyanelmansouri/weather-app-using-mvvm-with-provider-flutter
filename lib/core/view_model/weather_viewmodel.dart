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

  Future<void> getWeatherCity(String city) async {
    if (callOnModelready) {
      setState(true);
      weather = await weatherApi.getCitydataFromJson(city);
      setState(false);
      callOnModelready = false;
    }
    return weather;
  }

  Future<WeatherModel> serchForCity(String city) async {
    setsecondState(true);
    weather = await weatherApi.getCitydataFromJson(city);
    setsecondState(false);
    return weather;
  }

  Future<void> getRawWeatherFromCurrentLocation(double lat, double lon) async {
    setState(true);
    weather = await weatherApi.getLocationdataFromJson(lat: lat, lon: lon);
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
