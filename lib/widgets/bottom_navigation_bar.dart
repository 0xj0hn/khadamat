import 'package:TexBan/screens/home/home_screen.dart';
import 'package:TexBan/screens/settings_screen.dart';
import 'package:TexBan/screens/tickets/ticket_screen.dart';
import 'package:TexBan/screens/tickets/tickets_detail_screen.dart';
import 'package:TexBan/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class BottomNavTabView extends StatelessWidget {
  BottomNavTabView({Key? key}) : super(key: key);
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  ThemeX mainController = Get.put(ThemeX());

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      HomePage(),
      Container(),
      TicketsDetailScreen(),
      Container(),
      SettingsPage(),
    ];
    List<PersistentBottomNavBarItem> items = [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home_outlined),
        title: "خانه",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.message_outlined),
        title: "پیام‌های من",
        activeColorPrimary: Colors.amber,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.messenger),
        title: "تیکت‌های من",
        activeColorPrimary: Colors.cyan,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.notifications_outlined),
        title: "اعلان‌ها",
        activeColorPrimary: Colors.red,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person_outline),
        title: "پروفایل",
        activeColorPrimary: Colors.green,
        inactiveColorPrimary: Colors.grey,
      ),
    ];

    return GetBuilder<ThemeX>(
      builder: (_) => PersistentTabView(
        context,
        controller: _controller,
        screens: screens,
        items: items,
        confineInSafeArea: true,
        backgroundColor:
            mainController.thememode! ? Colors.black : Colors.white,
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: false, // Default is true.
        hideNavigationBarWhenKeyboardShows:
            true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.

        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        navBarStyle: NavBarStyle.style9,
      ),
    );
  }
}
