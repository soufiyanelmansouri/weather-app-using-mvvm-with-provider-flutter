import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:wetherapp/core/themes/dark_theme.dart';
import 'package:wetherapp/core/view_model/weather_viewmodel.dart';
import 'package:wetherapp/ui/views/base_view.dart';
import 'package:wetherapp/ui/views/home_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(microseconds: 0)).then((value) async {
      var box = Hive.box('myBox');
      var theme = box.get('theme');
      if (theme == null) {
        await box.put('theme', true);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Baseview<WeatherViewModel>(
        dispose: false,
        onModelready: (init) async {
          init.getWeatherCity('london');
        },
        builder: (context, model, child) {
          return model.state
              ? Scaffold(
                  backgroundColor: backgroundColorDark,
                  body: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Center(
                        child:
                            Image(image: AssetImage('assets/images/image.png')),
                      ),
                      Center(child: CircularProgressIndicator()),
                    ],
                  ),
                )
              : const HomeView();
        });
  }
}
