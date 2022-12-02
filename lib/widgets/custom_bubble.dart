import 'dart:ui';

import 'package:flutter/material.dart';

class CustomBubble extends StatelessWidget {
  String type;
  String text;
  String time;

  CustomBubble({
    required this.text,
    required this.type,
    required this.time,
  });

  bool isSender = false;
  Widget build(BuildContext context) {
    int hour = DateTime.tryParse(time)?.toLocal().hour ?? 0;
    int minute = DateTime.tryParse(time)?.toLocal().minute ?? 0;
    isSender = (type == "sendBubble");
    return Container(
      alignment: isSender ? Alignment.topRight : Alignment.topLeft,
      child: Card(
        surfaceTintColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: isSender ? Radius.circular(30) : Radius.circular(3),
            topRight: isSender ? Radius.circular(3) : Radius.circular(15),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(15),
          ),
        ),
        margin: isSender
            ? EdgeInsets.fromLTRB(100, 8, 8, 8)
            : EdgeInsets.fromLTRB(8, 8, 100, 8),
        //clipper: ChatBubbleClipper1(type: type),
        elevation: 1,
        color: isSender
            ? Theme.of(context).accentColor.withAlpha(200)
            : Colors.blueGrey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SelectableText(
                text,
                style: TextStyle(
                  color: Theme.of(context).canvasColor,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(bottom: 8.0, right: 8.0, left: 8.0),
              child: Row(
                children: [
                  Text(
                    "$hour:$minute",
                    style: TextStyle(
                      fontSize: 13,
                      color: Theme.of(context).canvasColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomBub extends StatelessWidget {
  String? text;
  CustomBub({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 20,
          width: 80,
          margin:
              EdgeInsets.only(left: screenWidth / 5, right: screenWidth / 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Theme.of(context).accentColor.withAlpha(150),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).accentColor.withOpacity(0.7),
                blurRadius: 18,
                //blurStyle: BlurStyle.inner,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: Text(
              text!,
              style: TextStyle(color: Colors.white),
            ),
          )),
    );
  }
}
