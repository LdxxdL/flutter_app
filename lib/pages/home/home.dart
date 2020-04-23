import 'package:flutter/material.dart';
import 'package:flutter_app/common/localizations/my_locallization.dart';
import 'package:flutter_app/providers/user.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static final String pageName = 'home_page';

  @override
  Widget build(BuildContext context) {
    return Consumer<UserStateModel>(builder: (context, userState, child) {
      return Scaffold(
        bottomNavigationBar:
            BottomNavigationBar(items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(MyLocalizations.of(context).homeTabHome)),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text(MyLocalizations.of(context).homeTabPerson)),
        ]),
        body: Container(
          child: Center(
            child: Text('HomePage'),
          ),
        ),
      );
    });
  }
}
