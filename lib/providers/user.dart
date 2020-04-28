import 'package:flutter/material.dart';
import 'package:flutter_app/common/services/token.dart';
import 'package:flutter_app/model/user.dart';

class UserStateModel with ChangeNotifier {
  User _userInfo;
  bool _isLogin = false;

  User get userInfo => _userInfo;
  bool get isLogin => _isLogin;

  UserStateModel() {
    getUserInfo();
  }

  void getUserInfo() async {
    final userInfo = await getUserByToken();
    this._userInfo = userInfo;
    notifyListeners();
  }
}
