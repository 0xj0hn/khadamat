import 'package:TexBan/utils/inputValidator.dart';
import 'package:TexBan/utils/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropDownButton extends StatelessWidget {
  final selectedPriority;
  const CustomDropDownButton({super.key, required this.selectedPriority});

  @override
  Widget build(BuildContext context) {
    List<Priority> priorities = [
      Priority.critical,
      Priority.high,
      Priority.normal,
      Priority.low,
      Priority.veryLow,
    ];
    List<DropdownMenuItem> items = List.generate(
      5,
      (index) => DropdownMenuItem(
        value: priorities[index],
        child: Text(PriorityClass.getPriorityByName(priorities[index])),
      ),
    );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "اولویت: ",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Obx(
              () => DropdownButton(
                hint: Text("اولویت را انتخاب کنید:"),
                borderRadius: BorderRadius.circular(8),
                items: items,
                value: selectedPriority.value,
                onChanged: (value) {
                  selectedPriority.value = value;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
