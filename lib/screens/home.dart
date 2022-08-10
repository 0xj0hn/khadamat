import 'package:TexBan/utils/theme.dart';
import 'package:TexBan/widgets/customedButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:get/get.dart';
import 'package:TexBan/screens/createFile.dart';
import 'package:TexBan/screens/services.dart';
import 'package:TexBan/widgets/appBar.dart';
import 'package:TexBan/widgets/customedText.dart';
import 'package:TexBan/widgets/sixedge.dart';

class HomePage extends StatelessWidget {
  ThemeX themeController = Get.put(ThemeX());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomedAppBar(
        title: "خانه",
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButtonItem(
                    title: "مشاوره رایگان",
                    onPressed: () {
                      Get.toNamed("/createFile", arguments: "مشاوره رایگان");
                    },
                  ),
                  CustomButtonItem(
                    title: "تهیه لایحه اعتراض",
                    onPressed: () {
                      Get.toNamed(
                        "/createFile",
                        arguments: "تهیه لایحه اعتراض",
                      );
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButtonItem(
                    title: "تراکنش بانکی",
                    onPressed: () {
                      Get.toNamed("/createFile", arguments: "تراکنش بانکی");
                    },
                  ),
                  CustomButtonItem(
                    title: "سامانه مودیان",
                    onPressed: () {
                      Get.toNamed("/createFile", arguments: "سامانه مودیان");
                    },
                  ),
                  CustomButtonItem(
                    title: "اشخاص حقوقی",
                    onPressed: () {
                      Get.toNamed("/services");
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButtonItem(
                    title: "اشخاص حقیقی",
                    onPressed: () {},
                  ),
                  CustomButtonItem(
                    title: "ارزش افزوده",
                    onPressed: () {},
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButtonItem(
                    title: "ارث",
                    onPressed: () {},
                  ),
                  CustomButtonItem(
                    title: "خانه‌های خالی و خودروهای لوکس",
                    onPressed: () {
                      Get.toNamed(
                        "/createFile",
                        arguments: "خانه‌های خالی و خودروهای لوکس",
                      );
                    },
                  ),
                  CustomButtonItem(
                    title: "نقل و انتقالات",
                    onPressed: () {
                      Get.toNamed("/createFile", arguments: "نقل و انتقالات");
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButtonItem(
                    title: "تنظیمات",
                    onPressed: () {
                      Get.toNamed("/settings");
                    },
                  ),
                ],
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
        ),
      ),
    );
  }
}



















// Padding(
//                 padding: EdgeInsets.fromLTRB(0, 20, Get.width / 3.5, 0),
//                 child: Row(
//                   children: [
//                     CustomButtonItem(
//                       title: "نقل و انتقالات",
//                       onPressed: () {
//                         Get.to(
//                           () => CreateFilePage(
//                             title: "نقل و انتقالات",
//                           ),
//                         );
//                       },
//                     ),
//                     CustomButtonItem(
//                       title: "مشاوره رایگان",
//                       onPressed: () {
//                         Get.to(() => CreateFilePage(
//                               title: "مشاوره رایگان",
//                             ));
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.fromLTRB(0, 0, Get.width / 6, 0),
//                 child: Row(
//                   children: [
//                     CustomButtonItem(
//                       title: "تهیه لایحه اعتراض",
//                       onPressed: () {
//                         Get.to(
//                           () => CreateFilePage(title: "تهیه لایحه اعتراض"),
//                         );
//                       },
//                     ),
//                     CustomButtonItem(
//                       title: "خانه‌های خالی و خودرو‌های لوکس",
//                       onPressed: () {
//                         Get.to(
//                           () => CreateFilePage(
//                             title: "خانه‌های خالی و خودروهای لوکس",
//                           ),
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.fromLTRB(0, 0, Get.width / 3.5, 0),
//                 child: Row(
//                   children: [
//                     CustomButtonItem(
//                       title: "اشخاص حقیقی",
//                       onPressed: () {},
//                     ),
//                     CustomButtonItem(
//                       title: "اشخاص حقوقی",
//                       onPressed: () {
//                         Get.to(() => ServicesPage());
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.fromLTRB(0, 0, Get.width / 6, 0),
//                 child: Row(
//                   children: [
//                     CustomButtonItem(
//                       title: "ارث",
//                       onPressed: () {},
//                     ),
//                     CustomButtonItem(
//                       title: "ارزش افزوده",
//                       onPressed: () {},
//                     ),
//                   ],
//                 ),
//               ),
//               const Padding(
//                   padding: EdgeInsets.all(60),
//                   child: CustomedText(
//                     title: "نکات آموزش: دانم که ندانم",
//                   )),
