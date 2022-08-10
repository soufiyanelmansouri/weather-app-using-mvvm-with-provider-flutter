import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Wind {
  final double speed;
  final int deg;
  Wind({
    required this.speed,
    required this.deg,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'speed': speed,
      'deg': deg,
    };
  }

  factory Wind.fromMap(Map<String, dynamic> map) {
    return Wind(
      speed: map['speed'] as double,
      deg: map['deg'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Wind.fromJson(String source) =>
      Wind.fromMap(json.decode(source) as Map<String, dynamic>);
}
