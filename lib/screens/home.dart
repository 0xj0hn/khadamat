import 'package:TexBan/screens/financial2Services.dart';
import 'package:TexBan/screens/financialServices.dart';
import 'package:TexBan/screens/settings.dart';
import 'package:TexBan/screens/unknownPage.dart';
import 'package:TexBan/utils/theme.dart';
import 'package:TexBan/widgets/appBar.dart';
import 'package:TexBan/widgets/customedButton.dart';
import 'package:TexBan/widgets/customedCardWidget.dart';
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
  ];
  final _buttons = [
    CircleAvatar(
      radius: 35,
      backgroundImage: AssetImage("assets/images/home/khadamatMaliati.png"),
    ),
    CircleAvatar(
      radius: 35,
      backgroundImage: AssetImage("assets/images/home/doreAmuzeshi.png"),
    ),
    CircleAvatar(
      radius: 35,
      backgroundImage: AssetImage("assets/images/home/ghanunMaliat.png"),
    ),
    CircleAvatar(
      radius: 35,
      backgroundImage:
          AssetImage("assets/images/home/ghanunMaliatValueAdded.png"),
    ),
    CircleAvatar(
      radius: 35,
      backgroundImage:
          AssetImage("assets/images/home/payaneHayeForushgahi.png"),
    ),
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
      body: ListView(
        children: [
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: 1,
            childAspectRatio: 1.5,
            //padding: EdgeInsets.all(8),
            children: List.generate(
              5,
              (i) => CustomedCard(
                onPressed: () {
                  Navigator.of(context)
                      .push(GetPageRoute(page: () => _pages[i]));
                },
                child: Stack(
                  children: [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Center(
                          child: _buttons[i],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(0),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          _pageText[i],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Text(
                "کلیه اشخاص حقیقی و حقوقی مقیم ایران نسبت به کلیه درآمدهایی که در ایران تحصیل می‌کنند مشمول مالیات هستند.",
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
