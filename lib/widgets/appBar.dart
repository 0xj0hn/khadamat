import 'package:TexBan/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CustomedAppBar extends StatelessWidget with PreferredSizeWidget {
  String? title;
  CustomedAppBar({this.title});
  @override
  ThemeX controller = Get.find();
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title!,
      ),
      elevation: 0.5,
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(Icons.bedtime_outlined),
          onPressed: () {
            Get.changeThemeMode(
              !Get.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            );
            controller.thememode!.value = !Get.isDarkMode;

            controller.addThemeToHive();
          },
        )
      ],
    );
  }

  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
