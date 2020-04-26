import 'package:flutter/material.dart';
import 'package:flutter_app/components/topbar.dart';
import 'package:flutter_app/providers/system.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  static final String pageName = 'setting_page';

  @override
  Widget build(BuildContext context) {
    return Consumer<SystemModel>(builder: (context, systemState, child) {
      print('---------locale-----${systemState.locale.languageCode}');
      return Scaffold(
        appBar: TopBar(),
        body: Column(
          children: <Widget>[
            Text('选择语言'),
            Row(
              children: <Widget>[
                Checkbox(
                    value: systemState.locale.languageCode == 'zh',
                    onChanged: (newValue) {
                      if (newValue) {
                        systemState.changeLocale(Locale('zh', 'CN'));
                      }
                    }),
                Text('中文'),
                Checkbox(
                    value: systemState.locale.languageCode == 'en',
                    onChanged: (newValue) {
                      if (newValue) {
                        systemState.changeLocale(Locale('en', 'US'));
                      }
                    }),
                Text('英文'),
              ],
            )
          ],
        ),
      );
    });
  }
}
