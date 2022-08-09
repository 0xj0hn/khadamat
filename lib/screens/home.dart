import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:get/get.dart';
import 'package:TexBan/screens/createFile.dart';
import 'package:TexBan/screens/services.dart';
import 'package:TexBan/widgets/appBar.dart';
import 'package:TexBan/widgets/customedText.dart';
import 'package:TexBan/widgets/sixedge.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomedAppBar(
          title: "خانه",
        ),
        body: Container(
          alignment: Alignment.center,
          // padding: const EdgeInsets.all(100),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, Get.width / 3.5, 0),
                child: Row(
                  children: [
                    CustomButtonItem(
                      title: "نقل و انتقالات",
                      onPressed: () {
                        Get.to(
                          () => CreateFilePage(
                            title: "نقل و انتقالات",
                          ),
                        );
                      },
                    ),
                    CustomButtonItem(
                      title: "مشاوره رایگان",
                      onPressed: () {
                        Get.to(() => CreateFilePage(
                              title: "مشاوره رایگان",
                            ));
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, Get.width / 6, 0),
                child: Row(
                  children: [
                    CustomButtonItem(
                      title: "تهیه لایحه اعتراض",
                      onPressed: () {
                        Get.to(
                          () => CreateFilePage(title: "تهیه لایحه اعتراض"),
                        );
                      },
                    ),
                    CustomButtonItem(
                      title: "خانه‌های خالی و خودرو‌های لوکس",
                      onPressed: () {
                        Get.to(
                          () => CreateFilePage(
                            title: "خانه‌های خالی و خودروهای لوکس",
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, Get.width / 3.5, 0),
                child: Row(
                  children: [
                    CustomButtonItem(
                      title: "اشخاص حقیقی",
                      onPressed: () {},
                    ),
                    CustomButtonItem(
                      title: "اشخاص حقوقی",
                      onPressed: () {
                        Get.to(() => ServicesPage());
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, Get.width / 6, 0),
                child: Row(
                  children: [
                    CustomButtonItem(
                      title: "ارث",
                      onPressed: () {},
                    ),
                    CustomButtonItem(
                      title: "ارزش افزوده",
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              const Padding(
                  padding: EdgeInsets.all(60),
                  child: CustomedText(
                    title: "نکات آموزش: دانم که ندانم",
                  )),
            ],
          ),
        ));
  }
}
