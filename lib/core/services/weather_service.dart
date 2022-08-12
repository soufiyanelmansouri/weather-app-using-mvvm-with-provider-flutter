import 'package:http/http.dart' as http;

import '../constants/api_constants.dart';
import '../models/weather_model.dart';

class WeatherService {
  Future<WeatherModel> getCitydataFromJson(String city) async {
    var response = await http
        .get(Uri.parse('${baseUrl}weather?q=$city&appid=$apiKey&units=metric'));
    var model = WeatherModel.fromJson(response.body);
    return model;
  }

  Future<WeatherModel> getLocationdataFromJson(
      {required double lat, required double lon}) async {
    var response = await http.get(Uri.parse(
        '${baseUrl}weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric'));
    var model = WeatherModel.fromJson(response.body);
    return model;
  }
}
