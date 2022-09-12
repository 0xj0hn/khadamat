import 'package:TexBan/screens/createFile.dart';
import 'package:TexBan/screens/emptyHouseServices.dart';
import 'package:TexBan/screens/ersServices.dart';
import 'package:TexBan/screens/haghighiServices.dart';
import 'package:TexBan/screens/hoghughiServices.dart';
import 'package:TexBan/screens/naghlServices.dart';
import 'package:TexBan/screens/valueAddServices.dart';
import 'package:TexBan/utils/theme.dart';
import 'package:TexBan/widgets/appBar.dart';
import 'package:TexBan/widgets/customedCardWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Finance2ServicesPage extends StatelessWidget {
  Finance2ServicesPage({Key? key}) : super(key: key);
  ThemeX controller = Get.find();
  @override
  Widget build(BuildContext context) {
    List titles = [
      "مشاوره مالیاتی",
      "تهیه لایحه اعتراض",
      "اشخاص حقوقی",
      "اشخاص حقیقی",
      "ارزش افزوده",
      "ارث",
      "مستغلات",
      "تراکنش بانکی",
      "سامانه مودیان",
      "خانه‌های خالی",
    ];
    List pages = [
      CreateFilePage(title: "مشاوره مالیاتی"), //moshavere
      CreateFilePage(
        title: "تهیه لایحه اعتراض",
      ), //layehe
      HoghughiServicesPage(
        title: "خدمات مالیاتی اشخاص حقوقی",
      ),
      HaghighiServicesPage(
        title: "خدمات مالیاتی اشخاص حقیقی",
      ),
      ValueAddServicePage(
        title: "خدمات مالیاتی ارزش افزوده",
      ),
      ErsServicesPage(
        title: "خدمات مالیاتی ارث",
      ),
      NaghlServicesPage(
        title: "خدمات مالیاتی مستغلات",
      ),
      CreateFilePage(title: "تراکنش بانکی"), //tarakonesh
      CreateFilePage(title: "سامانه مودیان"), //mudian
      EmptyHousePage(
        title: "خدمات مالیاتی خانه‌های خالی",
      ),
    ];
    List items = [
      // Icon(Icons.phone, size: 50),
      // Icon(Icons.assignment_late_rounded, size: 50),
      // Icon(Icons.group, size: 50),
      // Icon(Icons.person, size: 50),
      // Icon(Icons.price_check, size: 50),
      // Icon(Icons.elderly, size: 50),
      // Icon(Icons.transfer_within_a_station, size: 50),
      // Icon(
      //   Icons.credit_card,
      //   size: 50,
      // ),
      // Icon(Icons.web, size: 50),
      // Icon(Icons.home_filled, size: 50),
      CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage("assets/images/moshavereMaliati.jpg"),
      ),
      CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage("assets/images/tahieLayeheEteraz.jpg"),
      ),
      CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage("assets/images/ashkhasHoghughi.png"),
      ),
      CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage("assets/images/ashkhasHaghighi.jpg"),
      ),
      CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage("assets/images/valueAdded.png"),
      ),
      CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage("assets/images/ers.png"),
      ),
      CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage("assets/images/naghl.jpg"),
      ),
      CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage("assets/images/tarakonesh.jpg"),
      ),
      CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage("assets/images/samane.jpg"),
      ),
      CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage("assets/images/emptyHouses.jpg"),
      ),
    ];
    ScrollController scroller = ScrollController();
    return Scaffold(
      appBar: CustomedAppBar(
        title: "خدمات مالیاتی",
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              controller: scroller,
              shrinkWrap: true,
              crossAxisCount: 3,
              mainAxisSpacing: 50,
              childAspectRatio: 1.2,
              children: List.generate(
                10,
                (i) => CustomedCard(
                  onPressed: () {
                    Navigator.of(context)
                        .push(GetPageRoute(page: () => pages[i]));
                  },
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Center(
                          child: items[i],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(0),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            titles[i],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // SizedBox(
          //   height: 20,
          // ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(18),
              child: Text(
                "کلیه اشخاص حقیقی و حقوقی مقیم ایران نسبت به کلیه درآمدهایی که در ایران تحصیل می‌کنند مشمول مالیات هستند.",
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
