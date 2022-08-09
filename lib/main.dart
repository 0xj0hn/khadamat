import 'package:flutter/material.dart';
import 'package:TexBan/screens/home.dart';
import 'package:get/get.dart';
import 'package:TexBan/utils/theme.dart';

void main() {
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
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      textDirection: TextDirection.rtl,
    );
  }
}
