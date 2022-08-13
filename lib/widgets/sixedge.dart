import 'package:TexBan/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:get/get.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(size.width * 0.5000000, size.height * 0.0040000);
    path0.quadraticBezierTo(size.width * 0.1875000, size.height * 0.1495000,
        size.width * 0.0833333, size.height * 0.1980000);
    path0.lineTo(size.width * 0.0833333, size.height * 0.8020000);
    path0.lineTo(size.width * 0.5000000, size.height);
    path0.lineTo(size.width * 0.9166667, size.height * 0.8020000);
    path0.lineTo(size.width * 0.9150000, size.height * 0.2020000);
    path0.quadraticBezierTo(size.width * 0.8112500, size.height * 0.1525000,
        size.width * 0.5000000, size.height * 0.0040000);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class CustomMenuItem extends StatelessWidget {
  String? title;
  CustomMenuItem(this.title);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(
        100,
        (100 * 0.8333333333333334).toDouble(),
      ),
      painter: RPSCustomPainter(),
      child: Container(
        height: 100,
        width: 100,
        child: Center(
          child: Text(
            title!,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class CustomButtonItem extends StatelessWidget {
  final title;
  Function()? onPressed;
  CustomButtonItem({this.title, this.onPressed});
  ThemeX controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          title,
          textAlign: TextAlign.center,
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            PolygonBorder(sides: 6, borderRadius: 8),
          ),
        ),
      ),
    );
  }
}
