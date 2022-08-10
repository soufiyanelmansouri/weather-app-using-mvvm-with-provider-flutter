import 'package:http/http.dart' as http;

import '../constants/api_constants.dart';

class WeatherService {
  Future<String>? getdataFromJsonForACity(String city) async {
    var response = await http
        .get(Uri.parse('${baseUrl}weather?q=$city&appid=$apiKey&units=metric'));
    return response.body;
  }

  Future<dynamic> getdataFromJsonForALocation({
    required double lat,
    required double lon,
  }) async {
    var response = await http.get(Uri.parse(
        '${baseUrl}weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric'));

    return response.body;
  }
}
