import 'dart:convert';

import 'package:get/get.dart';
import 'package:hive/hive.dart';

enum Priority {
  critical(1),
  high(2),
  normal(3),
  low(4),
  veryLow(5);

  final int priority;
  const Priority(this.priority);
}

class UserProvider extends GetConnect {
  @override
  late String host, refresh, token;
  Map<String, String>? headers;

  UserProvider() {
    host = "https://taxban.iran.liara.run/api/v1";
    token = Hive.box("auth").get("token") ?? "";
    refresh = Hive.box("auth").get("refresh") ?? "";
    headers = {
      'Authorization': 'Bearer $token',
    };
  }

  sendVerificationCode(phoneNum) async {
    var url = host + "/login/" + phoneNum;
    Response? req;
    try {
      req = await get(url);
      print(req.body);
    } catch (e) {
      Get.snackbar("وضعیت", "مشکلی پیش آمد.");
      return;
    }
    return req.body['request_id'];
  }

  verifyVerificationCode(phoneNum, code, requestID) async {
    var url = host + "/login/" + phoneNum;
    Map<String, dynamic> data = {
      "otp": code,
      "request_id": requestID,
    };
    Response? req;
    try {
      req = await post(url, FormData(data));
      Get.snackbar("وضعیت", "تیکت شما با موفقیت در سرور ثبت شد.");
    } catch (e) {
      Get.snackbar("وضعیت", "مشکلی پیش آمد!");
    }
    if (checkLoginResponse(req!)) return true;
    return false;
  }

  checkLoginResponse(Response request) {
    /*
    * check if there is following keys in the response body
    */
    bool doesContainToken = request.body.containsKey('token');
    bool doesContainRefresh = request.body.containsKey('refresh');
    bool doesContainUserID = request.body.containsKey('user_id');
    if (doesContainToken && doesContainRefresh && doesContainUserID) {
      print('token: ' + request.body['token']);
      var keysOfDB = ["token", "refresh", "user_id"];
      var valuesOfDB = [
        request.body['token'],
        request.body['refresh'],
        request.body['user_id']
      ];
      setSomethingToHive(keysOfDB, valuesOfDB);
      print("Token has been stored");
      return true;
    } else {
      return false;
    }
  }

  setSomethingToHive(List keys, List values) {
    var box = Hive.box("auth");
    for (int i = 0; i < keys.length; i++) {
      var key = keys[i];
      var value = values[i];
      print("Key: $key, Value: $value");
      box.put(key, value);
    }
  }

  refreshToken() async {
    Response? req;
    String url = host + "/gomi/token/refresh/";
    Map<String, dynamic> body = {"refresh": refresh};
    try {
      req = await post(url, FormData(body));
      print(req.body);
    } catch (e) {
      Get.snackbar("وضعیت", "خطایی دریافت شد.");
    }
    try {
      //Hive.box("auth").put("refresh", req!.body['refresh']);
      Hive.box("auth").put("token", req!.body['access'] ?? token);
      Get.snackbar("وضعیت", "توکن ریفرش شد!");
    } catch (e) {
      Get.snackbar("وضعیت", "اطلاعات دریافت شده سالم نیست");
    }
  }

  sendTicket(Priority priority, issueSubject, title, description) async {
    Response req;
    String url = host + "/tickets/";
    var payload = {
      "priority": priority.priority,
      "subject": title,
      "title": issueSubject,
      "submitter": 1, //the user id of user.
      "status": 1,
      "description": description,
    };
    try {
      req = await post(url, FormData(payload), headers: headers);
      print(req.body);
      Get.snackbar("وضعیت", "تیکت با موفقیت ثبت گردید");
    } catch (e) {
      Get.snackbar("وضعیت", "مشکلی پیش آمد!");
    }
  }

  //------------------------

  getMyInformation() async {
    var box = Hive.box("auth");
    String url = "$host/users/${box.get("user_id")}/";
    Response request;
    try {
      request = await get(url, headers: headers);
      String firstName = request.body["first_name"];
      String lastName = request.body["last_name"];
      String phoneNumber = request.body["phone"]["phone"];
      return {
        "first_name": firstName,
        "last_name": lastName,
        "phone_number": phoneNumber,
      };
    } catch (e) {
      Get.snackbar("وضعیت", "مشکلی پیش آمد!");
    }
  }

  updateMyInformation(String firstName, String lastName) async {
    var box = Hive.box("auth");
    String url = "$host/users/${box.get("user_id")}/";
    Response request;
    Map payload = {
      "first_name": firstName,
      "last_name": lastName,
    };
    try {
      request = await patch(url, payload, headers: headers);
      String firstName = request.body["first_name"];
      String lastName = request.body["last_name"];
      String phoneNumber = request.body["phone"]["phone"];
      return {
        "first_name": firstName,
        "last_name": lastName,
        "phone_number": phoneNumber,
      };
    } catch (e) {
      Get.snackbar("وضعیت", "مشکلی پیش آمد!");
    }
  }
}
