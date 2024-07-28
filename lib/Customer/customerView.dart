import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:twentyfourby_seven/Utils/Mycolor.dart';
import 'package:twentyfourby_seven/Utils/SharedPrefrance.dart';
import 'package:twentyfourby_seven/Utils/globalText.dart';
import 'package:twentyfourby_seven/customer_Address/customer_add.dart';

import '../Utils/commonDialog.dart';
import '../models/customerMailModel.dart';
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
                  onTap: () {
                    log('value ${userType['value']}');
                    if (userType['value'] == 'settings') {
                      Get.to(() => CustomerAdd());
                    }
                  },
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
                const Icon(Icons.manage_accounts),
              ],
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(Get.height * 0.020),
            child: TextField(
              controller: customerController.searchController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search Mail Id or Sender',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              ),
              onChanged: (value) {
                customerController.filterList();
                //value = customerController.searchController.value.toString();
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(Get.height * 0.010),
            child: TextField(
              controller: customerController.dateRangeController,
              decoration: InputDecoration(
                  icon: Icon(Icons.calendar_today),
                  hintText: 'Select Date Range',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
              readOnly: true,
              onTap: () => _selectDateRange(context),
            ),
          ),
          Container(
              height: Get.height * 0.5,
              width: Get.width,
              child: Obx(
                () => customerController.customerModel.value.data?.length ==
                        null
                    ? const Center(
                        child: CircularProgressIndicator(
                        color: MyColor.colorBlueHome,
                      ))
                    : ListView.builder(
                        itemCount:
                            customerController.customerModel.value.data?.length,
                        itemBuilder: (_, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              customerController.customerModel.value
                                          .data?[index].markAsRead ==
                                      true
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Obx(() => Checkbox(
                                                value: customerController
                                                    .isMailChecked.value,
                                                onChanged: (bool? value) {
                                                  customerController
                                                      .isMailChecked
                                                      .value = value!;
                                                })),
                                            Row(
                                              children: [
                                                Icon(Icons.open_in_new_rounded),
                                                GlobalText(
                                                  'Open and Scan',
                                                  onTap: () {
                                                    Get.dialog(CommonDialog(
                                                        title: 'Open and Scan',
                                                        content:
                                                            GlobalText('')));
                                                  },
                                                ),
                                                /*GlobalText(
                                              customerController
                                                      .customerModel
                                                      .value
                                                      .data?[index]
                                                      .openScan
                                                      .toString() ??
                                                  '',
                                              fontWeight: FontWeight.w700,
                                            ),*/
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons
                                                    .local_shipping_outlined),
                                                GlobalText(
                                                  'Add to Shipment',
                                                  onTap: () {
                                                    Get.dialog(CommonDialog(
                                                      title: 'Add to Shipment',
                                                      content: GlobalText(''),
                                                    ));
                                                  },
                                                ),
                                                /* GlobalText(
                                              customerController
                                                      .customerModel
                                                      .value
                                                      .data?[index]
                                                      .shipmentStatus
                                                      .toString() ??
                                                  '',
                                            ),*/
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons.recycling),
                                                GlobalText(
                                                  'Recycle',
                                                  onTap: () {
                                                    Get.dialog(CommonDialog(
                                                        title: 'Recycle',
                                                        content:
                                                            GlobalText('')));
                                                  },
                                                ),
                                                /* GlobalText(
                                              customerController.customerModel.value
                                                      .data?[index].recycle
                                                      .toString() ??
                                                  '',
                                            ),*/
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.share),
                                                GlobalText(
                                                  'shared',
                                                  onTap: () {
                                                    Get.dialog(CommonDialog(
                                                        title: 'shared',
                                                        content:
                                                            GlobalText('')));
                                                  },
                                                ),
                                                /* GlobalText(
                                              customerController
                                                      .customerModel
                                                      .value
                                                      .data?[index]
                                                      .shred
                                                      .toString() ??
                                                  '',
                                            ),*/
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons.adf_scanner_sharp),
                                                GlobalText(
                                                  'Rescan',
                                                  onTap: () {
                                                    Get.dialog(CommonDialog(
                                                        title: 'Rescan',
                                                        content:
                                                            GlobalText('')));
                                                  },
                                                ),
                                                /* GlobalText(
                                              customerController
                                                      .customerModel
                                                      .value
                                                      .data?[index]
                                                      .rescan
                                                      .toString() ??
                                                  '',
                                            ),*/
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons
                                                    .local_shipping_rounded),
                                                GlobalText(
                                                  'Pick UP',
                                                  onTap: () {
                                                    Get.dialog(CommonDialog(
                                                        title: 'Pick UP',
                                                        content:
                                                            GlobalText('')));
                                                  },
                                                ),
                                                /* GlobalText(
                                              customerController
                                                      .customerModel
                                                      .value
                                                      .data?[index]
                                                      .pickupStatus
                                                      .toString() ??
                                                  '',
                                            ),*/
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  : SizedBox(),
                              Card(
                                color: MyColor.cardIconColor,
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Checkbox(
                                            value: customerController
                                                .customerModel
                                                .value
                                                .data?[index]
                                                .markAsRead,
                                            onChanged: (bool? value) {
                                              customerController
                                                      .customerModel
                                                      .value
                                                      .data?[index]
                                                      .markAsRead !=
                                                  value;
                                            }),
                                        GlobalText(
                                          customerController.customerModel.value
                                                  .data?[index].mailId?.mailType
                                                  .toString() ??
                                              '',
                                          fontWeight: FontWeight.w700,
                                          color: MyColor.black,
                                        ),
                                        GlobalText(
                                          customerController.customerModel.value
                                                  .data?[index].currentStatus
                                                  .toString() ??
                                              '',
                                          color: MyColor.black,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        GlobalText(
                                          customerController.customerModel.value
                                                      .data?[index].createdAt !=
                                                  null
                                              ? DateFormat('dd-MM-yyyy').format(
                                                  DateTime.parse(
                                                      customerController
                                                              .customerModel
                                                              .value
                                                              .data?[index]
                                                              .createdAt ??
                                                          ''))
                                              : '',
                                          fontWeight: FontWeight.w700,
                                          color: MyColor.black,
                                        ),
                                        Container(
                                          height: Get.height * 0.07,
                                          width: Get.width * 0.25,
                                          child: customerController
                                                      .customerModel
                                                      .value
                                                      .data
                                                      ?.length ==
                                                  null
                                              ? Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                  color: MyColor.colorBlueHome,
                                                ))
                                              : ListView.builder(
                                                  itemCount: customerController
                                                          .customerModel
                                                          .value
                                                          .data
                                                          ?.length ??
                                                      0,
                                                  itemBuilder:
                                                      (context, index) {
                                                    String baseUrl =
                                                        'https://service.24x7mail.com/uploads/';
                                                    String imagePath =
                                                        customerController
                                                                .customerModel
                                                                .value
                                                                .data?[index]
                                                                .mailId
                                                                ?.measurement?[
                                                                    0]
                                                                .file ??
                                                            '';
                                                    String imageUrl =
                                                        baseUrl + imagePath;

                                                    return Container(
                                                      height: Get.height * 0.07,
                                                      width: Get.width * 0.25,
                                                      child: GestureDetector(
                                                        onTap: () async {
                                                          //await getshipment();
                                                          _showImageDialog(
                                                              context,
                                                              customerController
                                                                  .customerModel
                                                                  .value
                                                                  .data?[index]
                                                                  .mailId
                                                                  ?.measurement,
                                                              index);
                                                        },
                                                        child: Card(
                                                          child: Image.network(
                                                            imageUrl,
                                                            fit: BoxFit.cover,
                                                            height: Get.height *
                                                                0.03,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                        ),
                                        GlobalText(
                                          customerController
                                                  .customerModel
                                                  .value
                                                  .data?[index]
                                                  .mailId
                                                  ?.mailBoxId
                                                  .toString() ??
                                              '',
                                          fontWeight: FontWeight.w700,
                                          color: MyColor.black,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: Get.height * 0.004,
                              )
                            ],
                          );
                        }),
              )),
        ],
      ),
    );
  }

  Future<void> _selectDateRange(BuildContext context) async {
    DateTime? pickedFromDate = await showDatePicker(
      context: context,
      initialDate: customerController.fromDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedFromDate != null) {
      DateTime? pickedToDate = await showDatePicker(
        context: context,
        initialDate: pickedFromDate.add(Duration(days: 1)),
        firstDate: pickedFromDate,
        lastDate: DateTime(2101),
      );

      if (pickedToDate != null) {
        customerController.fromDate = pickedFromDate;
        customerController.toDate = pickedToDate;
        customerController.dateRangeController.text =
            "${customerController.fromDate!.day}-${customerController.fromDate!.month}-${customerController.fromDate!.year} => ${customerController.toDate!.day}-${customerController.toDate!.month}-${customerController.toDate!.year}";
      }
    }
  }

  void _showImageDialog(
      BuildContext context, List<Measurement>? images, int index) {
    if (images == null || images.isEmpty) return;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GlobalText(
                'You have received new mail',
                fontWeight: FontWeight.w700,
              ),
              GlobalText(
                  '${customerController.customerModel.value.data?[index].mailId?.mailType}'),
            ],
          ),
          content: Container(
            height: Get.height * 0.35,
            width: Get.width * 0.75,
            child: Scrollbar(
              controller: customerController.scrollController,
              child: ListView.builder(
                controller: customerController.scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                itemBuilder: (context, inx) {
                  String baseUrl = 'https://service.24x7mail.com/uploads/';
                  String imagePath = images[inx].file ?? '';
                  String imageUrl = baseUrl + imagePath;
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(Get.height * 0.02),
                        child: Image.network(
                          imageUrl,
                          height: Get.height * 0.25,
                          width: Get.width * 0.75,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          actions: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: GlobalText(
                    'Information',
                    fontWeight: FontWeight.w700,
                    fontSize: Get.height * 0.034,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.002,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        GlobalText(
                          'Sender :',
                          fontWeight: FontWeight.w700,
                        ),
                        GlobalText(customerController.customerModel.value
                                .data?[index].mailId?.mailType
                                .toString() ??
                            ''),
                      ],
                    ),
                    Row(
                      children: [
                        GlobalText(
                          'Mail ID :',
                          fontWeight: FontWeight.w700,
                        ),
                        GlobalText(customerController.customerModel.value
                                .data?[index].mailId?.mailBoxId
                                .toString() ??
                            ''),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        GlobalText(
                          'Received :',
                          fontWeight: FontWeight.w700,
                        ),
                        GlobalText(
                          customerController.customerModel.value.data?[index]
                                      .updatedAt !=
                                  null
                              ? DateFormat('dd-MM-yyyy').format(DateTime.parse(
                                  customerController.customerModel.value
                                          .data?[index].updatedAt ??
                                      ''))
                              : '',
                          fontWeight: FontWeight.w700,
                          color: MyColor.black,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: Get.width * 0.05,
                    ),
                    Row(
                      children: [
                        GlobalText(
                          'Weight:',
                          fontWeight: FontWeight.w700,
                        ),
                        GlobalText(
                            images[index].weight?.toDouble().toString() ?? ""),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: GlobalText(
                    'History',
                    fontWeight: FontWeight.w700,
                    fontSize: Get.height * 0.034,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.001,
                ),
                Container(
                  height: Get.height * 0.05,
                  width: Get.width,
                  child: ListView.builder(
                      itemCount: customerController
                          .customerModel.value.data?[index].mailHistory?.length,
                      itemBuilder: (context, ind) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GlobalText(customerController
                                        .customerModel
                                        .value
                                        .data?[index]
                                        .mailHistory?[ind]
                                        .createdAt !=
                                    null
                                ? DateFormat('dd-MM-yyyy').format(
                                    DateTime.parse(customerController
                                            .customerModel
                                            .value
                                            .data?[index]
                                            .mailHistory?[ind]
                                            .createdAt ??
                                        ''))
                                : ''),
                            GlobalText(customerController.customerModel.value
                                    .data?[index].mailHistory?[ind].status
                                    .toString() ??
                                ''),
                            GlobalText(customerController
                                        .customerModel
                                        .value
                                        .data?[index]
                                        .mailHistory?[ind]
                                        .createdAt !=
                                    null
                                ? DateFormat('hh:mm a').format(DateTime.parse(
                                    customerController
                                            .customerModel
                                            .value
                                            .data?[index]
                                            .mailHistory?[ind]
                                            .createdAt ??
                                        ''))
                                : ''),
                          ],
                        );
                      }),
                ),
              ],
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            TextButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(MyColor.softBlue)),
              child: GlobalText('Close'),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }
}
