import 'package:flutter/material.dart';
import 'package:wetherapp/ui/views/splash_screen.dart';
import '../views/home_view.dart';
import '../views/weather_view.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/weather':
        return MaterialPageRoute(builder: (_) => const WeatherView());
      case '/search':
        return MaterialPageRoute(builder: (_) => const WeatherView());
      case '/location':
        return MaterialPageRoute(builder: (_) => const WeatherView());
      default:
        return MaterialPageRoute(builder: (_) => const HomeView());
    }
  }
}
