import 'package:flutter_app/common/config.dart';
import 'package:flutter_app/common/net/http_manager.dart';
import 'package:flutter_app/common/utils/local_storage.dart';
import 'package:flutter_app/model/user.dart';

getUserByToken() async {
  String token = await LocalStorage.get(Config.ACCESSTOKEN);
  if (token != null) {
    final response =
        await HttpManager().get(url: '/borrower/baseinfo', tag: null);
    if (response.code == 0) {
      return User.fromJson(response.data);
    }
  }
  return null;
}
