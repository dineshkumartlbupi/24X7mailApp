import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:twentyfourby_seven/Utils/Mycolor.dart';
import 'package:twentyfourby_seven/Utils/globalText.dart';

import 'indexShipmentController.dart';

class PastShipingList extends StatelessWidget {
  PastShipingList({super.key});
  var shipmentPast = Get.put(Indexshipmentcontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: GlobalText(
            'Past shipment',
            fontWeight: FontWeight.bold,
          ),
        ),
        body: Obx(() => shipmentPast.shipmentPastData.value.data?.length == null
            ? Center(
                child: CircularProgressIndicator(
                color: MyColor.brightBlue,
              ))
            : ListView.builder(
                itemCount: shipmentPast.shipmentPastData.value.data?.length,
                itemBuilder: (_, inx) {
                  var shipmentIndex =
                      shipmentPast.shipmentPastData.value.data?[inx];
                  log('shipment123 ${shipmentIndex?.reciver}');
                  return Card(
                    margin: const EdgeInsets.all(8),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: MyColor.colorBlueHome, width: 2.0),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Column(
                        children: [
                          CircleAvatar(child: GlobalText('${inx + 1}')),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  GlobalText(
                                    'Mail ID :',
                                    fontWeight: FontWeight.bold,
                                  ),
                                  GlobalText(shipmentIndex?.mailId?.mailBoxId
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  GlobalText('Ship Date	:',
                                      fontWeight: FontWeight.bold),
                                  GlobalText(shipmentIndex
                                              ?.shippedDetails?[0].createdAt !=
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
                                          ?.shippedDetails?[0].trackingNumber
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
