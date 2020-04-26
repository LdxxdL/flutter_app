import 'package:flutter/material.dart';

class HomeStateModel extends ChangeNotifier {
  int _bottomtabIndex = 0;

  get bottomtabIndex => _bottomtabIndex;

  void changeBottomTab(int index) {
    this._bottomtabIndex = index;
    notifyListeners();
  }
}
