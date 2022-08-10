import 'package:flutter/foundation.dart';

class BaseViewModel with ChangeNotifier {
  bool _state = false;
  bool get state => _state;
  void setState(bool newState) {
    _state = newState;
    notifyListeners();
  }

  bool _secondState = false;
  bool get secondState => _secondState;
  void setsecondState(bool newState) {
    _secondState = newState;
    notifyListeners();
  }
}
