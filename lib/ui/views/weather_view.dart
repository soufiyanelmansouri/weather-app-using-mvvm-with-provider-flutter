import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/themes/dark_theme.dart';
import '../../core/themes/light_theme.dart';
import '../../core/themes/theme_provider.dart';
import 'base_view.dart';
import '../../core/view_model/weather_viewmodel.dart';
import '../widgets/weather_widgets.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).box.get('theme');
    return Baseview<WeatherViewModel>(
      dispose: false,
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          backgroundColor: theme ? backgroundColorDark : backgroundColorLight,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      width: 80,
                      decoration:
                          const BoxDecoration(color: Colors.transparent),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 80,
                      child: Text(
                        model.weather.cityName,
                        style: TextStyle(
                            color: theme ? Colors.white : Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                        color:
                            theme ? foorgroundColorDark : backgroundColorDark,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ThemeWidget(
                            theme: Provider.of<ThemeProvider>(context),
                            imageUrl: 'assets/svg/sun.svg',
                            color1: nonactivatediconsColorDark,
                            color2: const Color.fromARGB(255, 255, 131, 7),
                            onTap: () => Provider.of<ThemeProvider>(context,
                                    listen: false)
                                .setTheme(false),
                            activeContainerColor: Colors.transparent,
                            nonActiveContainerColor: Colors.white,
                          ),
                          ThemeWidget(
                            theme: Provider.of<ThemeProvider>(context),
                            imageUrl: 'assets/svg/moon.svg',
                            color1: Colors.blue,
                            color2: Colors.blueGrey,
                            onTap: () => Provider.of<ThemeProvider>(context,
                                    listen: false)
                                .setTheme(true),
                            activeContainerColor: Colors.white,
                            nonActiveContainerColor: Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'Today\'s Report',
                  style: TextStyle(
                    color: theme ? Colors.white : Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                WeatherInfo(
                  theme: theme,
                  imageUrl:
                      'http://openweathermap.org/img/wn/${model.weather.weather[0].icon}@2x.png',
                  description: model.weather.weather[0].description,
                  temp:
                      '${model.weather.temp.temp.toString().substring(0, 2)}°',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    WeatherWidget(
                      theme: theme,
                      image: 'assets/icons/humidity.png',
                      text: model.weather.temp.humidity.toString(),
                      secondText: 'Humidity',
                    ),
                    WeatherWidget(
                      theme: theme,
                      image: 'assets/icons/speed.png',
                      text: model.weather.wind.speed.toString(),
                      secondText: """WSW\nWind Speed""",
                    ),
                    WeatherWidget(
                      theme: theme,
                      image: 'assets/icons/visibility.png',
                      text: '${(model.weather.visibility / 1000)}Km',
                      secondText: 'Visibility',
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
