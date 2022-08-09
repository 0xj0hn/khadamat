import 'package:flutter/material.dart';
import 'package:TexBan/widgets/appBar.dart';
import 'package:TexBan/widgets/customedButton.dart';
import 'package:TexBan/widgets/customedText.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomedAppBar(
        title: "خدمات مالیاتی اشخاص حقوقی",
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(30),
            child: CustomedButton(
              padding: EdgeInsets.all(24),
              child: Text("تشکیل پرونده"),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: CustomedButton(
              padding: EdgeInsets.all(24),
              child: Text("ثبت‌نام کد اقتصادی"),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: CustomedButton(
              padding: EdgeInsets.all(24),
              child: Text("تحریر دفاتر"),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: CustomedButton(
              padding: EdgeInsets.all(24),
              child: Text("ارسال اظهارنامه"),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: CustomedButton(
              padding: EdgeInsets.all(24),
              child: Text("ارسال اظهارنامه ارزش‌افزوده"),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: CustomedButton(
              padding: EdgeInsets.all(24),
              child: Text("ارسال صورت معاملات فصلی"),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: CustomedButton(
              padding: EdgeInsets.all(24),
              child: Text("تفسیر گزارش رسیدگی"),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: CustomedButton(
              padding: EdgeInsets.all(24),
              child: Text("حضور در جلسات رسیدگی"),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: CustomedButton(
              padding: EdgeInsets.all(24),
              child: Text("پیگیری اعتراضات"),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: CustomedButton(
              padding: EdgeInsets.all(24),
              child: Text("نقل و انتقال سهام"),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: CustomedButton(
              padding: EdgeInsets.all(24),
              child: Text("ثبت اعتراضات و تهیهٔ لایحه خاص"),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: CustomedButton(
              padding: EdgeInsets.all(24),
              child: Text("مشاوره رایگان"),
              onPressed: () {},
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
    );
  }
}
