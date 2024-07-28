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
      content: Column(
        children: [
          TextField(
            decoration: InputDecoration(hintText: 'Shipment Name'),
            onChanged: (value) {
              customerAddModel.shipmentName.value = value;
            },
          ),
          TextField(
            decoration: InputDecoration(hintText: 'Shipment Number'),
            onChanged: (value) {
              customerAddModel.shipmentNumber.value = value;
            },
          ),
          TextField(
            decoration: InputDecoration(hintText: 'Shipment Date'),
            onChanged: (value) {
              customerAddModel.shipmentDate.value = value;
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          child: Text('Cancel'),
          onPressed: () {
            Get.back();
          },
        ),
        TextButton(
          child: Text('Submit'),
          onPressed: () {
            // Handle the submission of the form
            print('Shipment Name: ${customerAddModel.shipmentName.value}');
            print('Shipment Number: ${customerAddModel.shipmentNumber.value}');
            print('Shipment Date: ${customerAddModel.shipmentDate.value}');
            Get.back();
          },
        ),
      ],
    );
  }
}
