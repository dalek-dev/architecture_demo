import 'package:flutter/material.dart';

class TimeProvider with ChangeNotifier {
  bool _isTriggerOffsetY = false;

  bool get isTriggerOffsetY => _isTriggerOffsetY;

  void startAnimation() {
    _isTriggerOffsetY = true;
    notifyListeners();
  }
}
