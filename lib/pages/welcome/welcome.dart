import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home/home.dart';

class WelcomePage extends StatelessWidget {
  static final String pageName = '/';

  @override
  Widget build(BuildContext context) {
    new Future.delayed(const Duration(seconds: 2, milliseconds: 500), () {
      Navigator.pushNamed(context, HomePage.pageName);
    });

    return Image(image: AssetImage('static/images/welcome.png'));
  }
}
