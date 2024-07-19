import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twentyfourby_seven/models/customerMailModel.dart';

import '../Service/api.dart';
import '../Utils/SharedPrefrance.dart';

class CustomerController extends GetxController {
  String? selectedUserType;
  DateTime? fromDate;
  DateTime? toDate;
  var isMailChecked = false.obs;
  final RxString? selectedOption = 'Option 1'.obs;
  TextEditingController dateRangeController = TextEditingController();
  Rx<CustomerMailModel> customerModel = CustomerMailModel().obs;
  @override
  void onInit() {
    getCustomerDetails();
    super.onInit();
  }

  void selectOption(String option) {
    selectedOption?.value = option;
  }

  Future<void> getCustomerDetails() async {
    var userID = SharedPrefs.getString('cID');
    log('userID==>$userID');
    customerModel.value = (await getCustomerApi())!;
  }

  final List<Map<String, dynamic>> listUserType = [
    {'name': 'index', 'value': 'index', 'icon': Icons.mail},
    {'name': 'Settings', 'value': 'settings', 'icon': Icons.settings},
    {'name': 'logout', 'value': 'logout', 'icon': Icons.logout},
  ];
}
