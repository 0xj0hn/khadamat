import 'dart:async';

import 'package:TexBan/utils/userProvider.dart';
import 'package:TexBan/widgets/dropDownButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:TexBan/widgets/appBar.dart';
import 'package:TexBan/widgets/customedText.dart';
import 'package:TexBan/widgets/customedTextField.dart';

class CreateFilePage extends StatelessWidget {
  String? title;
  CreateFilePage({Key? key, this.title = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController txtIssueSubject = TextEditingController();
    TextEditingController phone = TextEditingController();
    TextEditingController txtTitle = TextEditingController(text: title);
    TextEditingController txtContent = TextEditingController();
    Rx<Priority> selectedPriority = Priority.critical.obs;

    return Scaffold(
      appBar: CustomedAppBar(
        title: "تشکیل پرونده",
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: CustomedTextField(
              label: "عنوان مشکل",
              icon: Icon(Icons.report_problem),
              controller: txtIssueSubject,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            // child: CustomedTextField(
            //   label: "اولویت",
            //   icon: Icon(Icons.priority_high),
            //   controller: phone,
            //   keyboardType: TextInputType.phone,
            //   maxLength: 11,
            //   helper: "نمونه: 09381234567",
            //   inputFormatters: [
            //     FilteringTextInputFormatter.deny(RegExp(r"[a-z]|[A-Z]")),
            //   ],
            // ),
            child: createPriority(context, selectedPriority),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: CustomedTextField(
              label: "عنوان درخواست",
              icon: Icon(Icons.title),
              controller: txtTitle,
              enabled: false,
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
            padding: EdgeInsets.fromLTRB(60, 25, 60, 25),
            child: CustomedText(
              title:
                  "کلیه مالکین اعم از اشخاص حقیقی و حقوقی نسبت به اموال و املاک خود واقع در ایران مشمول مالیات می‌باشند.",
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.check),
        onPressed: () {
          UserProvider userProvider = UserProvider();

          userProvider.sendTicket(
            selectedPriority.value,
            txtIssueSubject,
            txtTitle.text,
            txtContent.text,
          );
        },
      ),
    );
  }

  Row createPriority(BuildContext context, Rx<Priority> selectedPriority) {
    return Row(
      children: [
        const Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Icon(
              Icons.priority_high_outlined,
              color: Colors.grey,
            ),
          ),
        ),
        Expanded(
          flex: 9,
          child: DecoratedBox(
            child: CustomDropDownButton(
              selectedPriority: selectedPriority,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).dividerColor,
                strokeAlign: StrokeAlign.outside,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}
