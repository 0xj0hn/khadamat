import 'package:TexBan/screens/home/home_screen.dart';
import 'package:TexBan/screens/authentication/signup_screen.dart';
import 'package:TexBan/utils/input_validator.dart';
import 'package:TexBan/utils/user_provider.dart';
import 'package:TexBan/widgets/appbar.dart';
import 'package:TexBan/widgets/bottom_navigation_bar.dart';
import 'package:TexBan/widgets/customed_button.dart';
import 'package:TexBan/widgets/customed_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../../utils/theme.dart';

class LoginPage extends StatelessWidget {
  var checkValue = false.obs;
  final TextEditingController phoneNumberTxt = TextEditingController();
  TextEditingController codeTxt = TextEditingController();
  ThemeX themeController = Get.put(ThemeX());
  @override
  Widget build(BuildContext context) {
    void checkChanged(bool? value) {
      checkValue.value = value!;
    }

    var isLoading = false.obs;
    UserProvider userProvider = UserProvider();
    return Scaffold(
      appBar: CustomedAppBar(
        title: "صفحه ورود",
      ),
      body: Container(
        child: ListView(
          children: [
            // SizedBox(
            //   height: Get.height / 9,
            // ),

            // Image.network(
            //   //"https://images.everydayhealth.com/images/plank-jack.gif?w=9999999",
            //   "https://www.stretchmarks.org/wp-content/uploads/2016/08/icon-bodybuilding.png",
            //   height: 190,
            //   width: 250,
            // ),
            SizedBox(
              height: Get.height / 5,
            ),

            Padding(
              padding: const EdgeInsets.all(30),
              child: GetBuilder<PhoneChecker>(
                init: PhoneChecker(phoneNumberTxt.text),
                builder: (_) => TextFormField(
                  autofocus: false,
                  cursorColor: Colors.blue,
                  keyboardType: TextInputType.phone,
                  cursorWidth: 1.2,
                  textAlign: TextAlign.left,
                  controller: phoneNumberTxt,
                  onChanged: (newValue) {
                    _.inputValue = newValue;
                    _.phoneChecker();
                  },
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.phone_rounded),
                    //hintText: "نام کاربری خود را وارد کنید",

                    labelText: "شماره خود را وارد کنید.",
                    helperText: "نمونه: *******0996",
                    errorText: _.errorText,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(30),
              child: Container(
                margin: const EdgeInsets.fromLTRB(50, 20, 50, 20),
                height: 60,
                child: GetBuilder<PhoneChecker>(
                  builder: (_) => CustomedButton(
                    onPressed: () async {
                      if (_.validate) {
                        var requestID = await userProvider
                            .sendVerificationCode(phoneNumberTxt.text);

                        Get.bottomSheet(
                          BottomSheet(
                            enableDrag: false,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            onClosing: () {
                              print("Closed!");
                            },
                            builder: (cnx) {
                              return Scaffold(
                                body: Container(
                                  padding: EdgeInsets.all(30),
                                  child: Center(
                                    child: CustomedTextField(
                                      controller: codeTxt,
                                      label: "محل قرارگیری کد تایید",
                                      helper: "کد تایید را وارد کنید",
                                    ),
                                  ),
                                ),
                                floatingActionButton: FloatingActionButton(
                                  child: Icon(Icons.verified),
                                  onPressed: () async {
                                    if (await userProvider
                                        .verifyVerificationCode(
                                      phoneNumberTxt.text,
                                      codeTxt.text,
                                      requestID.toString(),
                                    )) {
                                      Get.back();
                                      Hive.box("auth").put("wasLoggined", true);
                                      Navigator.pushReplacement(
                                        context,
                                        GetPageRoute(
                                          page: () => BottomNavTabView(),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              );
                            },
                          ),
                        );
                        // Navigator.of(context).pushReplacement(
                        //   GetPageRoute(page: () => BottomNavTabView()),
                        // );
                        // Hive.box("auth").put("wasLoggined", true);

                      } else {
                        Get.snackbar("وضعیت", "شماره را به درستی وارد کنید.");
                      }
                    },
                    child: Text(
                      "ورود",
                    ),
                  ),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(10),
            //   child: TextButton(
            //     onPressed: () {
            //       Navigator.push(
            //         context,
            //         GetPageRoute(
            //           page: () => SignUpPage(),
            //         ),
            //       );
            //     },
            //     child: const Text(
            //       "حساب کاربری ندارید؟ ثبت نام",
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
