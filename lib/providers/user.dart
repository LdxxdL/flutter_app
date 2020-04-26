import 'package:flutter/material.dart';
import 'package:flutter_app/common/net/http_manager.dart';
import 'package:flutter_app/common/services/token.dart';
import 'package:flutter_app/model/user.dart';

class UserStateModel with ChangeNotifier {
  User _userInfo = new User();
  bool _isLogin = false;

  User get userInfo => _userInfo;
  bool get isLogin => _isLogin;

  UserStateModel() {
    // login('ldx', '123456');
    init();
  }

  void init() async {
    final userInfo = await getUserByToken();
    print('-------userinfo--------$userInfo');
    if (userInfo != null) {
      this._userInfo = userInfo;
      notifyListeners();
    } else {}
  }

  login(String username, String password) async {
    final response = await HttpManager().post(
      url: '/login',
      data: {'username': username, 'password': password},
      tag: 'login',
    );
    if (response != null) {}
  }
}
