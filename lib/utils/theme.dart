import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class ThemeX extends GetxController {
  static final lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.light,
      ),
      iconTheme: IconThemeData(color: Colors.blue),
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
        color: Colors.blue,
        fontFamily: 'Yekan',
        fontSize: 18,
      ),
    ),
    accentColor: Colors.blue,
    fontFamily: "Yekan",
  );
  static final darkTheme = ThemeData(
    primaryColor: Colors.amber[800],
    primarySwatch: Colors.amber,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarBrightness: Brightness.dark,
      ),
      titleTextStyle:
          TextStyle(color: Colors.amber, fontFamily: 'Yekan', fontSize: 18),
      iconTheme: IconThemeData(
        color: Colors.amber,
      ),
      backgroundColor: Colors.black,
      elevation: 5.0,
      centerTitle: true,
    ),
    accentIconTheme: IconThemeData(
      color: Colors.amber,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.amber[800],
    ),
    primaryTextTheme: TextTheme(
      headline6: TextStyle(color: Colors.amber, fontWeight: FontWeight.w300),
    ),
    primaryColorDark: Colors.black,
    fontFamily: 'Yekan',
    accentTextTheme: TextTheme(bodyText1: TextStyle(fontSize: 14)),
    // buttonColor: Colors.amber[800],
    dividerColor: Colors.grey.shade800,
    textTheme: TextTheme(button: TextStyle(fontSize: 14)),
    brightness: Brightness.dark,
    canvasColor: Colors.black,
    accentColor: Colors.amber,
    checkboxTheme:
        CheckboxThemeData(fillColor: MaterialStateProperty.all(Colors.amber)),
    shadowColor: Colors.grey,
    hoverColor: Colors.grey[800]!.withOpacity(0.6),
  );
  var font = Hive.box("font");
  var theme = Hive.box("theme");
  RxInt? fontSize;
  RxBool? thememode;
  onInit() {
    super.onInit();
    fontSize = RxInt(font.get("fontSize") ?? 14);
    thememode = RxBool(theme.get("isDarkMode") ?? false);
  }

  addFontToHive() {
    font.put("fontSize", fontSize!.value);
  }

  addThemeToHive() {
    theme.put("isDarkMode", !Get.isDarkMode);
  }
}
