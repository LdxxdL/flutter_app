import 'package:flutter_app/common/config.dart';
import 'package:flutter_app/common/net/http_manager.dart';
import 'package:flutter_app/common/utils/local_storage.dart';

getUserByToken() async {
  String token = await LocalStorage.get(Config.ACCESSTOKEN);
  if (token != null) {
    final reponse = await HttpManager().get(url: '/user/info', tag: null);
    return reponse;
  }
  return null;
}
