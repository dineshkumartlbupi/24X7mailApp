import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twentyfourby_seven/Utils/Mycolor.dart';
import 'package:twentyfourby_seven/Utils/addImage.dart';
import 'package:twentyfourby_seven/Utils/globalText.dart';

class CustomerAdd extends StatelessWidget {
  const CustomerAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(Get.height * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.location_city),
                SizedBox(
                  width: Get.width * 0.025,
                ),
                GlobalText(
                  'My Address',
                  fontSize: Get.height * 0.04,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            GlobalText(
              'My Virtual Address :',
              fontSize: Get.height * 0.02,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Container(
              height: Get.height * 0.12,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.red,
                    size: 32.0,
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Text(
                      'yuiy',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            GlobalText(
              'Upload USPS Form 1583 :',
              fontSize: Get.height * 0.03,
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Container(
              height: Get.height * 0.30,
              width: Get.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: MyColor.black,
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AddImage.uploadIcon,
                    height: Get.height * 0.065,
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  GlobalText('Drag & Drop background image(s)'),
                  GlobalText('or'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: GlobalText("Choose file(s)"),
                      ),
                      SizedBox(
                        width: Get.width * 0.01,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const GlobalText("upload"),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
