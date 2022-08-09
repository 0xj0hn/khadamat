import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:TexBan/widgets/appBar.dart';
import 'package:TexBan/widgets/customedText.dart';
import 'package:TexBan/widgets/customedTextField.dart';

class CreateFilePage extends StatelessWidget {
  String? title;
  CreateFilePage({Key? key, this.title = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController namefamily = TextEditingController();
    TextEditingController phone = TextEditingController();
    TextEditingController txtTitle = TextEditingController(text: title!);
    TextEditingController txtContent = TextEditingController();

    return Scaffold(
      appBar: CustomedAppBar(
        title: "تشکیل پرونده",
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: CustomedTextField(
              label: "نام و نام‌خانوادگی",
              icon: Icon(Icons.person),
              controller: namefamily,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: CustomedTextField(
              label: "شماره تماس",
              icon: Icon(Icons.phone),
              controller: phone,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: CustomedTextField(
              label: "عنوان درخواست",
              icon: Icon(Icons.title),
              controller: txtTitle,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: CustomedTextFormField(
              label: "شرح درخواست",
              icon: Icon(Icons.assignment),
              controller: txtContent,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(60),
            child: CustomedText(
              title: "نکات آموزش: دانم که ندانم",
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: () {
          Get.snackbar(
            "وضعیت",
            "اوه مثل اینکه خطایی پیش اومد...",
          );
        },
      ),
    );
  }
}
