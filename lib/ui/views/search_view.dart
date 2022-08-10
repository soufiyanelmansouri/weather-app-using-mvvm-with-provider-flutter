import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'base_view.dart';

import '../../core/themes/dark_theme.dart';
import '../../core/themes/light_theme.dart';
import '../../core/themes/theme_provider.dart';
import '../../core/view_model/weather_viewmodel.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController textEditingController = TextEditingController();
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).box.get('theme');
    return Scaffold(
      backgroundColor: theme ? backgroundColorDark : backgroundColorLight,
      body: Baseview<WeatherViewModel>(
          dispose: false,
          builder: (context, model, child) {
            return Center(
              child: model.secondState
                  ? const CircularProgressIndicator()
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: textEditingController,
                        onSubmitted: ((value) {
                          model.serchForCity(textEditingController.text);
                          textEditingController.clear();
                        }),
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          prefixIcon: Icon(Icons.location_city),
                          hintText: 'Enter Your City Here',
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                        ),
                      ),
                    ),
            );
          }),
    );
  }
}
