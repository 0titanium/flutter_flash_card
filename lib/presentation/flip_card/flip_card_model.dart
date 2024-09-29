import 'package:flutter/material.dart';

class FlipCardModel extends ChangeNotifier {
  bool _isFrontVisible = true;

  bool get isFrontVisible => _isFrontVisible;

  void flip() {
    _isFrontVisible = !_isFrontVisible;
    notifyListeners();
  }
}
