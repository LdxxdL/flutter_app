import 'package:flutter/material.dart';
import 'package:flutter_app/common/net/http_manager.dart';
import 'package:flutter_app/model/user.dart';

class UserStateModel with ChangeNotifier {
  User _userInfo = new User();
  bool _isLogin = false;

  User get userInfo => _userInfo;
  bool get isLogin => _isLogin;

  UserStateModel() {
    login('ldx', '123456');
  }

  void init() async {}

  Future<void> login(String username, String password) async {
    print("----login-----");
    dynamic response = await HttpManager().post(
      url: '/login',
      data: {'username': username, 'password': password},
      tag: 'login',
    );
    if (response != null) {
      print('response is -------> ${response.code}');
      print('response is -------> ${response.message}');
      print('response is -------> ${response.data.runtimeType.toString()}');
    }
  }
}
