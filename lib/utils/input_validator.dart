import 'package:TexBan/utils/api/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputValidatorController extends GetxController {
  String? errorText;
  late bool _isValidate = false;
  String inputValue;
  InputValidatorController(this.inputValue);

  String get value {
    return inputValue;
  }

  bool get validate {
    return _isValidate;
  }

  @override
  void onInit() {
    errorText = null;
    super.onInit();
  }
}

class PhoneChecker extends InputValidatorController {
  PhoneChecker(inputValue) : super(inputValue);

  phoneChecker() {
    if (inputValue == "") {
      errorText = "این فیلد نمی‌تواند خالی باشد.";
      _isValidate = false;
      update();
    } else if (!inputValue.isPhoneNumber) {
      errorText = "شماره را اشتباه وارد کرده‌اید.";
      _isValidate = false;
      update();
    } else {
      errorText = null;
      _isValidate = true;
      update();
    }
  }
}

class PriorityClass {
  Priority? priority;
  static String getPriorityByName(Priority priority) {
    if (priority.priority == 1) {
      return "فوری";
    } else if (priority.priority == 2) {
      return "زیاد";
    } else if (priority.priority == 3) {
      return "معمولی";
    } else if (priority.priority == 4) {
      return "کم";
    } else if (priority.priority == 5) {
      return "خیلی کم";
    } else {
      return "مشکل";
    }
  }
}
