import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:twentyfourby_seven/Utils/Mycolor.dart';

import '../Customer/customerController.dart';
import '../Utils/addImage.dart';
import '../Utils/globalText.dart';
import '../models/customerMailModel.dart';

class UnreadMailView extends StatelessWidget {
  UnreadMailView({super.key});
  final unreadData = Get.put(CustomerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const GlobalText('UnRead'),
      ),
      body: ListView(
        children: [
          SizedBox(
              height: Get.height * 0.7,
              width: Get.width,
              child: Obx(
                () => unreadData.unreadListData.value.data == null
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
                    : unreadData.unreadListData.value.data?.length == null
                        ? const Center(
                            child: CircularProgressIndicator(
                            color: MyColor.colorBlueHome,
                          ))
                        : ListView.builder(
                            itemCount:
                                unreadData.unreadListData.value.data?.length,
                            itemBuilder: (_, index) {
                              return Column(
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
                                                value:
                                                    unreadData.isMailRead.value,
                                                onChanged: (bool? value) {
                                                  unreadData.isMailChecked
                                                      .value = value!;
                                                })),
                                            GlobalText(
                                              unreadData
                                                      .unreadListData
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
                                              unreadData
                                                      .unreadListData
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
                                              var data = unreadData
                                                  .unreadListData.value.data;
                                              if (data == null ||
                                                  index >= data.length) {
                                                return const GlobalText(
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
                                                        .format(DateTime.parse(
                                                            createdAt));
                                              }

                                              return GlobalText(
                                                formattedDate,
                                                fontWeight: FontWeight.w700,
                                                color: MyColor.black,
                                              );
                                            }),
                                            SizedBox(
                                              height: Get.height * 0.07,
                                              width: Get.width * 0.25,
                                              child: unreadData.unreadListData
                                                          .value.data?.length ==
                                                      null
                                                  ? const Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                      color:
                                                          MyColor.colorBlueHome,
                                                    ))
                                                  : ListView.builder(
                                                      itemCount: unreadData
                                                              .unreadListData
                                                              .value
                                                              .data
                                                              ?.length ??
                                                          0,
                                                      itemBuilder:
                                                          (context, index) {
                                                        String baseUrl =
                                                            'https://service.24x7mail.com/uploads/';
                                                        String imagePath = unreadData
                                                                .unreadListData
                                                                .value
                                                                .data?[index]
                                                                .mailId
                                                                ?.measurement?[
                                                                    0]
                                                                .file ??
                                                            '';
                                                        String imageUrl =
                                                            baseUrl + imagePath;

                                                        return SizedBox(
                                                          height:
                                                              Get.height * 0.07,
                                                          width:
                                                              Get.width * 0.25,
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              _showImageReadDialog(
                                                                  context,
                                                                  unreadData
                                                                      .unreadListData
                                                                      .value
                                                                      .data?[
                                                                          index]
                                                                      .mailId
                                                                      ?.measurement,
                                                                  index);
                                                            },
                                                            child: Card(
                                                              child:
                                                                  Image.network(
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
                                              unreadData
                                                      .unreadListData
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
              const GlobalText(
                'You have received new mail',
                fontWeight: FontWeight.w700,
              ),
              GlobalText(
                  '${unreadData.unreadListData.value.data?[index].mailId?.mailType.toString().capitalizeFirst}'),
            ],
          ),
          content: SizedBox(
            height: Get.height * 0.35,
            width: Get.width * 0.75,
            child: Scrollbar(
              controller: unreadData.scrollController,
              child: ListView.builder(
                controller: unreadData.scrollController,
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
                        GlobalText(unreadData.unreadListData.value.data?[index]
                                .mailId?.mailType
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
                        GlobalText(unreadData.unreadListData.value.data?[index]
                                .mailId?.mailBoxId
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
                          unreadData.unreadListData.value.data?[index]
                                      .updatedAt !=
                                  null
                              ? DateFormat('dd-MM-yyyy').format(DateTime.parse(
                                  unreadData.unreadListData.value.data?[index]
                                          .updatedAt ??
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
                        itemCount: unreadData.unreadListData.value.data?[index]
                            .mailHistory?.length,
                        itemBuilder: (context, ind) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GlobalText(unreadData
                                          .unreadListData
                                          .value
                                          .data?[index]
                                          .mailHistory?[ind]
                                          .createdAt !=
                                      null
                                  ? DateFormat('dd-MM-yyyy').format(
                                      DateTime.parse(unreadData
                                              .unreadListData
                                              .value
                                              .data?[index]
                                              .mailHistory?[ind]
                                              .createdAt ??
                                          ''))
                                  : ''),
                              GlobalText(unreadData.unreadListData.value
                                      .data?[index].mailHistory?[ind].status
                                      .toString()
                                      .capitalizeFirst ??
                                  ''),
                              GlobalText(unreadData
                                          .unreadListData
                                          .value
                                          .data?[index]
                                          .mailHistory?[ind]
                                          .createdAt !=
                                      null
                                  ? DateFormat('hh:mm a').format(DateTime.parse(
                                      unreadData
                                              .unreadListData
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
