import 'package:TexBan/screens/unknown_screen.dart';
import 'package:TexBan/widgets/appbar.dart';
import 'package:TexBan/widgets/customed_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErsServicesPage extends StatelessWidget {
  String? title;
  ErsServicesPage({Key? key, this.title}) : super(key: key);
  List buttonsTxt = [
    "ثبت نام کد اقتصادی",
    "ارسال اظهارنامه",
    "تفسیر گزارش رسیدگی",
    "حضور در جلسات رسیدگی",
    "پیگیری اعتراضات",
    "ثبت اعتراضات و تهیه لایه اعتراض",
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
                  Navigator.of(context)
                      .push(GetPageRoute(page: () => buttonPages[index]));
                },
              ),
            );
          }),
    );
  }
}
