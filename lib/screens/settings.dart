import 'package:TexBan/utils/theme.dart';
import 'package:TexBan/widgets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  @override
  ThemeX controller = Get.find();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomedAppBar(
        title: "تنظیمات",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
              () => CheckboxListTile(
                contentPadding: EdgeInsets.all(8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                title: Text(
                  "تم تیره: ",
                  style: controller.bodyTextTheme,
                ),
                value: controller.thememode!.value,
                onChanged: (val) {
                  controller.thememode?.value = val!;
                  Get.changeThemeMode(
                    val! == true ? ThemeMode.dark : ThemeMode.light,
                  );
                  controller.addThemeToHive();
                },
              ),
            ),
            Divider(
              height: 3,
            ),
            Obx(
              () => Text(
                "فونت‌ها: ",
                style: controller.bodyTextTheme,
              ),
            ),
            Obx(
              () => RadioListTile(
                title: Text(
                  "فونت 14",
                  style: TextStyle(fontSize: 14),
                ),
                value: 14,
                groupValue: controller.fontSize!.value,
                onChanged: (int? val) {
                  controller.fontSize!.value = val!;
                  controller.addFontToHive();
                },
              ),
            ),
            Obx(
              () => RadioListTile(
                title: Text("فونت 16"),
                value: 16,
                groupValue: controller.fontSize!.value,
                onChanged: (int? val) {
                  controller.fontSize!.value = val!;
                  controller.addFontToHive();
                },
              ),
            ),
            Obx(
              () => RadioListTile(
                title: Text(
                  "فونت 18",
                  style: TextStyle(fontSize: 18),
                ),
                value: 18,
                groupValue: controller.fontSize!.value,
                onChanged: (int? val) {
                  controller.fontSize!.value = val!;
                  Get.theme.textTheme.apply(fontFamily: 'Vazir');
                  controller.addFontToHive();
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Obx(
                () => Text(
                  "پس از تعیین تم مورد نظر و فونت، این صفحه را ببندید تا تغییرات اعمال شود.",
                  style: controller.bodyTextTheme,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
