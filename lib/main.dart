import 'package:flutter/material.dart';
import 'package:flutter_app/common/localizations/my_localization_delegate.dart';
import 'package:flutter_app/common/localizations/my_locallization.dart';
import 'package:flutter_app/pages/home/home.dart';
import 'package:flutter_app/pages/login/login.dart';
import 'package:flutter_app/pages/welcome/welcome.dart';
import 'package:flutter_app/providers/user.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    UserStateModel userStateModel = UserStateModel();
    return MultiProvider(
        providers: [ChangeNotifierProvider.value(value: userStateModel)],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routes: {
            WelcomePage.pageName: (context) => WelcomePage(),
            LoginPage.pageName: (context) => LoginPage(),
            HomePage.pageName: (context) => HomePage(),
          },
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            // 自身的Delegate
            MyLocalizationsDelegate(),
          ],
          supportedLocales: myLocaleLibrary
              .map(((local) => Locale(local.languageCode, local.countryCode)))
              .toList(),
          locale: Locale('zh', 'CH'),
        ));
  }
}
