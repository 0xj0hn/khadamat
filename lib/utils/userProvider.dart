import 'dart:convert';

import 'package:get/get.dart';
import 'package:hive/hive.dart';

class UserProvider extends GetConnect {
  @override
  late String host, token;
  late Map headers;
  UserProvider() {
    host = "https://taxban.iran.liara.run/api/v1";
    token = Hive.box("auth").get("token") ?? "";
    headers = {
      'Authorization': 'Bearer $token',
    };
  }
  sendVerificationCode(phoneNum) async {
    var url = host + "/test2/" + phoneNum;
    Response? req;
    try {
      req = await get(url);
    } catch (e) {
      Get.snackbar("وضعیت", "مشکلی پیش آمد.");
      return;
    }

    //var jsonResponse = jsonDecode(req.body.toString());

    return req.body['request_id'];
  }

  verifyVerificationCode(phoneNum, code, requestID) async {
    var url = host + "/test2/" + phoneNum;
    Map<String, dynamic> data = {
      "otp": code,
      "request_id": requestID,
    };
    Response? req;
    try {
      req = await post(url, FormData(data));
    } catch (e) {
      Get.snackbar("وضعیت", "مشکلی پیش آمد!");
    }

    Map jsonResponse = req!.body;
    if (jsonResponse.containsKey('token')) {
      print('token: ' + jsonResponse['token']);
      Hive.box("auth").put("token", jsonResponse['token']);
      print("Token has been stored");
      return true;
    }
    return false;
  }

  String get getHostName {
    return host;
  }
}
