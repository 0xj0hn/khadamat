import 'dart:async';

import 'package:TexBan/widgets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UnknownPage extends StatelessWidget {
  UnknownPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RxDouble opacity = 0.0.obs;
    Future? changeOpacity() {
      opacity.value = 1;

      print(opacity.value);
    }

    return Scaffold(
      appBar: CustomedAppBar(
        title: "موجود نیست",
      ),
      body: Center(
        child: Text("این آیتم هنوز در دسترس قرار نگرفته!"),
      ),
    );
  }
}
