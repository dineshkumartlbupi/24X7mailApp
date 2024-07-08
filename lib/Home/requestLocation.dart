import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twentyfourby_seven/Utils/Mycolor.dart';
import 'package:twentyfourby_seven/Utils/globalText.dart';

class RequestLocation extends StatelessWidget {
  const RequestLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: Get.height * 0.3,
            width: Get.width * 0.6,
            color: MyColor.cardIColorIndigo,
            margin: EdgeInsets.symmetric(
                vertical: Get.height * 0.05, horizontal: Get.width * 0.02),
            child: Column(
              children: [
                GlobalText(
                  'Request your Locations',
                  color: MyColor.white,
                  fontWeight: FontWeight.w700,
                  fontSize: Get.height * 0.035,
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Container(
                  width: Get.width * 0.5,
                  child: TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                      fillColor: MyColor.yellowGold,
                      hintText: 'Search with Zip Code',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
