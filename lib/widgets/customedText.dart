import 'package:flutter/material.dart';

class CustomedText extends StatelessWidget {
  final title;
  const CustomedText({Key? key, this.title}) : super(key: key);

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
          style: TextStyle(fontSize: 13),
        ),
      ),
    );
  }
}
