import 'package:flutter/material.dart';
import 'package:flutter_app/common/localizations/my_localization_delegate.dart';
import 'package:flutter_app/common/localizations/my_locallization.dart';
import 'package:flutter_app/providers/home.dart';
import 'package:flutter_app/providers/system.dart';
import 'package:flutter_app/providers/user.dart';
import 'package:flutter_app/route.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (_) => SystemModel(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print('------buildApp----');
    UserStateModel userState = UserStateModel();
    // SystemModel systemModel = SystemModel();
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: userState,
          ),
//        ChangeNotifierProvider(
//          create: (_) => UserStateModel(),
//        ),
          ChangeNotifierProvider(
            create: (_) => HomeStateModel(),
          ),
          ChangeNotifierProvider(
            create: (_) => SystemModel(),
          ),
        ],
        child: Consumer<SystemModel>(builder: (context, systemState, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            onGenerateRoute: onGenerateRoute,
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              // 自身的Delegate
              MyLocalizationsDelegate.delegate,
            ],
            supportedLocales: myLocaleLibrary
                .map(((local) => Locale(local.languageCode, local.countryCode)))
                .toList(),
            locale: systemState.locale,
          );
        }));
  }
}
