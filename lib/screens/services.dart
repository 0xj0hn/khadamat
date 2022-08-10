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
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                  child: CustomedButton(
                    padding: EdgeInsets.all(30),
                    child: Text("تشکیل پرونده"),
                    onPressed: () {},
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                  child: CustomedButton(
                    padding: EdgeInsets.all(30),
                    child: Text("ثبت‌نام کد اقتصادی"),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                  child: CustomedButton(
                    padding: EdgeInsets.all(30),
                    child: Text("تحریر دفاتر"),
                    onPressed: () {},
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                  child: CustomedButton(
                    padding: EdgeInsets.all(30),
                    child: Text("ارسال اظهارنامه"),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                  child: CustomedButton(
                    padding: EdgeInsets.all(30),
                    child: Text("ارسال اظهارنامه ارزش‌افزوده"),
                    onPressed: () {},
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                  child: CustomedButton(
                    padding: EdgeInsets.all(30),
                    child: Text("ارسال صورت معاملات فصلی"),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                  child: CustomedButton(
                    padding: EdgeInsets.all(30),
                    child: Text("تفسیر گزارش رسیدگی"),
                    onPressed: () {},
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                  child: CustomedButton(
                    padding: EdgeInsets.all(30),
                    child: Text("حضور جلسات رسیدگی"),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                  child: CustomedButton(
                    padding: EdgeInsets.all(30),
                    child: Text("پیگیری اعتراضات"),
                    onPressed: () {},
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                  child: CustomedButton(
                    padding: EdgeInsets.all(30),
                    child: Text("نقل و انتقال سهام"),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                  child: CustomedButton(
                    padding: EdgeInsets.all(30),
                    child: Text("ثبت اعتراضات و تهیه لایحه خاص"),
                    onPressed: () {},
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                  child: CustomedButton(
                    padding: EdgeInsets.all(30),
                    child: Text("مشاوره رایگان"),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: Text(
              "کلیه اشخاص حقیقی تابع ایران",
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
