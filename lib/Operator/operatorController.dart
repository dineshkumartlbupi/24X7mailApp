import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twentyfourby_seven/models/OperatorModel.dart';

import '../Service/api.dart';
import '../models/operatorHomeModel.dart';

class OperatorController extends GetxController {
  Rx<OperatorModel> operatorView = OperatorModel().obs;
  Rx<OperatorHomeModel> operatorHome = OperatorHomeModel().obs;
  var selectedValue = 'All'.obs;
  String? _selectedCountry;
  List<dynamic> countries = [].obs;

  void updateValue(String newValue) {
    selectedValue.value = newValue;
  }

  Future<void> getOperatorList() async {
    operatorView.value = await getOperatorApi() ?? operatorView.value;
  }

  Future<void> getOperatorHome() async {
    operatorHome.value = (await getOperatorRequestApi()) ?? operatorHome.value;
  }

  void showAddOperatorDialog(BuildContext context) {
    final TextEditingController fNameController = TextEditingController();
    final TextEditingController lNameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController businessNameController =
        TextEditingController();
    final TextEditingController countryController = TextEditingController();
    final TextEditingController stateController = TextEditingController();
    final TextEditingController cityController = TextEditingController();
    final TextEditingController zipCodeController = TextEditingController();
    final TextEditingController businessAddressController =
        TextEditingController();

    Get.defaultDialog(
      title: 'Add Operator',
      content: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              controller: businessNameController,
              decoration: InputDecoration(
                  labelText: 'Business Name', border: OutlineInputBorder()),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: Get.width * 0.3,
                  child: TextField(
                    controller: fNameController,
                    decoration: InputDecoration(
                        labelText: 'First Name', border: OutlineInputBorder()),
                  ),
                ),
                Container(
                  width: Get.width * 0.3,
                  child: TextField(
                    controller: lNameController,
                    decoration: InputDecoration(
                        labelText: 'Last Name', border: OutlineInputBorder()),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                  labelText: 'Email', border: OutlineInputBorder()),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            DropdownButton<String>(
              hint: Text('Select a Country'),
              value: _selectedCountry,
              onChanged: (String? newValue) {
                _selectedCountry = newValue;
              },
              items: countries.map<DropdownMenuItem<String>>((country) {
                return DropdownMenuItem<String>(
                  value: country['name'],
                  child: Text(country['name']),
                );
              }).toList(),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            TextField(
              controller: stateController,
              decoration: InputDecoration(
                  labelText: 'State', border: OutlineInputBorder()),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            TextField(
              controller: cityController,
              decoration: InputDecoration(
                  labelText: 'City', border: OutlineInputBorder()),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            TextField(
              controller: zipCodeController,
              decoration: InputDecoration(
                  labelText: 'Zip Code', border: OutlineInputBorder()),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            TextField(
              controller: businessAddressController,
              decoration: InputDecoration(
                  labelText: 'Business Address', border: OutlineInputBorder()),
            ),
          ],
        ),
      ),
      textConfirm: 'Add',
      onConfirm: () {
        /*final newOperator = Operator(
          fName: fNameController.text,
          lName: lNameController.text,
          email: emailController.text,
          businessName: businessNameController.text,
          country: countryController.text,
          state: stateController.text,
          city: cityController.text,
          zipCode: zipCodeController.text,
          businessAddress: businessAddressController.text,
          createdAt: DateTime.now().toString(),
        );
        addOperator(newOperator);
        Get.back();*/ // Close the dialog
      },
      textCancel: 'Cancel',
      onCancel: () {},
    );
  }

  @override
  void onInit() {
    getOperatorList();
    getOperatorHome();
    super.onInit();
  }
}
