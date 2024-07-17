import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerController extends GetxController {
  String? selectedUserType;
  final RxString? selectedOption =
      'Option 1'.obs; // Using RxString for reactive state

  void selectOption(String option) {
    selectedOption?.value = option;
  }

  final List<Map<String, dynamic>> listUserType = [
    {'name': 'index', 'value': 'in', 'icon': Icons.person},
    {'name': 'Settings', 'value': 'company', 'icon': Icons.business},
    {'name': 'logout', 'value': 'logout', 'icon': Icons.logout},
  ];
}
