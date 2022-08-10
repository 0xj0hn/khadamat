import 'package:TexBan/screens/createFile.dart';
import 'package:TexBan/screens/services.dart';
import 'package:TexBan/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:TexBan/screens/home.dart';
import 'package:get/get.dart';
import 'package:TexBan/utils/theme.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("font");
  await Hive.openBox("theme");
  print(Hive.box("theme").get("isDarkMode"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "خدمات",
      home: HomePage(),
      theme: ThemeX.lightTheme,
      darkTheme: ThemeX.darkTheme,
      themeMode: Hive.box("theme").get("isDarkMode")
          ? ThemeMode.dark
          : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      textDirection: TextDirection.rtl,
      getPages: [
        GetPage(name: "/settings", page: () => SettingsPage()),
        GetPage(name: "/services", page: () => ServicesPage()),
        GetPage(name: "/home", page: () => HomePage()),
        GetPage(name: "/createFile", page: () => CreateFilePage()),
      ],
    );
  }
}
