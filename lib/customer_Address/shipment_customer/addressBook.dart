import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twentyfourby_seven/Utils/Mycolor.dart';
import 'package:twentyfourby_seven/Utils/globalText.dart';
import 'package:twentyfourby_seven/customer_Address/shipment_customer/shipmentController.dart';

class AddressBook extends StatelessWidget {
  AddressBook({super.key});

  var shipmentData = Get.put(ShipmentController());

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
            ),
            Obx(() => Flexible(
                  child: ListView.builder(
                      itemCount: shipmentData.shipment.value?.data?.length,
                      itemBuilder: (_, idx) => SizedBox(
                            height: Get.height * 0.15,
                            child: Card(
                              color: Colors.grey.shade200,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          shipmentData.shipment.value?.data
                                              ?.remove(shipmentData.shipment
                                                  .value?.data?[idx].id);
                                        },
                                        icon: Icon(Icons.delete),
                                        color: MyColor.brightBlue,
                                      ),
                                    ],
                                  ),
                                  GlobalText(
                                    shipmentData.shipment.value?.data?[idx].name
                                            .toString()
                                            .capitalizeFirst ??
                                        '',
                                    fontWeight: FontWeight.bold,
                                    fontSize: Get.height * 0.02,
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.005,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GlobalText(
                                        '${shipmentData.shipment.value?.data?[idx].address1.toString().capitalizeFirst ?? ''},',
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.002,
                                      ),
                                      GlobalText(
                                        '${shipmentData.shipment.value?.data?[idx].city?.name.toString() ?? ''},',
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.002,
                                      ),
                                      GlobalText(
                                        '${shipmentData.shipment.value?.data?[idx].state?.name.toString() ?? ''},',
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.002,
                                      ),
                                      GlobalText(
                                        shipmentData.shipment.value?.data?[idx]
                                                .postalCode
                                                .toString() ??
                                            '',
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.005,
                                  ),
                                  GlobalText(
                                    shipmentData.shipment.value?.data?[idx]
                                            .country?.name
                                            .toString() ??
                                        '',
                                  ),
                                ],
                              ),
                            ),
                          )),
                )),
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
            TextField(
              controller: shipmentData.nameController,
              decoration: InputDecoration(
                  hintText: 'Shipment Name', border: OutlineInputBorder()),
              onChanged: (value) => shipmentData.shipmentName.value = value,
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            TextField(
              controller: shipmentData.companyController,
              decoration: const InputDecoration(
                  hintText: 'Company Name(optional)',
                  border: OutlineInputBorder()),
              onChanged: (value) {
                shipmentData.shipmentNumber.value = value;
              },
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            TextField(
              controller: shipmentData.addLineOneController,
              decoration: const InputDecoration(
                  hintText: 'AddressLine One', border: OutlineInputBorder()),
              onChanged: (value) {
                shipmentData.shipmentDate.value = value;
              },
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            TextField(
              controller: shipmentData.addLineTwoController,
              decoration: InputDecoration(
                  hintText: 'AddressLine2(optional) ',
                  border: OutlineInputBorder()),
              onChanged: (value) => shipmentData.shipmentDate.value = value,
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Obx(
              () => DropdownButton<String>(
                hint: GlobalText('Select a Country'),
                value: shipmentData.countries.value.first,
                onChanged: (String? newValue) =>
                    shipmentData.selectedCountry.value = newValue,
                items: shipmentData.countries
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
                  value: shipmentData.selectedState.value,
                  onChanged: (String? newValue) =>
                      shipmentData.selectedState.value = newValue,
                  items: shipmentData.states
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
                value: shipmentData.selectedCountry.value,
                onChanged: (String? newValue) {
                  shipmentData.selectedCountry.value = newValue;
                },
                items: shipmentData.countries
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
              controller: shipmentData.postolController,
              decoration: InputDecoration(
                  hintText: 'AddressLine One', border: OutlineInputBorder()),
              onChanged: (value) => shipmentData.shipmentDate.value = value,
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            TextField(
              controller: shipmentData.phoneController,
              decoration: const InputDecoration(
                  hintText: 'AddressLine One', border: OutlineInputBorder()),
              onChanged: (value) {
                shipmentData.shipmentDate.value = value;
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
