// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ThemeProvider extends ChangeNotifier {
  var box = Hive.box('myBox');
  setTheme(bool value) {
    box.put('theme', value);
    notifyListeners();
  }
}
