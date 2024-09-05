import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:twentyfourby_seven/Utils/Mycolor.dart';

import '../../Utils/addImage.dart';
import '../../Utils/globalText.dart';
import 'indexShipmentController.dart';

class PendingShipment extends StatelessWidget {
  PendingShipment({super.key});

  var pendingCtrl = Get.put(Indexshipmentcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const GlobalText(
            'Pending shipment',
            fontWeight: FontWeight.bold,
          ),
        ),
        body: Obx(() => pendingCtrl.pendingShipmentView.value.data == null
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
            : pendingCtrl.pendingListLoading.value
                ? const Center(
                    child: CircularProgressIndicator(
                      color: MyColor.brightBlue,
                    ),
                  )
                : ListView.builder(
                    itemCount:
                        pendingCtrl.pendingShipmentView.value.data?.length,
                    itemBuilder: (_, inx) {
                      var shipmentIndex =
                          pendingCtrl.pendingShipmentView.value.data?[inx];
                      log('shipment123 ${shipmentIndex?.reciver}');
                      return Card(
                        margin: const EdgeInsets.all(8),
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                color: MyColor.colorBlueHome, width: 2.0),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Column(
                            children: [
                              CircleAvatar(child: GlobalText('${inx + 1}')),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const GlobalText(
                                        'Mail ID :',
                                        fontWeight: FontWeight.bold,
                                      ),
                                      GlobalText(shipmentIndex
                                              ?.mailId?.mailBoxId
                                              .toString() ??
                                          '12'),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const GlobalText('Actual Cost	:',
                                          fontWeight: FontWeight.bold),
                                      GlobalText(
                                          '\$${shipmentIndex?.shippedDetails?[0].shippingCost?.toString() ?? ''}'),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GlobalText(
                                    'Shipping Address:',
                                    fontWeight: FontWeight.bold,
                                  ),
                                  GlobalText(
                                    '${shipmentIndex?.shippedDetails?[0].shippingAddress?.name?.capitalizeFirst ?? ''}, '
                                    '${shipmentIndex?.shippedDetails?[0].shippingAddress?.city?.name ?? ''}, '
                                    '${shipmentIndex?.shippedDetails?[0].shippingAddress?.state?.name ?? ''}, '
                                    '${shipmentIndex?.shippedDetails?[0].shippingAddress?.postalCode ?? ''}, '
                                    '${shipmentIndex?.shippedDetails?[0].shippingAddress?.country?.name ?? ''}',
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  GlobalText('Shipping Method :',
                                      fontWeight: FontWeight.bold),
                                  GlobalText(shipmentIndex
                                          ?.shippedDetails?[0].shipmentCareer
                                          ?.toString() ??
                                      ''
                                          ''),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      GlobalText('Ship Date	:',
                                          fontWeight: FontWeight.bold),
                                      GlobalText(shipmentIndex
                                                  ?.shippedDetails?[0]
                                                  .createdAt !=
                                              null
                                          ? DateFormat('dd-MM-yyyy').format(
                                              DateTime.parse(
                                                  '${shipmentIndex?.shippedDetails![0].createdAt}'))
                                          : ''),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      GlobalText('Tracking Number	:',
                                          fontWeight: FontWeight.bold),
                                      GlobalText(shipmentIndex
                                              ?.shippedDetails?[0]
                                              .trackingNumber
                                              ?.toString() ??
                                          ''
                                              ''),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    })));
  }
}
