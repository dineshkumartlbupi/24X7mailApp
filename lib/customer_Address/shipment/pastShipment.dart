import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twentyfourby_seven/Utils/Mycolor.dart';

import 'indexShipmentController.dart';

class PastShipingList extends StatelessWidget {
  PastShipingList({super.key});
  var shipmentPast = Get.put(Indexshipmentcontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: MyColor.yellowGold,
      ),
    );
  }
}
