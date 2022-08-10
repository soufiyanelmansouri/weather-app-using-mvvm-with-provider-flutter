import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'base_view.dart';

import '../../core/themes/dark_theme.dart';
import '../../core/themes/light_theme.dart';
import '../../core/themes/theme_provider.dart';
import '../../core/view_model/weather_viewmodel.dart';

class LocationView extends StatelessWidget {
  const LocationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).box.get('theme');
    return Scaffold(
      backgroundColor: theme ? backgroundColorDark : backgroundColorLight,
      body: Baseview<WeatherViewModel>(
          dispose: false,
          builder: (context, model, child) {
            return Center(
              child: model.state
                  ? const CircularProgressIndicator()
                  : SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MaterialButton(
                            color: Colors.blue,
                            child: const Text(
                              'Get The Weather in your current location',
                            ),
                            onPressed: () async {
                              final Position position = await model
                                  .determinePosition()
                                  .catchError((error) {
                                model.error = error;
                              });
                              await model.getRawWeatherFromCurrentLocation(
                                position.latitude,
                                position.longitude,
                              );
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.all(30),
                            child: Text(
                              model.error,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 17.0,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
            );
          }),
    );
  }
}
