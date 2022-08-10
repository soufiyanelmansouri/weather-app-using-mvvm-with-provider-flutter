// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:wetherapp/core/models/temp.dart';
import 'package:wetherapp/core/models/weather.dart';
import 'package:wetherapp/core/models/wind.dart';

class WeatherModel {
  final List<Weather> weather;
  final Temp temp;
  final Wind wind;
  final String cityName;
  int visibility;
  WeatherModel({
    required this.weather,
    required this.temp,
    required this.wind,
    required this.cityName,
    required this.visibility,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'weather': weather.map((x) => x.toMap()).toList(),
      'main': temp.toMap(),
      'wind': wind.toMap(),
      'name': cityName,
      "visibility": visibility,
    };
  }

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(
      weather: List<Weather>.from(
        (map['weather'] as List<dynamic>).map<Weather>(
          (x) => Weather.fromMap(x as Map<String, dynamic>),
        ),
      ),
      temp: Temp.fromMap(map['main'] as Map<String, dynamic>),
      wind: Wind.fromMap(map['wind'] as Map<String, dynamic>),
      cityName: map['name'] as String,
      visibility: map["visibility"] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherModel.fromJson(String source) =>
      WeatherModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
