import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twentyfourby_seven/Utils/Mycolor.dart';

import '../Login/loginController.dart';
import '../Login/loginScreen.dart';
import '../Utils/SharedPrefrance.dart';
import '../Utils/globalText.dart';
import '../operator_settings/operator_setting_View.dart';
import 'OperatorDrawer.dart';
import 'custmerView_operator.dart';
import 'operatorController.dart';
import 'operator_report/operator_reports.dart';

class OperatorRequestHome extends StatelessWidget {
  OperatorRequestHome({super.key});
  var homeOperatorController = Get.find<OperatorController>();

  var firstName = SharedPrefs.getString('firstNameOp');
  var lastName = SharedPrefs.getString('lastNameOp');
  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    log('operator $firstName');
    log('fisry $lastName');
    return WillPopScope(
      onWillPop: () async {
        await SharedPrefs.remove('Token');
        loginController.rememberMe.value = false;
        loginController.emailController.clear();
        loginController.passwordController.clear();

        return true;
      },
      child: Scaffold(
        drawer: Drawer(
          child: OperatorDrawer(),
        ),
        appBar: AppBar(
          backgroundColor: MyColor.deepPurple,
          title: GlobalText(
            "Request",
            color: MyColor.white,
            fontWeight: FontWeight.w700,
            fontSize: Get.height * 0.03,
          ),
          actions: [
            PopupMenuButton<String>(
              onSelected: (String newValue) {
                homeOperatorController.selectedMenuValue.value = newValue;
              },
              itemBuilder: (BuildContext context) {
                return homeOperatorController.listUserType.map((userType) {
                  return PopupMenuItem<String>(
                    value: userType['value'],
                    onTap: () {
                      if (userType['value'] == 'settings') {
                        Get.to(() => OperatorSettingView());
                      } else if (userType['value'] == 'Customers') {
                        Get.to(() => OperatorCustomerView());
                      } else if (userType['value'] == 'Reports') {
                        Get.to(() => OperatorReports());
                      } else if (userType['value'] == 'logout') {
                        SharedPrefs.remove('Token');
                        SharedPrefs.clear();
                        loginController.rememberMe.value = false;
                        loginController.emailController.clear();
                        loginController.passwordController.clear();
                        Get.to(() => LoginScreen());
                      }
                    },
                    child: Row(
                      children: [
                        Icon(userType['icon']),
                        const SizedBox(width: 8),
                        GlobalText(userType['name']),
                      ],
                    ),
                  );
                }).toList();
              },
              child: Row(
                children: [
                  GlobalText(
                    '$firstName $lastName',
                    color: MyColor.white,
                  ),
                  const Icon(
                    Icons.manage_accounts,
                    color: MyColor.white,
                  ),
                ],
              ),
            )
          ],
        ),
        body: Obx(() {
          if (homeOperatorController.operatorHome.value.data == null) {
            return const Center(
                child: CircularProgressIndicator(
              color: MyColor.brightBlue,
            ));
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(child: Divider()),
                    GlobalText(
                      'By Operation',
                      fontWeight: FontWeight.w700,
                      fontSize: Get.height * 0.020,
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Row(
                  children: [
                    Icon(Icons.circle, size: 8), // Bullet point
                    SizedBox(width: 8),
                    GlobalText(
                      'Scan Request:',
                      fontSize: Get.height * 0.025,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(
                      width: Get.width * 0.02,
                    ),
                    CircleAvatar(
                      backgroundColor: MyColor.colorBlueHome,
                      child: GlobalText(
                          '${homeOperatorController.operatorHome.value.data?.scanRequest ?? 0}',
                          color: MyColor.white,
                          fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.circle, size: 8), // Bullet point
                    SizedBox(width: 8),
                    GlobalText(
                      'Rescan Request:',
                      fontSize: Get.height * 0.025,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(
                      width: Get.width * 0.02,
                    ),
                    CircleAvatar(
                      backgroundColor: MyColor.colorBlueHome,
                      child: GlobalText(
                          '${homeOperatorController.operatorHome.value.data?.rescanRequest ?? 0}',
                          color: MyColor.white,
                          fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.circle, size: 8), // Bullet point
                    SizedBox(width: 8),
                    GlobalText(
                      'Shred Request:',
                      fontSize: Get.height * 0.025,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(
                      width: Get.width * 0.02,
                    ),
                    CircleAvatar(
                      backgroundColor: MyColor.colorBlueHome,
                      child: GlobalText(
                          '${homeOperatorController.operatorHome.value.data?.shredRequest ?? 0}',
                          color: MyColor.white,
                          fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.circle, size: 8), // Bullet point
                    SizedBox(width: 8),
                    GlobalText(
                      'Recycle Request: ',
                      fontSize: Get.height * 0.025,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(
                      width: Get.width * 0.02,
                    ),
                    CircleAvatar(
                      backgroundColor: MyColor.colorBlueHome,
                      child: GlobalText(
                          '${homeOperatorController.operatorHome.value.data?.recycleRequest ?? 0}',
                          color: MyColor.white,
                          fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.circle, size: 8), // Bullet point
                    SizedBox(width: 8),
                    GlobalText(
                      'Forward Shipment:',
                      fontSize: Get.height * 0.025,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(
                      width: Get.width * 0.02,
                    ),
                    CircleAvatar(
                      backgroundColor: MyColor.colorBlueHome,
                      child: GlobalText(
                          ' ${homeOperatorController.operatorHome.value.data?.forwardShipment ?? 0}',
                          color: MyColor.white,
                          fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.circle, size: 8), // Bullet point
                    SizedBox(width: 8),
                    GlobalText(
                      'Local Pickup Request:',
                      fontSize: Get.height * 0.025,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(
                      width: Get.width * 0.02,
                    ),
                    CircleAvatar(
                      backgroundColor: MyColor.colorBlueHome,
                      child: GlobalText(
                          '${homeOperatorController.operatorHome.value.data?.localPickupRequest ?? 0}',
                          color: MyColor.white,
                          fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
