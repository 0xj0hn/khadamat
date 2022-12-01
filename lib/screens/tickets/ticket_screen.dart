import 'package:TexBan/widgets/appbar.dart';
import 'package:flutter/material.dart';

class TicketScreen extends StatelessWidget {
  String title;
  TicketScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomedAppBar(title: title),
      body: Center(
        child: Text("hello"),
      ),
    );
  }
}
