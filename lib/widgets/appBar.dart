import 'package:flutter/material.dart';

class CustomedAppBar extends StatelessWidget with PreferredSizeWidget {
  String? title;
  CustomedAppBar({this.title});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title!,
        style: TextStyle(color: Colors.blue),
      ),
      elevation: 0.5,
      centerTitle: true,
      backgroundColor: Colors.white,
    );
  }

  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
