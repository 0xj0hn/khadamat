import 'package:TexBan/screens/services/financial_services_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class NavBarController extends GetxController {
  List screens = [
    FinanceServicePage(),
    Container(),
    Container(),
  ];
  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.home_outlined,
        color: Colors.blue,
      ),
      label: "خانه",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.message_outlined,
        color: Colors.red,
      ),
      label: "پیام‌ها",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.notifications_outlined),
      label: "اعلان‌ها",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings_outlined),
      label: "تنظیمات",
    ),
  ];
  RxInt currentIndex = 0.obs;
}
