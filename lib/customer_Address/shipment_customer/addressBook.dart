import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twentyfourby_seven/Service/api.dart';
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
              const GlobalText(
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
                  child: shipmentData.shipment.value?.data?.length == null
                      ? Center(
                          child: CircularProgressIndicator(
                          color: MyColor.brightBlue,
                        ))
                      : ListView.builder(
                          itemCount: shipmentData.shipment.value?.data?.length,
                          itemBuilder: (_, idx) => SizedBox(
                                height: Get.height * 0.15,
                                child: Card(
                                  color: Colors.grey.shade200,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              Get.defaultPopGesture;
                                              shipmentData.shipment.value?.data
                                                  ?.remove(idx);
                                              shipmentData.shipment.value?.data
                                                  ?.remove(shipmentData.shipment
                                                      .value?.data?[idx].id);
                                              shipmentData.update();
                                            },
                                            icon: Icon(Icons.delete),
                                            color: MyColor.brightBlue,
                                          )
                                        ],
                                      ),
                                      GlobalText(
                                        shipmentData
                                                .shipment.value?.data?[idx].name
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                            shipmentData.shipment.value
                                                    ?.data?[idx].postalCode
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
      content: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: Get.height * 0.85,
          ),
          child: IntrinsicHeight(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: TextField(
                      controller: shipmentData.nameController,
                      decoration: InputDecoration(
                        hintText: 'Shipment Name',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) =>
                          shipmentData.shipmentName.value = value,
                    ),
                  ),

                  // Company Name
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextField(
                      controller: shipmentData.companyController,
                      decoration: InputDecoration(
                        hintText: 'Company Name (optional)',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) =>
                          shipmentData.shipmentNumber.value = value,
                    ),
                  ),

                  // Address Line 1
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextField(
                      controller: shipmentData.addLineOneController,
                      decoration: InputDecoration(
                        hintText: 'Address Line One',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) =>
                          shipmentData.shipmentDate.value = value,
                    ),
                  ),

                  // Address Line 2
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextField(
                      controller: shipmentData.addLineTwoController,
                      decoration: InputDecoration(
                        hintText: 'Address Line 2 (optional)',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) =>
                          shipmentData.shipmentDate.value = value,
                    ),
                  ),

                  // Country Dropdown
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Obx(
                      () => DropdownButton<String>(
                        isExpanded: true,
                        hint: GlobalText('Select a Country'),
                        value: shipmentData.selectedCountry.value,
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
                  ),

                  // State Dropdown
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Obx(
                      () => DropdownButton<String>(
                        isExpanded: true,
                        hint: GlobalText('Select a State'),
                        value: shipmentData.selectedState.value,
                        onChanged: (String? newValue) =>
                            shipmentData.selectedState.value = newValue,
                        items: shipmentData.states
                            .toSet()
                            .map<DropdownMenuItem<String>>((state) {
                          return DropdownMenuItem<String>(
                            value: state,
                            child: GlobalText(state),
                          );
                        }).toList(),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Obx(
                      () => DropdownButton<String>(
                        isExpanded: true,
                        hint: GlobalText('Select a City'),
                        value: shipmentData.selectedCity.value,
                        onChanged: (String? newValue) {
                          shipmentData.selectedCity.value = newValue;
                        },
                        items: shipmentData.cities
                            .toSet()
                            .map<DropdownMenuItem<String>>((city) {
                          return DropdownMenuItem<String>(
                            value: city,
                            child: GlobalText(city),
                          );
                        }).toList(),
                      ),
                    ),
                  ),

                  // Postal Code
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextField(
                      controller: shipmentData.postolController,
                      decoration: InputDecoration(
                        hintText: 'Postal Code',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) =>
                          shipmentData.shipmentDate.value = value,
                    ),
                  ),

                  // Phone Number
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextField(
                      controller: shipmentData.phoneController,
                      decoration: InputDecoration(
                        hintText: 'Phone Number',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) =>
                          shipmentData.shipmentDate.value = value,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          child: GlobalText('Cancel'),
          onPressed: () {
            Get.back();
          },
        ),
        ElevatedButton(
          child: GlobalText('Add'),
          onPressed: () {
            submitShippingAddress();
          },
        ),
      ],
    );
  }
}
