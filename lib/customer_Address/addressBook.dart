import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twentyfourby_seven/Utils/Mycolor.dart';
import 'package:twentyfourby_seven/Utils/globalText.dart';

class AddressBook extends StatelessWidget {
  const AddressBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Icon(Icons.add_home_rounded),
              SizedBox(
                width: Get.width * 0.02,
              ),
              GlobalText(
                'Address Book',
                fontWeight: FontWeight.w700,
                color: MyColor.colorRedHome,
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: _showFormDialog,
                    child: GlobalText('+ Add shipping Address'))
              ],
            )
          ],
        ));
  }

  void _showFormDialog() async {
    return Get.defaultDialog(title: 'Hi, my name is vinamra Patel');
  }
}
