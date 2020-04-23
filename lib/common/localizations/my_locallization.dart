import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/common/localizations/string_base.dart';
import 'package:flutter_app/common/localizations/string_en.dart';
import 'package:flutter_app/common/localizations/string_zh.dart';

final myLocaleLibrary = [
  new StringZH(), // 美国英语
  new StringEN(), // 中文简体
];

class MyLocalizations {
  final Locale locale;

  MyLocalizations(this.locale);

  ///根据不同 locale.languageCode 加载不同语言对应
  ///GSYStringEn和GSYStringZh都继承了GSYStringBase
  static Map<String, StringBase> _localizedValues =
      myLocaleLibrary.fold({}, (curr, next) {
    curr[next.languageCode] = next;
    return curr;
  });

  StringBase get currentLocalized {
    if (_localizedValues.containsKey(locale.languageCode)) {
      return _localizedValues[locale.languageCode];
    }
    return _localizedValues["en"];
  }

  ///通过 Localizations 加载当前的 GSYLocalizations
  ///获取对应的 GSYStringBase
  static StringBase of(BuildContext context) {
    return (Localizations.of(context, MyLocalizations) as MyLocalizations)
        .currentLocalized;
  }

  ///通过 Localizations 加载当前的 MyLocalizations
  ///获取对应的 GSYStringBase
  // static StringBase i18n(BuildContext context) {
  //   return (Localizations.of(context, MyLocalizations) as MyLocalizations)
  //       .currentLocalized;
  // }
}
