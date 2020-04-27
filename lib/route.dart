import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home/homebase.dart';
import 'package:flutter_app/pages/login/login.dart';
import 'package:flutter_app/pages/login/password.dart';
import 'package:flutter_app/pages/login/regist.dart';
import 'package:flutter_app/pages/setting/setting.dart';
import 'package:flutter_app/pages/welcome/welcome.dart';

final Map<String, Function> routes = {
  WelcomePage.pageName: (context) => WelcomePage(),
  LoginPage.pageName: (context) => LoginPage(),
  HomePage.pageName: (context) => HomePage(),
  SettingPage.pageName: (context) => SettingPage(),
  RegistPage.pageName: (context, {arguments}) => RegistPage(
        mobileNumber: arguments,
      ),
  PasswordPage.pageName: (context, {arguments}) => PasswordPage(
        mobileNumber: arguments,
      )
};

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  // 统一处理
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (settings.arguments != null) {
    final Route route = MaterialPageRoute(
        builder: (context) =>
            pageContentBuilder(context, arguments: settings.arguments));
    return route;
  } else {
    final Route route =
        MaterialPageRoute(builder: (context) => pageContentBuilder(context));
    return route;
  }
}
