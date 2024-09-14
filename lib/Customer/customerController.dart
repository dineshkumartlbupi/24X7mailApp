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
  var isMailRead = false.obs;
  final RxString? selectedOption = 'Option 1'.obs;
  TextEditingController dateRangeController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  TextEditingController searchController = TextEditingController();
  Rx<CustomerMailModel> customerModel = CustomerMailModel().obs;
  Rx<CustomerMailModel> customerIndexMail = CustomerMailModel().obs;
  Rx<CustomerMailModel> readListData = CustomerMailModel().obs;
  Rx<CustomerMailModel> unreadListData = CustomerMailModel().obs;
  String? baseUrl;
  List<Data> filteredList = [];

  @override
  void onInit() {
    getCustomerDetails();
    getIndexDetails();
    getReadDetails();
    getUnReadDetails();
    super.onInit();
  }

  void selectOption(String option) {
    selectedOption?.value = option;
  }

  void filterList() {
    String query = searchController.text.toLowerCase();
    filteredList = customerModel.value.data?.where((item) {
          return item.mailId?.mailType?.toLowerCase().contains(query) ??
              false ||
                  item.mailId!.mailBoxId
                      .toString()
                      .toLowerCase()
                      .contains(query) ??
              false;
        }).toList() ??
        [];
  }

  Future<void> getCustomerDetails() async {
    var userID = SharedPrefs.getString('userId');
    log('customerId==>$userID');
    customerModel.value = (await getCustomerApi()) ?? customerModel.value;
  }

  Future<void> getIndexDetails() async {
    customerIndexMail.value =
        (await getViewIndexData(fromDate.toString(), toDate.toString())) ??
            customerIndexMail.value;
  }

  Future<void> getReadDetails() async {
    readListData.value =
        //await getReadList(fromDate.toString(), toDate.toString(), true);
        await getReadList(true);
  }

  Future<void> getUnReadDetails() async {
    unreadListData.value = await getReadList(false);
  }

  //final readListTrue = await getReadList('2024-01-01', '2024-01-31', true);
  //final readListFalse = await getReadList('2024-01-01', '2024-01-31', false);

  final List<Map<String, dynamic>> listUserType = [
    {'name': 'index', 'value': 'index', 'icon': Icons.mail},
    {'name': 'Settings', 'value': 'settings', 'icon': Icons.settings},
    {'name': 'logout', 'value': 'logout', 'icon': Icons.logout},
  ];
}
