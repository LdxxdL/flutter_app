import 'package:flutter_app/common/config.dart';
import 'package:flutter_app/common/net/http_manager.dart';
import 'package:flutter_app/common/utils/local_storage.dart';

getUserByToken() async {
  String token = await LocalStorage.get(Config.ACCESSTOKEN);
  print('---------token--------$token');
  if (token != null) {
    final reponse = await HttpManager().get(url: '/borrower/baseinfo', tag: null);
    return reponse;
  }
  return null;
}
