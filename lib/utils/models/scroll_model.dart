import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MyScrollBehavior extends ScrollBehavior {
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.mouse,
        PointerDeviceKind.touch,
      };
}
