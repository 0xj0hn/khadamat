import 'package:TexBan/screens/splash_screen.dart';
import 'package:TexBan/utils/models/scroll_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:TexBan/utils/theme.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("font");
  await Hive.openBox("theme");
  await Hive.openBox("auth");
  var box = Hive.box("auth");
  box.put("wasLoggined", box.get("wasLoggined") ?? false);
  runApp(const MyApp());
}

class ThemeService {
  var box = Hive.box("theme");
  ThemeMode get theme =>
      box.get("isDarkMode") ?? false ? ThemeMode.dark : ThemeMode.light;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "تکسبان",
      scrollBehavior: MyScrollBehavior(),
      home: SplashScreen(),
      locale: Locale("fa"),
      theme: ThemeX.lightTheme,
      darkTheme: ThemeX.darkTheme,
      defaultTransition: Transition.topLevel,
      themeMode: ThemeService().theme,
      debugShowCheckedModeBanner: false,
      textDirection: TextDirection.rtl,
      // routes: {
      //   "/": (context) => BottomNavTabView(),
      //   "/hoghughiServices": (context) => HoghughiServicesPage(),
      //   "/login": (context) => LoginPage(),
      // },
      // getPages: [
      //   GetPage(name: "/", page: () => BottomNavTabView()),
      //   // GetPage(name: "/financeServices", page: () => FinanceServicePage()),
      //   // GetPage(name: "/settings", page: () => SettingsPage()),
      //   // GetPage(name: "/hoghughiServices", page: () => HoghughiServicesPage()),
      //   // GetPage(name: "/home", page: () => HomePage()),
      //   // GetPage(name: "/createFile", page: () => CreateFilePage()),
      //   // GetPage(name: "/valueAddService", page: () => ValueAddServicePage()),
      //   // GetPage(name: "/naghlServices", page: () => NaghlServicesPage()),
      //   // GetPage(name: "/emptyHouses", page: () => EmptyHousePage()),
      //   // GetPage(name: "/ersServices", page: () => ErsServicesPage()),
      //   // GetPage(name: "/haghighiServices", page: () => HaghighiServicesPage()),
      // ],
      // unknownRoute: GetPage(name: "/unknown", page: () => UnknownPage()),
    );
  }
}
