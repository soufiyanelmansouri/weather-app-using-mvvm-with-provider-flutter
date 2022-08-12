import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wetherapp/core/models/temp.dart';
import 'package:wetherapp/core/models/weather_model.dart';
import 'package:wetherapp/core/models/wind.dart';
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
    expect(sut.state, false);
    expect(sut.weather, null);
    expect(sut.error, '');
  });

  group('Weather View Model', () {
    var model = WeatherModel(
        cityName: 'city1',
        temp: Temp(temp: 0.0, tempMax: 0.0, tempMin: 0.0, humidity: 1),
        visibility: 1,
        weather: [],
        wind: Wind(deg: 10, speed: 10.0));
    void arrange() {
      when((() => mockWeatherService.getCitydataFromJson(''))).thenAnswer(
        (invocation) => Future.value(model),
      );
    }

    //
    test(
      "Checking if the method in the services get called",
      () async {
        arrange();
        await sut.getWeatherCity('');
        verify(() => mockWeatherService.getCitydataFromJson('')).called(1);
      },
    );

    //
    test(
      """Check Calling get getWeatherCity and loading data,
       set weather model to the one from the service""",
      () async {
        arrange();
        final future = sut.getWeatherCity('');
        expect(sut.state, true);
        await future;
        expect(sut.weather, model);
        expect(sut.state, false);
        expect(sut.callOnModelready, false);
      },
    );
  });
}
