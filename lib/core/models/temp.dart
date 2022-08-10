import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Temp {
  final double temp;
  final double tempMin;
  final double tempMax;
  final int humidity;
  Temp({
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.humidity,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'temp': temp,
      'temp_min': tempMin,
      'temp_max': tempMax,
      'humidity': humidity,
    };
  }

  factory Temp.fromMap(Map<String, dynamic> map) {
    return Temp(
      temp: map['temp'] as double,
      tempMin: map['temp_min'] as double,
      tempMax: map['temp_max'] as double,
      humidity: map['humidity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Temp.fromJson(String source) =>
      Temp.fromMap(json.decode(source) as Map<String, dynamic>);
}
