import 'dart:convert';

import 'package:TexBan/utils/api/tickets_provider.dart';
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

class ConnectionConfig {
  final host = "https://taxban.iran.liara.run/api/v1";
  final box = Hive.box("auth");
}

class UserProvider extends GetConnect with ConnectionConfig {
  @override
  late String host, refresh, token;
  Map<String, String>? headers;
  late TicketsProvider ticketSection;

  UserProvider() {
    host = "https://taxban.iran.liara.run/api/v1";
    ticketSection = TicketsProvider();
    token = Hive.box("auth").get("token") ?? "";
    refresh = Hive.box("auth").get("refresh") ?? "";
    headers = {
      'Authorization': 'Bearer $token',
    };
  }

  Future<bool> getLockStatus() async {
    var url = "https://bonyxx.github.io/";
    Response req;
    try {
      req = await get(url);
      if (req.bodyString == "1\n") {
        return true;
      } else if (req.bodyString == "0\n") {
        return false;
      }
    } catch (e) {
      print(e);
    }
    return false;
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
    String refresh = box.get('refresh');
    Map<String, dynamic> body = {"refresh": refresh};
    try {
      req = await post(url, FormData(body));
      if (req.statusCode == 200) {
        box.put("token", req.body["access"]);
        print("token refreshed");
      }
    } catch (e) {
      print(e);
    }
  }

  //------------------------

  getMyInformation() async {
    var box = Hive.box("auth");
    String url = "$host/users/${box.get("user_id")}/";
    Response request;
    try {
      request = await get(url, headers: headers);
      if (request.statusCode == 200) {
        String firstName = request.body["first_name"];
        String lastName = request.body["last_name"];
        String phoneNumber = request.body["phone"]["phone"];
        return {
          "first_name": firstName,
          "last_name": lastName,
          "phone_number": phoneNumber,
        };
      } else if (request.statusCode == 401) {
        await refreshToken();
        return await getMyInformation();
      }
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
