import 'package:TexBan/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CustomedTextField extends StatelessWidget {
  @override
  TextStyle? style = TextStyle();
  String? label;
  String? helper;
  Icon? icon;
  bool? obscureText;
  TextDirection? dir;
  TextEditingController? controller;
  int maxLines;
  TextInputType? keyboardType;
  Function(String)? onChanged;
  List<TextInputFormatter>? inputFormatters;
  int? maxLength;
  bool? enabled;
  CustomedTextField({
    this.label,
    this.style,
    this.icon,
    this.helper,
    this.controller,
    this.obscureText = false,
    this.dir = TextDirection.rtl,
    this.maxLines = 1,
    this.onChanged,
    this.keyboardType,
    this.inputFormatters,
    this.maxLength,
    this.enabled,
  });

  Widget build(BuildContext context) {
    return GetBuilder<ThemeX>(
      builder: (_) => TextFormField(
        enabled: enabled,
        autofocus: false,
        textAlignVertical: TextAlignVertical.top,
        cursorColor: Colors.blue,
        cursorWidth: 1.2,
        textAlign: TextAlign.right,
        style: TextStyle(fontSize: _.fontSize),
        keyboardType: keyboardType,
        obscureText: obscureText!,
        controller: controller,
        textDirection: dir,
        onChanged: onChanged,
        maxLines: maxLines,
        maxLength: maxLength,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          icon: icon,
          labelStyle: style,
          labelText: label,
          helperText: helper,
          helperMaxLines: 3,
          alignLabelWithHint: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}

class CustomedTextFormField extends StatelessWidget {
  TextEditingController? controller;
  String? label;
  String? helperText;
  Icon? icon;
  Function(String)? onChanged;
  CustomedTextFormField({
    this.controller,
    this.label,
    this.icon,
    this.helperText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeX>(
      builder: (_) => TextFormField(
        textAlignVertical: TextAlignVertical.top,
        maxLines: 5,
        onChanged: onChanged,
        autofocus: false,
        cursorColor: Colors.blue,
        cursorWidth: 1.2,
        textAlign: TextAlign.right,
        controller: controller,
        style: TextStyle(fontSize: _.fontSize),
        decoration: InputDecoration(
          icon: icon,
          //hintText: "نام کاربری خود را وارد کنید",
          labelText: label,
          helperText:
              helperText, //"برای مثال: شارژ رمضان و شوال ۱۴۴۳ به دلیل ... در وقت مقرر پرداخت نشد.",
          helperMaxLines: 4,
          alignLabelWithHint: true,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
