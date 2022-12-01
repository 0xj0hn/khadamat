import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class ThemeX extends GetxController {
  var font = Hive.box("font");
  var theme = Hive.box("theme");
  double? fontSize;
  bool? thememode;
  @override
  void onInit() {
    super.onInit();
    fontSize = font.get("fontSize") ?? 14.0;
    thememode = theme.get("isDarkMode") ?? false;
  }

  static final lightTheme = ThemeData(
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.blue,
          systemNavigationBarIconBrightness: Brightness.dark
          //systemNavigationBarColor: Colors.white,
          ),
      iconTheme: IconThemeData(color: Colors.blue),
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
        color: Colors.blue,
        fontFamily: 'Yekan',
        fontSize: 18,
      ),
    ),
    iconTheme: IconThemeData(color: Colors.blue),
    textTheme: TextTheme(bodyText2: TextStyle(color: Colors.blue)),
    accentColor: Colors.blue,
    fontFamily: "Yekan",
  );
  static final darkTheme = ThemeData(
    useMaterial3: true,
    primaryColor: Colors.amber[800],
    primarySwatch: Colors.amber,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light,
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
    textTheme: TextTheme(
        button: TextStyle(fontSize: 14),
        bodyText2: TextStyle(color: Colors.amber)),
    brightness: Brightness.dark,
    canvasColor: Colors.black,
    accentColor: Colors.amber,
    checkboxTheme:
        CheckboxThemeData(fillColor: MaterialStateProperty.all(Colors.amber)),
    radioTheme:
        RadioThemeData(fillColor: MaterialStateProperty.all(Colors.amber)),
    shadowColor: Colors.grey,
    hoverColor: Colors.grey[800]!.withOpacity(0.6),
    iconTheme: IconThemeData(
      color: Colors.amber,
    ),
  );

  Rx<TextStyle> get bodyTextTheme => Get.theme.textTheme.bodyText2!
      .copyWith(
        fontSize: fontSize!.toDouble(),
        color: Hive.box("theme").get("isDarkMode") ?? false
            ? Colors.amber
            : Colors.blue,
      )
      .obs;

  addFontToHive() {
    font.put("fontSize", fontSize!);
    update();
  }

  addThemeToHive() {
    Hive.box("theme").put("isDarkMode", thememode!);
    update();
  }
}
