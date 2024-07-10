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
                  child: const TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                      fillColor: MyColor.white,
                      hintText: 'Search with Zip Code',
                      filled: true,
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w700, color: MyColor.black),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          Center(
            child: GlobalText(
              'Choose your virtual address',
              fontSize: Get.height * 0.03,
              fontWeight: FontWeight.w700,
            ),
          ),
          Center(
            child: GlobalText(
              'Choose from our company-managed locations or an address near you',
              fontSize: Get.height * 0.014,
              fontWeight: FontWeight.w700,
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 4,
                itemBuilder: (_, index) => Card(
                      color: MyColor.yellowGold,
                      child: GlobalText(index.toString()),
                    )),
          )
        ],
      ),
    );
  }
}
