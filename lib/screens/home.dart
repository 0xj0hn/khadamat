import 'package:TexBan/utils/theme.dart';
import 'package:TexBan/widgets/appBar.dart';
import 'package:TexBan/widgets/customedButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  ThemeX controller = Get.put(ThemeX());
  final _pageText = [
    "خدمات مالیاتی",
    "دوره‌های آموزشی",
    "قانون مالیات‌های مستقیم",
    "قانون مالیات ارزش افزوده",
    "پایانه‌های فروشگاهی",
    "تنظیمات",
  ];
  final _pages = [
    "/financeServices",
    "",
    "",
    "",
    "",
    "/settings",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomedAppBar(
        title: "تکسبان",
      ),
      body: ListView.builder(
          itemCount: 6,
          itemBuilder: (cnx, index) {
            return Padding(
              padding: EdgeInsets.all(10),
              child: CustomedButton(
                padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
                child: Text(_pageText[index]),
                onPressed: () {
                  Get.toNamed(_pages[index]);
                },
              ),
            );
          }),
    );
  }
}
