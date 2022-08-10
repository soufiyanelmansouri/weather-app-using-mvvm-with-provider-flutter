import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wetherapp/core/themes/light_theme.dart';
import '../../core/themes/dark_theme.dart';
import '../../core/themes/theme_provider.dart';
import 'base_view.dart';
import 'location_view.dart';
import 'search_view.dart';
import '../../core/view_model/home_viewmodel.dart';
import 'weather_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).box.get('theme');
    return Baseview<HomeViewModel>(
        dispose: false,
        builder: (context, model, child) {
          return Scaffold(
            body: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: getViewForIndex(model.currentIndex),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(
                      color: theme ? foorgroundColorDark : foorgroundColorLight,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(blurRadius: 2, color: Colors.black),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: (() {
                            model.setIndex(0);
                          }),
                          child: Icon(
                            Icons.home,
                            color: model.currentIndex == 0
                                ? activatediconsColorDark
                                : nonactivatediconsColorDark,
                          ),
                        ),
                        GestureDetector(
                          onTap: (() {
                            model.setIndex(1);
                          }),
                          child: Icon(
                            Icons.location_on,
                            color: model.currentIndex == 1
                                ? activatediconsColorDark
                                : nonactivatediconsColorDark,
                          ),
                        ),
                        GestureDetector(
                          onTap: (() {
                            model.setIndex(2);
                          }),
                          child: Icon(
                            Icons.search,
                            color: model.currentIndex == 2
                                ? activatediconsColorDark
                                : nonactivatediconsColorDark,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return const WeatherView();
      case 1:
        return const LocationView();
      case 2:
        return const SearchView();
      default:
        return const HomeView();
    }
  }
}
