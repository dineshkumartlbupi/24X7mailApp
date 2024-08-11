import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twentyfourby_seven/Utils/Mycolor.dart';
import 'package:twentyfourby_seven/Utils/addImage.dart';
import 'package:twentyfourby_seven/Utils/globalText.dart';
import 'package:twentyfourby_seven/customer_Address/customer_AddController.dart';
import 'package:twentyfourby_seven/customer_Address/shipment_customer/addressBook.dart';
import 'package:twentyfourby_seven/customer_Address/shipment_customer/subscribeView.dart';
import 'package:twentyfourby_seven/customer_Address/statement_View.dart';

import '../Service/api.dart';

class CustomerAdd extends StatelessWidget {
  CustomerAdd({super.key});
  var customerAddView = Get.put(CustomerAddController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              PopupMenuButton<String>(
                onSelected: (String newValue) async {
                  if (newValue == 'My Address') {
                    Get.to(() => CustomerAdd());
                  } else if (newValue == 'Address Book') {
                    await getViewState();
                    Get.to(() => AddressBook());
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'My Address',
                    child: GlobalText('My Address'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Address Book',
                    child: GlobalText('Address Book'),
                  ),
                ],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.supervised_user_circle_sharp,
                      color: MyColor.brightBlue,
                    ),
                    SizedBox(
                      width: Get.width * 0.055,
                    ),
                    GlobalText(
                      'User Setting',
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(
                      width: Get.width * 0.025,
                    ),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.002,
              ),
              PopupMenuButton<String>(
                onSelected: (String newValue) async {
                  if (newValue == 'Statements') {
                    Get.to(() => StatementView());
                  } else if (newValue == 'Subscription & Billing') {
                    Get.to(() => SubscribeView());
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'Statements',
                    child: GlobalText('Statements'),
                  ),
                  /*const PopupMenuItem<String>(
                    value: 'Subscription & Billing',
                    child: GlobalText('Subscription & Billing'),
                  ),*/
                ],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.account_balance_rounded,
                      color: MyColor.brightBlue,
                    ),
                    SizedBox(
                      width: Get.width * 0.02,
                    ),
                    GlobalText(
                      'Account Setting',
                      fontWeight: FontWeight.w700,
                    ),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
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
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.location_on,
                    color: MyColor.cardIColorIndigo,
                    size: 32.0,
                  ),
                  Flexible(
                      child: Obx(
                    () => Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            GlobalText(
                              customerAddView
                                      .propertyModel.value?.data?.username
                                      .toString()
                                      .capitalizeFirst ??
                                  '',
                              fontSize: 16.0,
                              color: Colors.black87,
                              fontWeight: FontWeight.w700,
                            ),
                            SizedBox(
                              width: Get.width * 0.004,
                            ),
                            GlobalText(
                              customerAddView.propertyModel.value?.data?.lname
                                      .toString()
                                      .capitalizeFirst ??
                                  '',
                              fontSize: 16.0,
                              color: Colors.black87,
                              fontWeight: FontWeight.w700,
                            ),
                            GlobalText(
                              '  #${customerAddView.propertyModel.value?.data?.mailBoxNum.toString() ?? ''}',
                              fontSize: 16.0,
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        GlobalText(
                          customerAddView.propertyModel.value?.data?.feature
                                  ?.properties?.featureDetails?.businessAddress
                                  .toString() ??
                              '',
                          fontSize: 16.0,
                          color: Colors.black87,
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.04,
            ),
            GlobalText(
              'Upload USPS Form 1583 :',
              fontSize: Get.height * 0.03,
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Container(
                padding: EdgeInsets.only(top: Get.height * 0.03),
                height: Get.height * 0.30,
                width: Get.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: MyColor.black,
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Obx(() => customerAddView.image.value == null
                        ? Image.asset(
                            AddImage.uploadIcon,
                            height: Get.height * 0.05,
                          )
                        : Stack(
                            children: [
                              Image.file(
                                File(customerAddView.image.value?.path
                                        .toString() ??
                                    ''),
                                fit: BoxFit.cover,
                                height: Get.height * 0.13,
                                width: Get.width * 0.45,
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: InkWell(
                                  onTap: () {
                                    customerAddView.image.value =
                                        null; // Remove the image
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    GlobalText('Drag & Drop background image(s)'),
                    GlobalText('or'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            customerAddView.pickImage();
                          },
                          child: GlobalText("Choose file(s)"),
                        ),
                        SizedBox(
                          width: Get.width * 0.01,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            String originalString =
                                customerAddView.image.toString();

                            RegExp regExp = RegExp(r'^File:\s*');
                            originalString =
                                originalString.replaceFirst(regExp, '');
                            String cleanedString =
                                originalString.replaceAll("'", "").trim();
                            log('image==> ${File(cleanedString)},${customerAddView.propertyModel.value?.data?.id?.toString() ?? ''}');

                            await uploadUspsFile(
                                File(cleanedString),
                                customerAddView.propertyModel.value?.data?.id
                                        ?.toString() ??
                                    '');
                          },
                          child: const GlobalText("upload"),
                        ),
                      ],
                    ),
                  ],
                )),
            SizedBox(
              height: Get.height * 0.003,
            ),
            Obx(() {
              String originalString =
                  customerAddView.image.value?.toString() ?? '';
              RegExp regExp = RegExp(r'^File:\s*');
              originalString = originalString.replaceFirst(regExp, '');
              String cleanedString = originalString.replaceAll("'", "").trim();

              String imageName = '';

              if (cleanedString.isNotEmpty) {
                List<String> pathSegments = cleanedString.split('/');
                if (pathSegments.length >= 2) {
                  imageName = pathSegments[pathSegments.length - 2] +
                      '/' +
                      pathSegments.last;
                } else if (pathSegments.isNotEmpty) {
                  imageName = pathSegments.last;
                }
              }

              log('imageViewpath==> $imageName,');

              return GlobalText(
                customerAddView.image.value == null ? '' : imageName,
                fontWeight: FontWeight.bold,
              );
            }),
            SizedBox(
              height: Get.height * 0.003,
            ),
            Obx(() => customerAddView.image.value == null
                ? SizedBox(
                    height: Get.height * 0.05,
                    width: Get.width * 0.15,
                  )
                : Container(
                    height: Get.height * 0.05,
                    width: Get.width * 0.15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: MyColor.yellowGold, width: 2.0),
                    ),
                    child: InkWell(
                        onTap: () {
                          if (customerAddView.image.value != null) {
                            Get.dialog(
                              Dialog(
                                backgroundColor: Colors.transparent,
                                child: Container(
                                  width: Get.width,
                                  height: Get.height,
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: Image.file(
                                          customerAddView.image.value!,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      Positioned(
                                        top: 20,
                                        right: 20,
                                        child: IconButton(
                                          icon: Icon(Icons.close,
                                              color: Colors.white),
                                          onPressed: () {
                                            Get.back();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          } else {
                            Get.snackbar("Error", "No image selected.");
                          }
                        },
                        child: Icon(Icons.remove_red_eye_sharp)),
                  ))
          ],
        ),
      ),
    );
  }
}
