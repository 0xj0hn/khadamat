import 'package:TexBan/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomedText extends StatelessWidget {
  final title;
  CustomedText({Key? key, this.title});
  ThemeX controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
        ),
      ),
      child: Container(
        child: Text(
          title,
        ),
      ),
    );
  }
}
