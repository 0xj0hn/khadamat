import 'package:TexBan/utils/theme.dart';
import 'package:TexBan/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppLockScreen extends StatelessWidget {
  const AppLockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeX controller = Get.put(ThemeX());
    return Scaffold(
      appBar: CustomedAppBar(title: "اپلیکیشن قفل شد!"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "به دست برنامه‌نویس",
              style: TextStyle(
                fontSize: 22,
                decorationStyle: TextDecorationStyle.wavy,
              ),
            ),
            Text("اپلیکیشن به دلایلی از دسترس خارج شد!"),
          ],
        ),
      ),
    );
  }
}
