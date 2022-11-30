import 'package:TexBan/widgets/appBar.dart';
import 'package:TexBan/widgets/customedButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class SignUpPage extends StatelessWidget {
  @override
  var checkValue = false.obs;
  TextEditingController nationalCodeTxt = TextEditingController();
  TextEditingController nameTxt = TextEditingController();
  TextEditingController familyTxt = TextEditingController();
  TextEditingController phoneTxt = TextEditingController();
  TextEditingController passTxt = TextEditingController();
  TextEditingController repassTxt = TextEditingController();
  FocusNode nameF = FocusNode();
  FocusNode familyF = FocusNode();
  FocusNode bluckF = FocusNode();
  FocusNode vahedF = FocusNode();
  FocusNode phoneF = FocusNode();
  FocusNode passF = FocusNode();
  FocusNode repassF = FocusNode();
  var isLoading = false.obs;
  @override
  Widget build(BuildContext context) {
    void checkChanged(bool? value) {
      checkValue.value = value!;
    }

    return Scaffold(
      appBar: CustomedAppBar(
        title: "صفحه ثبت نام",
      ),
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(30),
              child: TextField(
                autofocus: false,
                cursorColor: Colors.blue,
                cursorWidth: 1.2,
                textAlign: TextAlign.left,
                controller: nationalCodeTxt,
                onSubmitted: (S) {
                  nameF.requestFocus();
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.person),
                    labelText: "شمارهٔ ملی خود را وارد کنید.",
                    helperText: "لطفا شمارهٔ ملی را بدون صفر وارد کنید.",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: TextField(
                autofocus: false,
                focusNode: nameF,
                controller: nameTxt,
                cursorColor: Colors.blue,
                cursorWidth: 1.2,
                textAlign: TextAlign.right,
                onSubmitted: (S) {
                  familyF.requestFocus();
                },
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.info),
                  labelText: "نام خود را وارد کنید",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: TextField(
                autofocus: false,
                focusNode: familyF,
                controller: familyTxt,
                cursorColor: Colors.blue,
                cursorWidth: 1.2,
                textAlign: TextAlign.right,
                onSubmitted: (S) {
                  phoneF.requestFocus();
                },
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.info),
                  labelText: "نام خانوادگی خود را وارد کنید",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: TextField(
                autofocus: false,
                focusNode: phoneF,
                controller: phoneTxt,
                cursorColor: Colors.blue,
                cursorWidth: 1.2,
                textAlign: TextAlign.left,
                keyboardType: TextInputType.phone,
                onSubmitted: (S) {
                  passF.requestFocus();
                },
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.phone),
                  labelText: "شماره تلفن خود را وارد کنید",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  helperText: "مثلا 09384260524",
                ),
              ),
            ),
            Obx(
              () => Padding(
                padding: EdgeInsets.all(30),
                child: TextField(
                  autofocus: false,
                  focusNode: passF,
                  controller: passTxt,
                  cursorColor: Colors.blue,
                  cursorWidth: 1.2,
                  textAlign: TextAlign.left,
                  obscureText: !checkValue.value,
                  textDirection: TextDirection.ltr,
                  onSubmitted: (S) {
                    repassF.requestFocus();
                  },
                  decoration: InputDecoration(
                    //prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.lock_rounded),
                    //hintText: "گذرواژه خود را وارد کنید",
                    labelText: "گذرواژه را وارد کنید",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            Obx(
              () => Padding(
                padding: EdgeInsets.all(30),
                child: TextField(
                  autofocus: false,
                  focusNode: repassF,
                  controller: repassTxt,
                  cursorColor: Colors.blue,
                  cursorWidth: 1.2,
                  textAlign: TextAlign.left,
                  obscureText: !checkValue.value,
                  textDirection: TextDirection.ltr,
                  decoration: InputDecoration(
                    //prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.lock_rounded),
                    //hintText: "گذرواژه خود را وارد کنید",
                    labelText: "گذرواژه را مجددا وارد کنید",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            Obx(
              () => Padding(
                padding: EdgeInsets.fromLTRB(80, 10, 80, 10),
                child: CheckboxListTile(
                  value: checkValue.value,
                  activeColor: Colors.green,
                  onChanged: checkChanged,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  title: Text(
                    "نمایش گذرواژه: ",
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: Container(
                margin: EdgeInsets.fromLTRB(50, 20, 50, 20),
                height: 60,
                child: CustomedButton(
                  onPressed: () {},
                  child: Obx(
                    () => isLoading.value
                        ? Container()
                        : Text(
                            "ثبت نام",
                          ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("حساب کاربری دارید؟ ورود",
                    style:
                        TextStyle(fontWeight: FontWeight.w300, fontSize: 13)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
