import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twentyfourby_seven/Utils/Mycolor.dart';
import 'package:twentyfourby_seven/Utils/SharedPrefrance.dart';
import 'package:twentyfourby_seven/Utils/globalText.dart';

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
                Icon(Icons.manage_accounts),
              ],
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Mail Id or Sender',
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
