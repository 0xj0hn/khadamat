import 'package:flutter/material.dart';

class AppService {
  static String convertStatusToPersion(int status) {
    if (status == 1) {
      return "*باز شده*";
    } else if (status == 2) {
      return "دوباره باز شده";
    } else if (status == 3) {
      return "حل شده";
    } else if (status == 4) {
      return "بسته شده";
    } else if (status == 5) {
      return "تکراری";
    } else if (status == 6) {
      return "در حال بررسی";
    }
    return "...";
  }

  static Color convertStatusToColor(int status) {
    if (status == 1) {
      return Colors.green;
    } else if (status == 2) {
      return Colors.blueAccent;
    } else if (status == 3) {
      return Colors.greenAccent;
    } else if (status == 4) {
      return Colors.red;
    } else if (status == 5) {
      return Colors.grey;
    } else if (status == 6) {
      return Colors.cyan;
    }
    return Colors.black;
  }
}
