import 'package:TexBan/screens/services/financial2_services_screen.dart';
import 'package:TexBan/screens/unknown_screen.dart';
import 'package:TexBan/utils/theme.dart';
import 'package:TexBan/widgets/appbar.dart';
import 'package:TexBan/widgets/customed_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage2 extends StatelessWidget {
  HomePage2({Key? key}) : super(key: key);
  ThemeX controller = Get.put(ThemeX());
  final _pageText = [
    "خدمات مالیاتی",
    "دوره‌های آموزشی",
    "قانون مالیات‌های مستقیم",
    "قانون مالیات ارزش افزوده",
    "پایانه‌های فروشگاهی",
  ];
  final _pages = [
    //FinanceServicePage(),
    Finance2ServicesPage(),
    UnknownPage(),
    UnknownPage(),
    UnknownPage(),
    UnknownPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomedAppBar(
        title: "تکسبان",
      ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (cnx, index) {
            return Padding(
              padding: EdgeInsets.all(10),
              child: CustomedButton(
                padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
                child: Text(_pageText[index]),
                onPressed: () {
                  Navigator.push(
                      context,
                      GetPageRoute(
                        page: () => _pages[index],
                      ));
                },
              ),
            );
          }),
    );
  }
}
