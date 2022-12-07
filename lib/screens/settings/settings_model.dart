import 'package:TexBan/utils/api/user_provider.dart';
import 'package:get/get.dart';

class SettingsModel extends GetxController {
  String? name, family;
  UserProvider userProvider = UserProvider();
  getMyInformation() async {
    Map information = await userProvider.getMyInformation();
    if (information.containsKey('first_name')) {
      name = information['first_name'];
      family = information['last_name'];
      update();
    }
  }
}
