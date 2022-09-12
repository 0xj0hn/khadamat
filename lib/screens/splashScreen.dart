import 'dart:async';
import 'dart:ffi';
import 'dart:io';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:TexBan/screens/login.dart';
import 'package:TexBan/widgets/bottomNavBar.dart';
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
    Timer(
      Duration(seconds: 3),
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
