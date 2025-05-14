import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../Utils/Mycolor.dart';
import '../Utils/globalText.dart';
import 'operatorController.dart';

class AssignMailScreen extends StatelessWidget {
  AssignMailScreen({super.key});
  var assignController = Get.find<OperatorController>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const GlobalText('Assign Mail', fontWeight: FontWeight.w600),
          bottom: const TabBar(
            automaticIndicatorColorAdjustment: true,
            tabs: [
              Tab(text: 'Pending'),
              Tab(text: 'Flagged'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              margin: const EdgeInsets.all(08),
              child: Obx(() => ListView.builder(
                    itemCount: assignController.assignList.value.data?.length,
                    itemBuilder: (_, inx) {
                      var assignPending =
                          assignController.assignList.value.data?[inx];
                      var measurementList = assignPending?.measurement ?? [];

                      final formattedDate = DateFormat('dd/MM/yyyy').format(
                          DateTime.parse(
                              assignPending?.createdAt.toString() ?? ""));

                      final timeFormate = DateFormat('hh:mm a').format(
                          DateTime.parse(
                              assignPending?.createdAt.toString() ?? ""));

                      log("Date: $formattedDate");
                      log("Time: $timeFormate");
                      return Card(
                        borderOnForeground: true,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 5,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Get.width * 0.30,
                                    vertical: Get.height * 0.02),
                                child: SizedBox(
                                  height: 120,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: measurementList.length,
                                    itemBuilder: (_, imageIndex) {
                                      var url =
                                          'https://service.24x7mail.com/uploads/';
                                      var imagePath =
                                          measurementList[imageIndex].file ??
                                              '';
                                      var imageUrl = '$url$imagePath';

                                      //log('photo=> $imagePath');
                                      return imagePath.isNotEmpty
                                          ? Image.network(
                                              imageUrl,
                                              height: Get.height * 0.05,
                                              width: Get.width * 0.55,
                                              fit: BoxFit.cover,
                                            )
                                          : Container(
                                              height: 100,
                                              width: 100,
                                              color: Colors.grey,
                                              child: const Icon(
                                                  Icons.image_not_supported),
                                            );
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GlobalText(
                                      assignPending?.mailType
                                              .toString()
                                              .capitalizeFirst ??
                                          '',
                                      fontWeight: FontWeight.w700,
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.flag),
                                          color: Colors.blue,
                                          onPressed: () {
                                            // Flag button action
                                          },
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.delete),
                                          color: Colors.red,
                                          onPressed: () {
                                            assignController
                                                .assignList.value.data
                                                ?.removeAt(inx);
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GlobalText(
                                      'Date: ${formattedDate.toString()}',
                                      fontWeight: FontWeight.w700,
                                    ),
                                    GlobalText(
                                      'Time: $timeFormate',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )),
            ),
            Container(
              color: MyColor.backgroundLogin,
              margin: const EdgeInsets.all(08),
              child: Obx(() => ListView.builder(
                    itemCount:
                        assignController.flaggedAssignList.value.data?.length,
                    itemBuilder: (_, inx) {
                      var assignPending =
                          assignController.flaggedAssignList.value.data?[inx];
                      var measurementList = assignPending?.measurement ?? [];

                      final formattedDate = DateFormat('dd/MM/yyyy').format(
                          DateTime.parse(
                              assignPending?.updatedAt.toString() ?? ""));

                      final timeFormate = DateFormat('hh:mm a').format(
                          DateTime.parse(
                              assignPending?.createdAt.toString() ?? ""));

                      log("Date: $formattedDate");
                      log("Time: $timeFormate");
                      return Card(
                        borderOnForeground: true,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 5,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Get.width * 0.30,
                                    vertical: Get.height * 0.02),
                                child: SizedBox(
                                  height: 120,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: measurementList.length,
                                    itemBuilder: (_, imageIndex) {
                                      var url =
                                          'https://service.24x7mail.com/uploads/';
                                      var imagePath =
                                          measurementList[imageIndex].file ??
                                              '';
                                      var imageUrl = '$url$imagePath';

                                      //log('photo=> $imagePath');
                                      return imagePath.isNotEmpty
                                          ? Image.network(
                                              imageUrl,
                                              height: Get.height * 0.05,
                                              width: Get.width * 0.55,
                                              fit: BoxFit.cover,
                                            )
                                          : Container(
                                              height: 100,
                                              width: 100,
                                              color: Colors.grey,
                                              child: const Icon(
                                                  Icons.image_not_supported),
                                            );
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GlobalText(
                                      assignPending?.mailType
                                              .toString()
                                              .capitalizeFirst ??
                                          '',
                                      fontWeight: FontWeight.w700,
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.flag),
                                          color: Colors.blue,
                                          onPressed: () {
                                            // Flag button action
                                          },
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.delete),
                                          color: Colors.red,
                                          onPressed: () {
                                            assignController
                                                .flaggedAssignList.value.data
                                                ?.removeAt(inx);
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const GlobalText(
                                      // 'Date: ${formattedDate.toString()}',
                                      'Date: DATE',
                                      fontWeight: FontWeight.w700,
                                    ),
                                    GlobalText(
                                      'Time: $timeFormate',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
