import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twentyfourby_seven/Utils/Mycolor.dart';
import 'package:twentyfourby_seven/Utils/SharedPrefrance.dart';
import 'package:twentyfourby_seven/Utils/globalText.dart';
import 'package:twentyfourby_seven/customer_Address/customer_add.dart';

import 'customerController.dart';
import 'customerDrawer.dart';

class CustomerView extends StatelessWidget {
  CustomerView({super.key});
  final customerController = Get.put(CustomerController());

  @override
  Widget build(BuildContext context) {
    var firstName = SharedPrefs.getString('firstNAme');
    var lastName = SharedPrefs.getString('lastNAme');
    return Scaffold(
      drawer: Drawer(
        child: CustomerDrawer(),
      ),
      appBar: AppBar(
        backgroundColor: MyColor.yellowGold,
        actions: [
          PopupMenuButton<String>(
            onSelected: (String newValue) {
              customerController.selectedUserType = newValue;
            },
            itemBuilder: (BuildContext context) {
              return customerController.listUserType.map((userType) {
                return PopupMenuItem<String>(
                  value: userType['value'],
                  onTap: () {
                    log('value ${userType['value']}');
                    if (userType['value'] == 'settings') {
                      Get.to(() => CustomerAdd());
                    }
                  },
                  child: Row(
                    children: [
                      Icon(userType['icon']),
                      const SizedBox(width: 8),
                      Text(userType['name']),
                    ],
                  ),
                );
              }).toList();
            },
            child: Row(
              children: [
                GlobalText('$firstName $lastName'),
                const Icon(Icons.manage_accounts),
              ],
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(Get.height * 0.025),
            child: const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search Mail Id or Sender',
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(Get.height * 0.015),
            child: TextField(
              controller: customerController.dateRangeController,
              decoration: const InputDecoration(
                  icon: Icon(Icons.calendar_today),
                  hintText: 'Select Date Range',
                  border: OutlineInputBorder()),
              readOnly: true,
              onTap: () => _selectDateRange(context),
            ),
          ),
          Container(
              height: Get.height * 0.5,
              width: Get.width,
              child: Obx(
                () => ListView.builder(
                    itemCount:
                        customerController.customerModel.value.data?.length,
                    itemBuilder: (_, index) => Card(
                            child: Row(
                          children: [
                            Obx(() => Checkbox(
                                value: customerController.customerModel.value
                                    .data?[index].markAsRead,
                                onChanged: (bool? value) {
                                  customerController.customerModel.value
                                          .data?[index].markAsRead !=
                                      value;
                                })),
                            Column(
                              children: [
                                GlobalText(
                                  customerController.customerModel.value
                                          .data?[index].mailId?.mailType
                                          .toString() ??
                                      '',
                                  color: MyColor.black,
                                ),
                                GlobalText(
                                  customerController.customerModel.value
                                          .data?[index].currentStatus
                                          .toString() ??
                                      '',
                                  color: MyColor.black,
                                ),
                              ],
                            ),
                            GlobalText(
                              customerController.customerModel.value
                                      .data?[index].createdAt
                                      .toString() ??
                                  '',
                              color: MyColor.black,
                            ),
                            GlobalText(
                              customerController.customerModel.value
                                      .data?[index].mailId?.mailBoxId
                                      .toString() ??
                                  '',
                              color: MyColor.yellowGold,
                            ),
                          ],
                        ))),
              )),
        ],
      ),
    );
  }

  Future<void> _selectDateRange(BuildContext context) async {
    DateTime? pickedFromDate = await showDatePicker(
      context: context,
      initialDate: customerController.fromDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedFromDate != null) {
      DateTime? pickedToDate = await showDatePicker(
        context: context,
        initialDate: pickedFromDate.add(Duration(days: 1)),
        firstDate: pickedFromDate,
        lastDate: DateTime(2101),
      );

      if (pickedToDate != null) {
        customerController.fromDate = pickedFromDate;
        customerController.toDate = pickedToDate;
        customerController.dateRangeController.text =
            "${customerController.fromDate!.day}-${customerController.fromDate!.month}-${customerController.fromDate!.year} => ${customerController.toDate!.day}-${customerController.toDate!.month}-${customerController.toDate!.year}";
      }
    }
  }
}
