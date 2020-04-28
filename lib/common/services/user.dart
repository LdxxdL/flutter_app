import 'package:flutter_app/common/config.dart';
import 'package:flutter_app/common/net/http_manager.dart';
import 'package:flutter_app/common/utils/local_storage.dart';

findMobile(String mobile, {successCallback, errorCallback}) async {
  final response = await HttpManager().post(
      url: '/borrower/mobile/find',
      data: {
        'mobile': mobile,
      },
      successCallback: successCallback,
      errorCallback: errorCallback,
      tag: null);
  return response;
}

registMobile(String mobile, String vrCode, String password,
    {successCallback, errorCallback}) async {
  final response = await HttpManager().post(
      url: '/borrower/regist',
      data: {
        'mobile': mobile,
        'vrCode': vrCode,
        'password': password,
      },
      successCallback: successCallback,
      errorCallback: errorCallback,
      tag: null);
  return response;
}

loginWithPassword(String mobile, String password,
    {successCallback, errorCallback}) async {
  final response = await HttpManager().post(
      url: '/borrower/oauth',
      data: {
        'grantType': 'password',
        'mobile': mobile,
        'password': password,
      },
      successCallback: successCallback,
      errorCallback: errorCallback,
      tag: null);
  if (response.code == 0) {
    LocalStorage.save(Config.ACCESSTOKEN, response.data[Config.ACCESSTOKEN]);
    LocalStorage.save(Config.REFRESHTOKEN, response.data[Config.REFRESHTOKEN]);
    return true;
  }
  return false;
}
