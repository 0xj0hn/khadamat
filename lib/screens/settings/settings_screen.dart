import 'package:TexBan/screens/authentication/login_screen.dart';
import 'package:TexBan/screens/settings/settings_model.dart';
import 'package:TexBan/utils/theme.dart';
import 'package:TexBan/utils/api/user_provider.dart';
import 'package:TexBan/widgets/appbar.dart';
import 'package:TexBan/widgets/customed_button.dart';
import 'package:TexBan/widgets/customed_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  UserProvider userProvider = UserProvider();
  TextEditingController txtName = TextEditingController();

  TextEditingController txtFamily = TextEditingController();
  @override
  void initState() {
    super.initState();
    txtName = TextEditingController();
    txtFamily = TextEditingController();
  }

  @override
  void dispose() {
    txtName.dispose();
    txtFamily.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    print("Widget is gonna be built");
    return Scaffold(
      appBar: CustomedAppBar(
        title: "پروفایل و تنظیمات",
      ),
      body: ListView(
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
                _.addThemeToHive();
              },
            ),
          ),

          Divider(
            height: 2,
          ),
          GetBuilder<SettingsModel>(
            init: SettingsModel(),
            builder: (model) {
              model.getMyInformation();
              return Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: CustomedTextField(
                        label: "First name" + model.name.toString(),
                        icon: Icon(Icons.person_outline),
                        controller: txtName,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: CustomedTextField(
                        label: "Last name",
                        icon: Icon(Icons.person_outline),
                        controller: txtFamily,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          CustomedButton(
            padding: EdgeInsets.all(15),
            onPressed: () async {
              // Map response = await userProvider.updateMyInformation(
              //   txtName.text,
              //   txtFamily.text,
              // );
              // Get.snackbar("وضعیت", "اطلاعات با موفقیت ثبت گردید");
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

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ExitButtonWidget(),
          ),
          SizedBox(
            height: 60,
          ),
        ],
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
