import 'package:TexBan/screens/createFile.dart';
import 'package:TexBan/screens/emptyHouseServices.dart';
import 'package:TexBan/screens/ersServices.dart';
import 'package:TexBan/screens/haghighiServices.dart';
import 'package:TexBan/screens/home.dart';
import 'package:TexBan/screens/naghlServices.dart';
import 'package:TexBan/screens/hoghughiServices.dart';
import 'package:TexBan/screens/settings.dart';
import 'package:TexBan/screens/unknownPage.dart';
import 'package:TexBan/screens/valueAddServices.dart';
import 'package:flutter/material.dart';
import 'package:TexBan/screens/financialServices.dart';
import 'package:get/get.dart';
import 'package:TexBan/utils/theme.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("font");
  await Hive.openBox("theme");
  Hive.box("theme").put("isDarkMode", false);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "تکسبان",
      initialRoute: "/home",
      locale: Locale("fa"),
      theme: ThemeX.lightTheme,
      darkTheme: ThemeX.darkTheme,
      defaultTransition: Transition.topLevel,
      themeMode: Hive.box("theme").get("isDarkMode") ?? false
          ? ThemeMode.dark
          : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      textDirection: TextDirection.rtl,
      getPages: [
        GetPage(name: "/financeServices", page: () => FinanceServicePage()),
        GetPage(name: "/settings", page: () => SettingsPage()),
        GetPage(name: "/services", page: () => HoghughiServicesPage()),
        GetPage(name: "/home", page: () => HomePage()),
        GetPage(name: "/createFile", page: () => CreateFilePage()),
        GetPage(name: "/valueAddService", page: () => ValueAddServicePage()),
        GetPage(name: "/naghlServices", page: () => NaghlServicesPage()),
        GetPage(name: "/emptyHouses", page: () => EmptyHousePage()),
        GetPage(name: "/ersServices", page: () => ErsServicesPage()),
        GetPage(name: "/haghighiServices", page: () => HaghighiServicesPage()),
      ],
      unknownRoute: GetPage(name: "/unknown", page: () => UnknownPage()),
    );
  }
}
