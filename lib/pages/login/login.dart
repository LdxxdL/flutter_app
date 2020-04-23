import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static final String pageName = 'login_page';

  @override
  State createState() {
    return new _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RawMaterialButton(
          onPressed: null,
          child: Text('登录'),
        )
      ],
    );
  }
}
