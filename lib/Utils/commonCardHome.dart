import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twentyfourby_seven/Utils/Mycolor.dart';
import 'package:twentyfourby_seven/Utils/globalText.dart';

class CommonCard extends StatelessWidget {
  final String imagePath;
  final String titleText;
  final String detailsText;

  CommonCard(
      {required this.imagePath,
      required this.titleText,
      required this.detailsText});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: MyColor.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: Container(
        color: MyColor.white,
        margin: EdgeInsets.symmetric(vertical: Get.height * 0.035),
        height: Get.height * 0.25,
        width: Get.width * 0.85,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: Get.height * 0.12,
              width: Get.width * 0.3,
              fit: BoxFit.cover,
            ),
            SizedBox(height: Get.height * 0.002),
            GlobalText(
              titleText,
              textAlign: TextAlign.center,
              fontSize: Get.height * 0.03,
              fontWeight: FontWeight.bold,
            ),
            GlobalText(
              detailsText,
              textAlign: TextAlign.center,
              fontSize: Get.height * 0.015,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
