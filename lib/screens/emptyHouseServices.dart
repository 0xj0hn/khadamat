import 'package:TexBan/widgets/appBar.dart';
import 'package:TexBan/widgets/customedButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmptyHousePage extends StatelessWidget {
  String? title = Get.arguments;
  EmptyHousePage({Key? key}) : super(key: key);
  List buttonsTxt = [
    "مشاوره",
    "تفسیر گزارش رسیدگی",
    "حضور در جلسات رسیدگی",
    "ثبت اعتراضات و تهیه لایحه اعتراض",
  ];
  List buttonPages = [
    "",
    "",
    "",
    "",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomedAppBar(
        title: title!,
      ),
      body: ListView.builder(
          itemCount: 4,
          itemBuilder: (_, index) {
            return Padding(
              padding: EdgeInsets.all(8),
              child: CustomedButton(
                padding: EdgeInsets.all(30),
                child: Text(buttonsTxt[index]),
                onPressed: () {
                  Get.toNamed(buttonPages[index]);
                },
              ),
            );
          }),
    );
  }
}