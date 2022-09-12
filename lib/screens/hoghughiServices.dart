import 'package:TexBan/screens/unknownPage.dart';
import 'package:TexBan/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:TexBan/widgets/appBar.dart';
import 'package:TexBan/widgets/customedButton.dart';
import 'package:TexBan/widgets/customedText.dart';
import 'package:get/get.dart';

class HoghughiServicesPage extends StatelessWidget {
  String? title;
  HoghughiServicesPage({Key? key, this.title}) : super(key: key);
  ThemeX controller = Get.find();
  List buttonsTxt = [
    "ثبت نام کد اقتصادی",
    "ارسال اظهارنامه",
    "تفسیر گزارش رسیدگی",
    "حضور در جلسات رسیدگی",
    "پیگیری اعتراضات",
    "ثبت اعتراضات و تهیه لایحه اعتراض",
  ];
  List buttonPages = [
    UnknownPage(),
    UnknownPage(),
    UnknownPage(),
    UnknownPage(),
    UnknownPage(),
    UnknownPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomedAppBar(
        title: title!,
      ),
      body: ListView.builder(
          itemCount: buttonsTxt.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: EdgeInsets.all(8),
              child: CustomedButton(
                padding: EdgeInsets.all(30),
                child: Text(buttonsTxt[index]),
                onPressed: () {
                  Navigator.of(context).push(
                    GetPageRoute(
                      page: () => buttonPages[index],
                    ),
                  );
                },
              ),
            );
          }),
    );
  }
}
