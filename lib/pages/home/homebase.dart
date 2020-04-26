import 'package:flutter/material.dart';
import 'package:flutter_app/common/localizations/my_locallization.dart';
import 'package:flutter_app/pages/home/tabs/home.dart';
import 'package:flutter_app/pages/home/tabs/user.dart';
import 'package:flutter_app/components/topbar.dart';
import 'package:flutter_app/providers/home.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static final String pageName = 'home_page';

  final List<Widget> pageList = [
    HomeTabHome(),
    HomeTabUser(),
  ];
  final List<Color> colorList = [
    Colors.white,
    Colors.blue,
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeStateModel>(builder: (context, homestate, child) {
      return Scaffold(
        appBar: TopBar(
          color: colorList[homestate.bottomtabIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text(MyLocalizations.of(context).homeTabHome)),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text(MyLocalizations.of(context).homeTabPerson)),
          ],
          currentIndex: homestate.bottomtabIndex,
          onTap: homestate.changeBottomTab,
        ),
        body: pageList[homestate.bottomtabIndex],
      );
    });
  }
}
