import 'package:flutter/material.dart';
import 'package:flutter_app/providers/user.dart';
import 'package:provider/provider.dart';

class HomeTabUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserStateModel>(
      builder: (context, userstate, child) {
        // print('-------userstate--------${userstate.userInfo.name}');
        return Column(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.blue,
                  child: Center(
                    child: Row(
                      children: <Widget>[
                        IconButton(
                            iconSize: 100,
                            icon: Icon(Icons.person),
                            onPressed: () {
                              Navigator.pushNamed(context, 'login_page');
                            }),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('姓名：${userstate.userInfo.name ?? ''}',
                                style: TextStyle(fontSize: 15, height: 2)),
                            Text('电话：${userstate.userInfo.phone ?? ''}',
                                style: TextStyle(fontSize: 15, height: 2)),
                            // Text((userstate.userInfo.age ?? '').toString()),
                          ],
                        )
                      ],
                    ),
                  ),
                )),
            Expanded(
                flex: 3,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(top: 30),
                          child: SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: OutlineButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'setting_page');
                                },
                                child: Text('设置')),
                          ))
                    ],
                  ),
                ))
          ],
        );
      },
    );
  }
}
