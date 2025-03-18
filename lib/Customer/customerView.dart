import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:twentyfourby_seven/Login/loginController.dart';
import 'package:twentyfourby_seven/Utils/Mycolor.dart';
import 'package:twentyfourby_seven/Utils/SharedPrefrance.dart';
import 'package:twentyfourby_seven/Utils/globalText.dart';
import 'package:twentyfourby_seven/customer_Address/customer_add.dart';

import '../Login/loginScreen.dart';
import '../Service/api.dart';
import '../Utils/addImage.dart';
import '../Utils/commonDialog.dart';
import '../models/customerMailModel.dart';
import 'customerController.dart';
import 'customerDrawer.dart';

class CustomerView extends StatelessWidget {
  CustomerView({super.key});
  final customerController = Get.put(CustomerController());
  final loginCtrl = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    final firstName = SharedPrefs.getString('firstName') ?? '';
    final lastName = SharedPrefs.getString('lastName') ?? '';
    log('customer $firstName');
    log('fisry $lastName');

    return WillPopScope(
      onWillPop: () async {
        await SharedPrefs.remove('Token');
        loginCtrl.rememberMe.value = false;
        loginCtrl.emailController.clear();
        loginCtrl.passwordController.clear();

        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        drawer: Drawer(
          child: CustomerDrawer(),
        ),
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          elevation: 4,
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
                      } else if (userType['value'] == 'logout') {
                        if (loginCtrl.rememberMe.value == true) {
                          loginCtrl.submit();
                        }
                        var token = SharedPrefs.getString('Token');
                        SharedPrefs.remove(token);
                        SharedPrefs.clear();

                        loginCtrl.rememberMe.value = false;
                        loginCtrl.emailController.clear();
                        loginCtrl.passwordController.clear();
                        Get.to(() => LoginScreen());
                      }
                    },
                    child: Row(
                      children: [
                        Icon(userType['icon']),
                        const SizedBox(width: 8),
                        GlobalText(userType['name']),
                      ],
                    ),
                  );
                }).toList();
              },
              child: Row(
                children: [
                  GlobalText(
                    '$firstName $lastName',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  const Icon(Icons.manage_accounts),
                  SizedBox(
                    width: Get.width * 0.02,
                  ),
                  CircleAvatar(
                    child: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        Get.defaultDialog(
                          title: "Delete Account",
                          middleText:
                              "Are you sure you want to delete the account?",
                          titleStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          middleTextStyle: const TextStyle(
                            fontSize: 16,
                          ),
                          backgroundColor: Colors.white,
                          radius: 10,
                          contentPadding: EdgeInsets.all(20),
                          barrierDismissible: false,
                          confirm: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            icon: const Icon(Icons.delete, color: Colors.white),
                            label:
                                const GlobalText("Delete", color: Colors.white),
                            onPressed: () async {
                              await deleteAccountCustomer();

                              Get.back();
                              Get.to(LoginScreen());
                            },
                          ),
                          cancel: OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.grey),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            icon: Icon(Icons.cancel, color: Colors.grey),
                            label: GlobalText(
                              "Cancel",
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        );
                      },
                    ),
                  )
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
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search Mail Id or Sender',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 10.0),
                ),
                onChanged: (value) {
                  customerController.filterList();
                  value = customerController.searchController.value.toString();
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(Get.height * 0.010),
              child: TextField(
                controller: customerController.dateRangeController,
                decoration: InputDecoration(
                    icon: const Icon(
                      Icons.calendar_today,
                      color: MyColor.brightBlue,
                    ),
                    hintText: 'Select Date Range',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
                readOnly: true,
                onTap: () => _selectDateRange(context),
              ),
            ),
            Container(
                height: Get.height,
                color: MyColor.cardIconColor,
                width: Get.width,
                child: Obx(
                  () => customerController.customerIndexMail.value.data == null
                      ? Center(
                          child: Column(
                          children: [
                            Image.asset(
                              AddImage.noMailIcon,
                              height: Get.height * 0.35,
                            ),
                            GlobalText(
                              'No Mail Found',
                              fontSize: Get.height * 0.03,
                              color: MyColor.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ))
                      : customerController
                                  .customerIndexMail.value.data?.length ==
                              null
                          ? const Center(
                              child: CircularProgressIndicator(
                              color: MyColor.colorBlueHome,
                            ))
                          : ListView.builder(
                              itemCount: customerController
                                  .customerIndexMail.value.data?.length,
                              itemBuilder: (_, index) {
                                var emailItem = customerController
                                    .customerIndexMail.value.data?[index];

                                return Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    emailItem?.markAsRead == true
                                        ? Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  /* Obx(() => Checkbox(
                                                      value: customerController
                                                          .isMailChecked.value,
                                                      onChanged: (bool? value) {
                                                        customerController
                                                            .isMailChecked
                                                            .value = value!;
                                                      })),*/
                                                  Row(
                                                    children: [
                                                      Icon(Icons
                                                          .open_in_new_rounded),
                                                      GlobalText(
                                                        'Open and Scan',
                                                        onTap: () {
                                                          //final scan-request;

                                                          Get.dialog(
                                                              CommonDialog(
                                                                  yesLabel:
                                                                      GlobalText(
                                                                    'Yes',
                                                                    onTap:
                                                                        () async {
                                                                      await scanRequestPatchApi(
                                                                          'scan-request');
                                                                      Get.back();
                                                                      Get.back();
                                                                    },
                                                                  ),
                                                                  noLabel:
                                                                      GlobalText(
                                                                    'No',
                                                                    onTap: () =>
                                                                        Get.back(),
                                                                  ),
                                                                  title:
                                                                      'Open and Scan',
                                                                  content:
                                                                      GlobalText(
                                                                          '')));
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      const Icon(Icons
                                                          .local_shipping_outlined),
                                                      GlobalText(
                                                        'Add to Shipment',
                                                        onTap: () {
                                                          //add-shipment
                                                          Get.dialog(
                                                              CommonDialog(
                                                            yesLabel:
                                                                GlobalText(
                                                              'yes',
                                                              onTap: () async {
                                                                await scanRequestPatchApi(
                                                                    'add-shipment');
                                                              },
                                                            ),
                                                            noLabel: GlobalText(
                                                                'no'),
                                                            title:
                                                                'Add to Shipment',
                                                            content:
                                                                GlobalText(''),
                                                          ));
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(Icons.recycling),
                                                      GlobalText(
                                                        'Recycle',
                                                        onTap: () {
                                                          Get.dialog(
                                                              CommonDialog(
                                                                  yesLabel:
                                                                      GlobalText(
                                                                    'yes',
                                                                    onTap:
                                                                        () async {
                                                                      await scanRequestPatchApi(
                                                                          'recycle-request');
                                                                      Get.back();
                                                                    },
                                                                  ),
                                                                  noLabel:
                                                                      GlobalText(
                                                                    'no',
                                                                  ),
                                                                  title:
                                                                      'Recycle',
                                                                  content:
                                                                      GlobalText(
                                                                          '')));
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(Icons.share),
                                                      GlobalText(
                                                        'shared',
                                                        onTap: () {
                                                          Get.dialog(
                                                              CommonDialog(
                                                                  yesLabel:
                                                                      GlobalText(
                                                                    'Yes',
                                                                    onTap:
                                                                        () async {
                                                                      await scanRequestPatchApi(
                                                                          'shred-request');
                                                                      Get.back();
                                                                    },
                                                                  ),
                                                                  noLabel:
                                                                      GlobalText(
                                                                          'No'),
                                                                  title:
                                                                      'shared',
                                                                  content:
                                                                      GlobalText(
                                                                          '')));
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(Icons
                                                          .adf_scanner_sharp),
                                                      GlobalText(
                                                        'Rescan',
                                                        onTap: () {
                                                          Get.dialog(
                                                              CommonDialog(
                                                                  yesLabel:
                                                                      GlobalText(
                                                                    'yes',
                                                                    onTap:
                                                                        () async {
                                                                      await scanRequestPatchApi(
                                                                          'rescan-request');
                                                                      Get.back();
                                                                    },
                                                                  ),
                                                                  noLabel:
                                                                      GlobalText(
                                                                          'no'),
                                                                  title:
                                                                      'Rescan',
                                                                  content:
                                                                      GlobalText(
                                                                          '')));
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(Icons
                                                          .local_shipping_rounded),
                                                      GlobalText(
                                                        'Pick UP',
                                                        onTap: () {
                                                          Get.dialog(
                                                              CommonDialog(
                                                                  yesLabel:
                                                                      GlobalText(
                                                                    'yes',
                                                                    onTap:
                                                                        () async {
                                                                      await scanRequestPatchApi(
                                                                          'Pick UP');
                                                                      Get.back();
                                                                    },
                                                                  ),
                                                                  noLabel:
                                                                      GlobalText(
                                                                          'no'),
                                                                  title:
                                                                      'Pick UP',
                                                                  content:
                                                                      GlobalText(
                                                                          '')));
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )
                                            ],
                                          )
                                        : SizedBox(),
                                    Card(
                                      margin: EdgeInsets.all(5),
                                      //color: MyColor.cardIconColor,
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Checkbox(
                                                    value:
                                                        emailItem?.markAsRead ??
                                                            false,
                                                    onChanged:
                                                        (bool? newValue) {
                                                      if (newValue != null) {
                                                        emailItem?.markAsRead =
                                                            newValue;

                                                        customerController
                                                            .customerIndexMail
                                                            .refresh();
                                                      }
                                                    },
                                                  ),
                                              GlobalText(
                                                customerController
                                                        .customerIndexMail
                                                        .value
                                                        .data?[index]
                                                        .mailId
                                                        ?.mailType
                                                        .toString()
                                                        .capitalizeFirst ??
                                                    '',
                                                fontWeight: FontWeight.w700,
                                                color: MyColor.black,
                                              ),
                                              GlobalText(
                                                customerController
                                                        .customerIndexMail
                                                        .value
                                                        .data?[index]
                                                        .currentStatus
                                                        .toString()
                                                        .capitalizeFirst ??
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
                                              Obx(() {
                                                var data = customerController
                                                    .customerModel.value.data;
                                                if (data == null ||
                                                    index >= data.length) {
                                                  return GlobalText(
                                                    '',
                                                    fontWeight: FontWeight.w700,
                                                    color: MyColor.black,
                                                  );
                                                }

                                                String? createdAt =
                                                    data[index].createdAt;
                                                String formattedDate = '';
                                                if (createdAt != null) {
                                                  formattedDate =
                                                      DateFormat('dd-mm-yyyy')
                                                          .format(
                                                              DateTime.parse(
                                                                  createdAt));
                                                }

                                                return GlobalText(
                                                  formattedDate,
                                                  fontWeight: FontWeight.w700,
                                                  color: MyColor.black,
                                                );
                                              }),
                                              Container(
                                                height: Get.height * 0.07,
                                                width: Get.width * 0.25,
                                                child: customerController
                                                            .customerIndexMail
                                                            .value
                                                            .data
                                                            ?.length ==
                                                        null
                                                    ? const Center(
                                                        child:
                                                            CircularProgressIndicator(
                                                        color: MyColor
                                                            .colorBlueHome,
                                                      ))
                                                    : ListView.builder(
                                                        itemCount:
                                                            customerController
                                                                    .customerIndexMail
                                                                    .value
                                                                    .data
                                                                    ?.length ??
                                                                0,
                                                        itemBuilder:
                                                            (context, ind) {
                                                          String baseUrl =
                                                              'https://service.24x7mail.com/uploads/';
                                                          String imagePath =
                                                              customerController
                                                                      .customerIndexMail
                                                                      .value
                                                                      .data?[
                                                                          index]
                                                                      .mailId
                                                                      ?.measurement?[
                                                                          ind]
                                                                      .file ??
                                                                  '';
                                                          String imageUrl =
                                                              baseUrl +
                                                                  imagePath;

                                                          return Container(
                                                            height: Get.height *
                                                                0.07,
                                                            width: Get.width *
                                                                0.25,
                                                            child:
                                                                GestureDetector(
                                                              onTap: () async {
                                                                _showImageDialog(
                                                                    context,
                                                                    customerController
                                                                        .customerIndexMail
                                                                        .value
                                                                        .data?[
                                                                            index]
                                                                        .mailId
                                                                        ?.measurement,
                                                                    ind);
                                                              },
                                                              child: Card(
                                                                child: Image
                                                                    .network(
                                                                  imageUrl,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  height:
                                                                      Get.height *
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
                                                        .customerIndexMail
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
                  '${customerController.customerIndexMail.value.data?[index].mailId?.mailType.toString().capitalizeFirst}'),
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
                        GlobalText(customerController.customerIndexMail.value
                                .data?[index].mailId?.mailType
                                .toString()
                                .capitalizeFirst ??
                            ''),
                      ],
                    ),
                    Row(
                      children: [
                        GlobalText(
                          'Mail ID :',
                          fontWeight: FontWeight.w700,
                        ),
                        GlobalText(customerController.customerIndexMail.value
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
                          customerController.customerIndexMail.value
                                      .data?[index].updatedAt !=
                                  null
                              ? DateFormat('dd-MM-yyyy').format(DateTime.parse(
                                  customerController.customerIndexMail.value
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
            SingleChildScrollView(
              child: Column(
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
                        itemCount: customerController.customerIndexMail.value
                            .data?[index].mailHistory?.length,
                        itemBuilder: (context, ind) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GlobalText(customerController
                                          .customerIndexMail
                                          .value
                                          .data?[index]
                                          .mailHistory?[ind]
                                          .createdAt !=
                                      null
                                  ? DateFormat('dd-MM-yyyy').format(
                                      DateTime.parse(customerController
                                              .customerIndexMail
                                              .value
                                              .data?[index]
                                              .mailHistory?[ind]
                                              .createdAt ??
                                          ''))
                                  : ''),
                              GlobalText(customerController
                                      .customerIndexMail
                                      .value
                                      .data?[index]
                                      .mailHistory?[ind]
                                      .status
                                      .toString()
                                      .capitalizeFirst ??
                                  ''),
                              GlobalText(customerController
                                          .customerIndexMail
                                          .value
                                          .data?[index]
                                          .mailHistory?[ind]
                                          .createdAt !=
                                      null
                                  ? DateFormat('hh:mm a').format(DateTime.parse(
                                      customerController
                                              .customerIndexMail
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
