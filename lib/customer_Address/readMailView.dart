import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:twentyfourby_seven/Utils/globalText.dart';

import '../Customer/customerController.dart';
import '../Utils/Mycolor.dart';
import '../Utils/addImage.dart';
import '../models/customerMailModel.dart';

class ReadMailView extends StatelessWidget {
  ReadMailView({super.key});
  final readListController = Get.put(CustomerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const GlobalText('Read'),
      ),
      body: ListView(
        children: [
          Container(
              color: Colors.white24,
              height: Get.height,
              width: Get.width,
              child: Obx(
                () => readListController.readListData.value.data == null
                    ? Center(
                        child: Column(
                        children: [
                          Image.asset(AddImage.noMailIcon),
                          GlobalText(
                            'No Mail Found',
                            fontSize: Get.height * 0.03,
                            color: MyColor.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ))
                    : readListController.readListData.value.data?.length == null
                        ? const Center(
                            child: CircularProgressIndicator(
                            color: MyColor.colorBlueHome,
                          ))
                        : ListView.builder(
                            itemCount: readListController
                                .readListData.value.data?.length,
                            itemBuilder: (_, index) {
                              return Padding(
                                padding:
                                    EdgeInsets.only(top: Get.height * 0.002),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
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
                                                  value: readListController
                                                      .isMailRead.value,
                                                  onChanged: (bool? value) {
                                                    readListController
                                                        .isMailChecked
                                                        .value = value!;
                                                  })),
                                              GlobalText(
                                                readListController
                                                        .readListData
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
                                                readListController
                                                        .readListData
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
                                                var data = readListController
                                                    .readListData.value.data;
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
                                                      DateFormat('MM-dd-yyyy')
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
                                                child: readListController
                                                            .readListData
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
                                                            readListController
                                                                    .readListData
                                                                    .value
                                                                    .data
                                                                    ?.length ??
                                                                0,
                                                        itemBuilder:
                                                            (context, index) {
                                                          String baseUrl =
                                                              'https://service.24x7mail.com/uploads/';
                                                          String imagePath =
                                                              readListController
                                                                      .readListData
                                                                      .value
                                                                      .data?[
                                                                          index]
                                                                      .mailId
                                                                      ?.measurement?[
                                                                          0]
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
                                                              onTap: () {
                                                                _showImageReadDialog(
                                                                    context,
                                                                    readListController
                                                                        .readListData
                                                                        .value
                                                                        .data?[
                                                                            index]
                                                                        .mailId
                                                                        ?.measurement,
                                                                    index);
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
                                                readListController
                                                        .readListData
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
                                ),
                              );
                            }),
              )),
        ],
      ),
    );
  }

  void _showImageReadDialog(
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
                  '${readListController.readListData.value.data?[index].mailId?.mailType.toString().capitalizeFirst}'),
            ],
          ),
          content: Container(
            height: Get.height * 0.35,
            width: Get.width * 0.75,
            child: Scrollbar(
              controller: readListController.scrollController,
              child: ListView.builder(
                controller: readListController.scrollController,
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
                        GlobalText(readListController.readListData.value
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
                        GlobalText(readListController.readListData.value
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
                          readListController.readListData.value.data?[index]
                                      .updatedAt !=
                                  null
                              ? DateFormat('dd-MM-yyyy').format(DateTime.parse(
                                  readListController.readListData.value
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
                        itemCount: readListController.readListData.value
                            .data?[index].mailHistory?.length,
                        itemBuilder: (context, ind) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GlobalText(readListController
                                          .readListData
                                          .value
                                          .data?[index]
                                          .mailHistory?[ind]
                                          .createdAt !=
                                      null
                                  ? DateFormat('dd-MM-yyyy').format(
                                      DateTime.parse(readListController
                                              .readListData
                                              .value
                                              .data?[index]
                                              .mailHistory?[ind]
                                              .createdAt ??
                                          ''))
                                  : ''),
                              GlobalText(readListController.readListData.value
                                      .data?[index].mailHistory?[ind].status
                                      .toString()
                                      .capitalizeFirst ??
                                  ''),
                              GlobalText(readListController
                                          .readListData
                                          .value
                                          .data?[index]
                                          .mailHistory?[ind]
                                          .createdAt !=
                                      null
                                  ? DateFormat('hh:mm a').format(DateTime.parse(
                                      readListController
                                              .readListData
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
