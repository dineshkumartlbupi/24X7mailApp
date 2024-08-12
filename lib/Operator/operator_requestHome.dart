import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twentyfourby_seven/Utils/Mycolor.dart';

import '../Utils/globalText.dart';
import 'operatorController.dart';

class OperatorRequestHome extends StatelessWidget {
  OperatorRequestHome({super.key});
  final homeOperatorController = Get.put(OperatorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: GlobalText("Request by Operator"),
      ),
      body: Obx(() {
        if (homeOperatorController.operatorHome.value.data == null) {
          return Center(
              child: CircularProgressIndicator(
            color: MyColor.brightBlue,
          ));
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GlobalText(
                  'Scan Request: ${homeOperatorController.operatorHome.value.data?.scanRequest ?? 0}',
                  fontSize: 18),
              SizedBox(height: 8),
              Text(
                  'Rescan Request: ${homeOperatorController.operatorHome.value.data?.rescanRequest ?? 0}',
                  style: TextStyle(fontSize: 18)),
              SizedBox(height: 8),
              Text(
                  'Shred Request: ${homeOperatorController.operatorHome.value.data?.shredRequest ?? 0}',
                  style: TextStyle(fontSize: 18)),
              SizedBox(height: 8),
              Text(
                  'Recycle Request: ${homeOperatorController.operatorHome.value.data?.recycleRequest ?? 0}',
                  style: TextStyle(fontSize: 18)),
              SizedBox(height: 8),
              Text(
                  'Forward Shipment: ${homeOperatorController.operatorHome.value.data?.forwardShipment ?? 0}',
                  style: TextStyle(fontSize: 18)),
              SizedBox(height: 8),
              Text(
                  'Local Pickup Request: ${homeOperatorController.operatorHome.value.data?.localPickupRequest ?? 0}',
                  style: TextStyle(fontSize: 18)),
            ],
          ),
        );
      }),
    );
  }
}
