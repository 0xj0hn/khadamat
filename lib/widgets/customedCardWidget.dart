import 'package:flutter/material.dart';

class CustomedCard extends StatelessWidget {
  Widget? child;
  Function()? onPressed;
  CustomedCard({Key? key, this.child, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onPressed,
          child: child,
        ),
      ),
    );
  }
}
