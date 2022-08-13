import 'package:TexBan/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:TexBan/widgets/appBar.dart';
import 'package:TexBan/widgets/customedButton.dart';
import 'package:TexBan/widgets/customedText.dart';
import 'package:get/get.dart';

class HoghughiServicesPage extends StatelessWidget {
  HoghughiServicesPage({Key? key}) : super(key: key);
  ThemeX controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomedAppBar(
        title: "خدمات مالیاتی اشخاص حقوقی",
      ),
      body: ListView(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                  child: CustomedButton(
                    padding: EdgeInsets.all(30),
                    child: Text(
                      "تشکیل پرونده",
                      style: controller.bodyTextTheme,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                  child: CustomedButton(
                    padding: EdgeInsets.all(30),
                    child: Text(
                      "ثبت‌نام کد اقتصادی",
                      style: controller.bodyTextTheme,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                  child: CustomedButton(
                    padding: EdgeInsets.all(30),
                    child: Text(
                      "تحریر دفاتر",
                      style: controller.bodyTextTheme,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                  child: CustomedButton(
                    padding: EdgeInsets.all(30),
                    child: Text(
                      "ارسال اظهارنامه",
                      style: controller.bodyTextTheme,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                  child: CustomedButton(
                    padding: EdgeInsets.all(30),
                    child: Text(
                      "ارسال اظهارنامه ارزش‌افزوده",
                      style: controller.bodyTextTheme,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                  child: CustomedButton(
                    padding: EdgeInsets.all(30),
                    child: Text(
                      "ارسال صورت معاملات فصلی",
                      style: controller.bodyTextTheme,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                  child: CustomedButton(
                    padding: EdgeInsets.all(30),
                    child: Text(
                      "تفسیر گزارش رسیدگی",
                      style: controller.bodyTextTheme,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                  child: CustomedButton(
                    padding: EdgeInsets.all(30),
                    child: Text(
                      "حضور جلسات رسیدگی",
                      style: controller.bodyTextTheme,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                  child: CustomedButton(
                    padding: EdgeInsets.all(30),
                    child: Text(
                      "پیگیری اعتراضات",
                      style: controller.bodyTextTheme,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                  child: CustomedButton(
                    padding: EdgeInsets.all(30),
                    child: Text(
                      "نقل و انتقال سهام",
                      style: controller.bodyTextTheme,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                  child: CustomedButton(
                    padding: EdgeInsets.all(30),
                    child: Obx(
                      () => Text(
                        "ثبت اعتراضات و تهیه لایحه خاص",
                        style: controller.bodyTextTheme,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                  child: CustomedButton(
                    padding: EdgeInsets.all(30),
                    child: Text(
                      "مشاوره رایگان",
                      style: controller.bodyTextTheme,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          // Center(
          //   child: Text(
          //     "کلیه اشخاص حقیقی تابع ایران",
          //     style: TextStyle(color: Colors.grey),
          //   ),
          // ),
        ],
      ),
    );
  }
}
