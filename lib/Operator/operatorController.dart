import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twentyfourby_seven/models/OperatorModel.dart';

import '../Service/api.dart';

class OperatorController extends GetxController {
  Rx<OperatorModel> operatorView = OperatorModel().obs;

  Future<void> getOperatorList() async {
    operatorView.value = await getOperatorApi() ?? operatorView.value;
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
            TextField(
              controller: businessNameController,
              decoration: InputDecoration(
                  labelText: 'Business Name', border: OutlineInputBorder()),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            TextField(
              controller: countryController,
              decoration: InputDecoration(
                  labelText: 'Country', border: OutlineInputBorder()),
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
    super.onInit();
  }
}
