import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twentyfourby_seven/Utils/Mycolor.dart';
import 'package:twentyfourby_seven/Utils/globalText.dart';

import 'customer_AddController.dart';

class AddressBook extends StatelessWidget {
  AddressBook({super.key});

  var customerAddModel = Get.put(CustomerAddController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Icon(Icons.add_home_rounded),
              SizedBox(
                width: Get.width * 0.02,
              ),
              GlobalText(
                'Address Book',
                fontWeight: FontWeight.w700,
                color: MyColor.colorRedHome,
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: _showFormDialog,
                    child: const GlobalText('+ Add shipping Address'))
              ],
            )
          ],
        ));
  }

  void _showFormDialog() async {
    return Get.defaultDialog(
      title: 'Add Shipment',
      content: Container(
        margin: EdgeInsets.all(10),
        color: Colors.white24,
        height: Get.height * 0.65,
        width: Get.width * 0.95,
        child: ListView(
          children: [
            Divider(
              color: MyColor.yellowGold,
              thickness: Get.width * 0.02,
            ),
            TextField(
              controller: customerAddModel.nameController,
              decoration: const InputDecoration(
                  hintText: 'Shipment Name', border: OutlineInputBorder()),
              onChanged: (value) => customerAddModel.shipmentName.value = value,
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            TextField(
              controller: customerAddModel.companyController,
              decoration: const InputDecoration(
                  hintText: 'Company Name(optional)',
                  border: OutlineInputBorder()),
              onChanged: (value) {
                customerAddModel.shipmentNumber.value = value;
              },
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            TextField(
              controller: customerAddModel.addLineOneController,
              decoration: InputDecoration(
                  hintText: 'AddressLine One', border: OutlineInputBorder()),
              onChanged: (value) {
                customerAddModel.shipmentDate.value = value;
              },
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            TextField(
              controller: customerAddModel.addLineTwoController,
              decoration: InputDecoration(
                  hintText: 'AddressLine2(optional) ',
                  border: OutlineInputBorder()),
              onChanged: (value) => customerAddModel.shipmentDate.value = value,
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Obx(
              () => DropdownButton<String>(
                hint: GlobalText('Select a Country'),
                value: customerAddModel.countries.value.first,
                onChanged: (String? newValue) =>
                    customerAddModel.selectedCountry.value = newValue,
                items: customerAddModel.countries
                    .map<DropdownMenuItem<String>>((country) {
                  return DropdownMenuItem<String>(
                    value: country,
                    child: GlobalText(country),
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              width: Get.width * 0.05,
            ),
            Obx(
              () => Container(
                width: Get.width * 0.23,
                child: DropdownButton<String>(
                  hint: GlobalText('Select a State'),
                  value: customerAddModel.selectedState.value,
                  onChanged: (String? newValue) =>
                      customerAddModel.selectedState.value = newValue,
                  items: customerAddModel.states
                      .map<DropdownMenuItem<String>>((state) {
                    return DropdownMenuItem<String>(
                      value: state,
                      child: GlobalText(state),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.015),
            Obx(
              () => DropdownButton<String>(
                hint: GlobalText('Select a city'),
                value: customerAddModel.selectedCountry.value,
                onChanged: (String? newValue) {
                  customerAddModel.selectedCountry.value = newValue;
                },
                items: customerAddModel.countries
                    .map<DropdownMenuItem<String>>((country) {
                  return DropdownMenuItem<String>(
                    value: country,
                    child: GlobalText(country),
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              width: Get.width * 0.05,
            ),
            TextField(
              controller: customerAddModel.postolController,
              decoration: InputDecoration(
                  hintText: 'AddressLine One', border: OutlineInputBorder()),
              onChanged: (value) => customerAddModel.shipmentDate.value = value,
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            TextField(
              controller: customerAddModel.phoneController,
              decoration: InputDecoration(
                  hintText: 'AddressLine One', border: OutlineInputBorder()),
              onChanged: (value) {
                customerAddModel.shipmentDate.value = value;
              },
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: Text('Cancel'),
          onPressed: () {
            Get.back();
          },
        ),
        TextButton(
          child: Text('ADD'),
          onPressed: () {
            Get.back();
          },
        ),
      ],
    );
  }
}
