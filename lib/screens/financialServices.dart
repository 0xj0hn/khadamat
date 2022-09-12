import 'package:TexBan/screens/emptyHouseServices.dart';
import 'package:TexBan/screens/ersServices.dart';
import 'package:TexBan/screens/haghighiServices.dart';
import 'package:TexBan/screens/naghlServices.dart';
import 'package:TexBan/screens/valueAddServices.dart';
import 'package:TexBan/utils/theme.dart';
import 'package:TexBan/widgets/customedButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:get/get.dart';
import 'package:TexBan/screens/createFile.dart';
import 'package:TexBan/screens/hoghughiServices.dart';
import 'package:TexBan/widgets/appBar.dart';
import 'package:TexBan/widgets/customedText.dart';
import 'package:TexBan/widgets/sixedge.dart';

class FinanceServicePage extends StatelessWidget {
  ThemeX themeController = Get.put(ThemeX());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomedAppBar(
        title: "خدمات مالیاتی",
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButtonItem(
                    title: "مشاوره مالیاتی",
                    onPressed: () {
                      Navigator.of(context).push(
                        GetPageRoute(
                          page: () => CreateFilePage(
                            title: "مشاوره مالیاتی",
                          ),
                        ),
                      );
                    },
                  ),
                  CustomButtonItem(
                    title: "تهیه لایحه اعتراض",
                    onPressed: () {
                      Navigator.of(context).push(
                        GetPageRoute(
                          page: () => CreateFilePage(
                            title: "تهیه لایحه اعتراض",
                          ),
                        ),
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
                      Navigator.of(context).push(
                        GetPageRoute(
                          page: () => CreateFilePage(
                            title: "تراکنش بانکی",
                          ),
                        ),
                      );
                    },
                  ),
                  CustomButtonItem(
                    title: "سامانه مودیان",
                    onPressed: () {
                      Navigator.of(context).push(
                        GetPageRoute(
                            page: () => CreateFilePage(
                                  title: "سامانه مودیان",
                                )),
                      );
                    },
                  ),
                  CustomButtonItem(
                    title: "اشخاص حقوقی",
                    onPressed: () {
                      Navigator.of(context).push(
                        GetPageRoute(
                          page: () => HoghughiServicesPage(
                            title: "خدمات مالیاتی اشخاص حقوقی",
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButtonItem(
                    title: "اشخاص حقیقی",
                    onPressed: () {
                      Navigator.of(context).push(
                        GetPageRoute(
                          page: () => HaghighiServicesPage(
                            title: "خدمات مالیاتی اشخاص حقیقی",
                          ),
                        ),
                      );
                    },
                  ),
                  CustomButtonItem(
                    title: "ارزش افزوده",
                    onPressed: () {
                      Navigator.of(context).push(
                        GetPageRoute(
                          page: () => ValueAddServicePage(
                            title: "خدمات مالیاتی ارزش افزوده",
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButtonItem(
                    title: "ارث",
                    onPressed: () {
                      Navigator.of(context).push(
                        GetPageRoute(
                          page: () => ErsServicesPage(
                            title: "خدمات مالیاتی ارزش افزوده",
                          ),
                        ),
                      );
                    },
                  ),
                  CustomButtonItem(
                    title: "خانه‌های خالی",
                    onPressed: () {
                      Navigator.of(context).push(
                        GetPageRoute(
                          page: () => EmptyHousePage(
                            title: "خدمات مالیاتی خانه‌های خالی",
                          ),
                        ),
                      );
                    },
                  ),
                  CustomButtonItem(
                    title: "مستغلات و نقل و انتقالات",
                    onPressed: () {
                      Navigator.of(context).push(
                        GetPageRoute(
                          page: () => NaghlServicesPage(
                            title: "خدمات مالیاتی مستغلات و نقل و انتقالات",
                          ),
                        ),
                      );
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
