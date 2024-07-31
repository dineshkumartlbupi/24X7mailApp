import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twentyfourby_seven/Utils/globalText.dart';

import '../models/SubscriptionModel.dart';

class SubscribeView extends StatelessWidget {
  SubscribeView({super.key});
  final subscribe = Get.put(SubscriptionModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Card(child: GlobalText(subscribe.status.toString() ?? '')),
        ],
      ),
    );
  }
}
