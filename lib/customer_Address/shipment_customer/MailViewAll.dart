import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:twentyfourby_seven/Utils/Mycolor.dart';
import 'package:twentyfourby_seven/Utils/globalText.dart';

import '../../Customer/customerController.dart';
import '../../Login/loginController.dart';
import '../../Service/api.dart';
import '../../Utils/SharedPrefrance.dart';
import '../../Utils/addImage.dart';
import '../../Utils/commonDialog.dart';
import '../../models/customerMailModel.dart';

class MailViewAll extends StatelessWidget {
  MailViewAll({super.key});
  final customerController = Get.find<CustomerController>();
  final loginCtrl = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await SharedPrefs.remove('Token');

        loginCtrl.rememberMe.value = false;
        loginCtrl.emailController.clear();
        loginCtrl.passwordController.clear();

        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const GlobalText(
            'ViewAll Mail',
            color: MyColor.white,
            fontWeight: FontWeight.bold,
          ),
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
                      borderRadius: BorderRadius.circular(15)),
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
                    icon: const Icon(Icons.calendar_today),
                    hintText: 'Select Date Range',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
                readOnly: true,
                onTap: () => _selectDateRange(context),
              ),
            ),
            SizedBox(
                height: Get.height,
                width: Get.width,
                child: Obx(
                  () => customerController.customerModel.value.data == null
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
                      : customerController.customerModel.value.data?.length ==
                              null
                          ? const Center(
                              child: CircularProgressIndicator(
                              color: MyColor.colorBlueHome,
                            ))
                          : ListView.builder(
                              itemCount: customerController
                                  .customerModel.value.data?.length,
                              itemBuilder: (_, index) {
                                return Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                                    MainAxisAlignment
                                                        .spaceAround,
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
                                                      const Icon(Icons
                                                          .open_in_new_rounded),
                                                      GlobalText(
                                                        'Open and Scan',
                                                        onTap: () {
                                                          Get.dialog(
                                                              CommonDialog(
                                                                  yesLabel:
                                                                      GlobalText(
                                                                    'yes',
                                                                    onTap:
                                                                        () async {
                                                                      await scanRequestPatchApi(
                                                                          'scan-request');
                                                                      Get.back();
                                                                      Get.back();
                                                                    },
                                                                  ),
                                                                  noLabel:
                                                                      const GlobalText(
                                                                          'no'),
                                                                  title:
                                                                      'Open and Scan',
                                                                  content:
                                                                      const GlobalText(
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
                                                            noLabel: const GlobalText(
                                                                'no'),
                                                            title:
                                                                'Add to Shipment',
                                                            content:
                                                                const GlobalText(''),
                                                          ));
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      const Icon(Icons.recycling),
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
                                                                      const GlobalText(
                                                                          'no'),
                                                                  title:
                                                                      'Recycle',
                                                                  content:
                                                                      const GlobalText(
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
                                                      const Icon(Icons.share),
                                                      GlobalText(
                                                        'shared',
                                                        onTap: () {
                                                          Get.dialog(
                                                              CommonDialog(
                                                                  yesLabel:
                                                                      GlobalText(
                                                                    'yes',
                                                                    onTap:
                                                                        () async {
                                                                      await scanRequestPatchApi(
                                                                          'shred-request');
                                                                      Get.back();
                                                                    },
                                                                  ),
                                                                  noLabel:
                                                                      const GlobalText(
                                                                          'no'),
                                                                  title:
                                                                      'shared',
                                                                  content:
                                                                      const GlobalText(
                                                                          '')));
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      const Icon(Icons
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
                                                                      const GlobalText(
                                                                          'no'),
                                                                  title:
                                                                      'Rescan',
                                                                  content:
                                                                      const GlobalText(
                                                                          '')));
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      const Icon(Icons
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
                                                                      const GlobalText(
                                                                          'no'),
                                                                  title:
                                                                      'Pick UP',
                                                                  content:
                                                                      const GlobalText(
                                                                          '')));
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )
                                            ],
                                          )
                                        : const SizedBox(),
                                    Card(
                                      color: MyColor.cardIconColor,
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
                                              Obx(() => Checkbox(
                                                  value: customerController
                                                          .customerModel
                                                          .value
                                                          .data?[index]
                                                          .markAsRead ??
                                                      false,
                                                  onChanged: (bool? value) {
                                                    customerController
                                                        .customerModel
                                                        .value
                                                        .data?[index]
                                                        .markAsRead = value;
                                                    customerController
                                                        .customerModel
                                                        .refresh();
                                                  })),
                                              GlobalText(
                                                customerController
                                                        .customerModel
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
                                                        .customerModel
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
                                              GlobalText(
                                                customerController
                                                            .customerModel
                                                            .value
                                                            .data?[index]
                                                            .createdAt !=
                                                        null
                                                    ? DateFormat('dd-MM-yyyy')
                                                        .format(DateTime.parse(
                                                            customerController
                                                                    .customerModel
                                                                    .value
                                                                    .data?[
                                                                        index]
                                                                    .createdAt ??
                                                                ''))
                                                    : '',
                                                fontWeight: FontWeight.w700,
                                                color: MyColor.black,
                                              ),
                                              SizedBox(
                                                height: Get.height * 0.07,
                                                width: Get.width * 0.25,
                                                child: customerController
                                                            .customerModel
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
                                                                    .customerModel
                                                                    .value
                                                                    .data
                                                                    ?.length ??
                                                                0,
                                                        itemBuilder:
                                                            (context, inde) {
                                                          String baseUrl =
                                                              'https://service.24x7mail.com/uploads/';
                                                          String imagePath =
                                                              customerController
                                                                      .customerModel
                                                                      .value
                                                                      .data?[
                                                                          index]
                                                                      .mailId
                                                                      ?.measurement?[
                                                                          inde]
                                                                      .file ??
                                                                  '';
                                                          String imageUrl =
                                                              baseUrl +
                                                                  imagePath;

                                                          return SizedBox(
                                                            height: Get.height *
                                                                0.07,
                                                            width: Get.width *
                                                                0.25,
                                                            child:
                                                                GestureDetector(
                                                              onTap: () async {
                                                                //await getshipment();
                                                                _showImageDialog(
                                                                    context,
                                                                    customerController
                                                                        .customerModel
                                                                        .value
                                                                        .data?[
                                                                            index]
                                                                        .mailId
                                                                        ?.measurement,
                                                                    inde);
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
        initialDate: pickedFromDate.add(const Duration(days: 1)),
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
              const GlobalText(
                'You have received new mail',
                fontWeight: FontWeight.w700,
              ),
              GlobalText(
                  '${customerController.customerModel.value.data?[index].mailId?.mailType.toString().capitalizeFirst}'),
            ],
          ),
          content: SizedBox(
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
                        const GlobalText(
                          'Sender :',
                          fontWeight: FontWeight.w700,
                        ),
                        GlobalText(customerController.customerModel.value
                                .data?[index].mailId?.mailType
                                .toString()
                                .capitalizeFirst ??
                            ''),
                      ],
                    ),
                    Row(
                      children: [
                        const GlobalText(
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
                        const GlobalText(
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
                        const GlobalText(
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
                  SizedBox(
                    height: Get.height * 0.05,
                    width: Get.width,
                    child: ListView.builder(
                        itemCount: customerController.customerModel.value
                            .data?[index].mailHistory?.length,
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
                                      .toString()
                                      .capitalizeFirst ??
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
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            TextButton(
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(MyColor.softBlue)),
              child: const GlobalText('Close'),
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
