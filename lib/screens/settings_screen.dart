import 'package:TexBan/screens/authentication/login_screen.dart';
import 'package:TexBan/utils/theme.dart';
import 'package:TexBan/utils/api/user_provider.dart';
import 'package:TexBan/widgets/appbar.dart';
import 'package:TexBan/widgets/customed_button.dart';
import 'package:TexBan/widgets/customed_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SettingsPage extends StatelessWidget {
  @override
  ThemeX controller = Get.find();
  UserProvider userProvider = UserProvider();
  TextEditingController txtName = TextEditingController();
  TextEditingController txtFamily = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomedAppBar(
        title: "پروفایل و تنظیمات",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GetBuilder<ThemeX>(
              builder: (_) => CheckboxListTile(
                contentPadding: EdgeInsets.all(8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                title: Text(
                  "تم تیره: ",
                  style: _.bodyTextTheme.value,
                ),
                value: _.thememode!,
                onChanged: (val) {
                  _.thememode = val!;
                  Get.changeThemeMode(
                    val == true ? ThemeMode.dark : ThemeMode.light,
                  );
                  controller.addThemeToHive();
                },
              ),
            ),

            Divider(
              height: 2,
            ),
            FutureBuilder(
              future: userProvider.getMyInformation(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  txtName.text = snapshot.data!["first_name"];
                  txtFamily.text = snapshot.data!["last_name"];
                  return Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: CustomedTextField(
                            label: "نام",
                            controller: txtName,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: CustomedTextField(
                            label: "نام خانوادگی",
                            controller: txtFamily,
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Container(
                    width: 35,
                    height: 35,
                    child: LoadingIndicator(
                      indicatorType: Indicator.ballPulse,
                    ),
                  );
                }
              },
            ),
            CustomedButton(
              padding: EdgeInsets.all(15),
              onPressed: () async {
                Map response = await userProvider.updateMyInformation(
                  txtName.text,
                  txtFamily.text,
                );
                Get.snackbar("وضعیت", "اطلاعات با موفقیت ثبت گردید");
              },
              child: Text("تغییر نام و نام خانوادگی"),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "تنظیمات فونت:",
            ),
            GetBuilder<ThemeX>(
              init: ThemeX(),
              builder: (_) => Slider(
                value: _.fontSize!.toDouble(),
                divisions: 2,
                onChanged: (val) {
                  _.fontSize = val;
                  _.addFontToHive();
                },
                label: _.fontSize!.round().toString(),
                min: 14,
                max: 18,
              ),
            ),

            // Padding(
            //   padding: EdgeInsets.all(8),
            //   child: Text(
            //     "پس از تعیین تم مورد نظر و فونت، این صفحه را ببندید تا تغییرات اعمال شود.",
            //     //style: controller,
            //   ),
            // ),
            Divider(
              height: 2,
            ),
            //InstagramViewWidget(),
            Divider(
              height: 2,
            ),
            SizedBox(
              height: 200,
            ),
            ExitButtonWidget(),
          ],
        ),
      ),
    );
  }
}

class ExitButtonWidget extends StatelessWidget {
  const ExitButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: CustomedButton(
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pushReplacement(
            GetPageRoute(page: () => LoginPage()),
          );
          Hive.box("auth").put("wasLoggined", false);
        },
        padding: EdgeInsets.all(30),
        child: Text("خروج از حساب کاربری"),
      ),
    );
  }
}

class InstagramViewWidget extends StatelessWidget {
  const InstagramViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () async {
          launchUrlString("https://instagram.com/e.taxban");
        },
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Image.network(
                  "https://www.instagram.com/static/images/ico/favicon.ico/36b3ee2d91ed.ico"),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text("اینستاگرام تکسبان"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
