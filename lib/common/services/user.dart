import 'package:flutter_app/common/net/http_manager.dart';

findMobile(String mobile, {successCallback, errorCallback}) async {
  final response = await HttpManager().post(
      url: '/borrower/mobile/find',
      data: {
        mobile: mobile,
      },
      successCallback: successCallback,
      errorCallback: errorCallback,
      tag: null);
  return response;
}
