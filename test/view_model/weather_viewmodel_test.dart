import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:wetherapp/core/services/weather_service.dart';
import 'package:wetherapp/core/view_model/weather_viewmodel.dart';
import 'package:wetherapp/locator.dart';

class MockWeatherService extends Mock implements WeatherService {}

void main() {
  late MockWeatherService mockWeatherService;
  late WeatherViewModel sut;
  setUp(() {
    mockWeatherService = MockWeatherService();
    locator.registerSingleton<WeatherService>(mockWeatherService);
    sut = WeatherViewModel();
  });

  test('Testing initial values', () {
    expect(sut.callOnModelready, true);
    expect(sut.weather, null);
    expect(sut.error, '');
  });
}
