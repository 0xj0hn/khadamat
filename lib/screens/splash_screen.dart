import 'dart:async';

import 'package:TexBan/screens/app_lock_screen.dart';
import 'package:TexBan/utils/api/user_provider.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:TexBan/screens/authentication/login_screen.dart';
import 'package:TexBan/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    UserProvider userProvider = UserProvider();
    var box = Hive.box("auth");
    Timer.periodic(Duration(seconds: 8), (timer) async {
      bool isAppLock = await userProvider.getLockStatus();
      if (isAppLock) {
        Get.off(() => AppLockScreen());
        timer.cancel();
      }
    });
    Timer(
      Duration(seconds: 4),
      () => Navigator.of(context).pushReplacement(
        GetPageRoute(
          page: () => Hive.box("auth").get("wasLoggined")
              ? BottomNavTabView()
              : LoginPage(),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/myVideo.gif"),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 60,
              width: 60,
              child: LoadingIndicator(
                indicatorType: Indicator.lineScale,
                colors: [Colors.purple],
                strokeWidth: 2.0,
              ),
            ),
          ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Text(NativeApi.majorVersion.toString()),
          // )
        ],
      ),
    );
  }
}
