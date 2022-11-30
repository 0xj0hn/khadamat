import 'package:TexBan/screens/unknown_screen.dart';
import 'package:TexBan/widgets/appbar.dart';
import 'package:TexBan/widgets/customed_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NaghlServicesPage extends StatelessWidget {
  String? title;
  NaghlServicesPage({Key? key, this.title}) : super(key: key);
  List buttonsTxt = [
    "ثبت نام کد اقتصادی",
    "نقل و انتقالات",
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
          itemCount: 6,
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
