import 'package:flutter/material.dart';

class SystemModel extends ChangeNotifier {
  Locale _locale = Locale('en', 'US');

  get locale => _locale;

  changeLocale(Locale locale) {
    if (_locale.languageCode != locale.languageCode) {
      this._locale = locale;
      notifyListeners();
    }
  }
}
