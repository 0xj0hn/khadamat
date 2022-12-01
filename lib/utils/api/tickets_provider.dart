import 'package:TexBan/utils/api/user_provider.dart';
import 'package:get/get.dart';

class TicketsProvider extends GetConnect with ConnectionConfig {
  late int _userId;
  late var _box;
  TicketsProvider() {
    _box = super.box;
    _userId = _box.get("user_id");
  }
  Map<String, String> get getHeader {
    String token = super.box.get("token") ?? "";
    return {"Authorization": "Bearer $token"};
  }

  sendTicket(Priority priority, issueSubject, title, description) async {
    Response req;
    String url = "$host/tickets/";
    var payload = {
      "priority": priority.priority,
      "subject": title,
      "title": issueSubject,
      "submitter": _userId,
      "description": description,
    };
    try {
      req = await post(url, FormData(payload), headers: getHeader);
      if (req.statusCode == 200) {
        return true;
      } else if (req.statusCode == 401) {
        await refreshToken();
        await sendTicket(priority, issueSubject, title, description);
      }
    } catch (e) {
      Get.snackbar("وضعیت", "مشکلی پیش آمد!");
    }
    return null;
  }

  refreshToken() async {
    Response? req;
    String url = host + "/gomi/token/refresh/";
    String refresh = _box.get('refresh');
    Map<String, dynamic> body = {"refresh": refresh};
    try {
      req = await post(url, FormData(body));
      if (req.statusCode == 200) {
        _box.put("token", req.body["access"]);
        print("token refreshed");
      }
    } catch (e) {
      print(e);
    }
  }
}
