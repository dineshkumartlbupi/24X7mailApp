import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twentyfourby_seven/Utils/Mycolor.dart';
import 'package:twentyfourby_seven/Utils/globalText.dart';
import 'package:twentyfourby_seven/customer_Address/customer_AddController.dart';

class SubscribeView extends StatelessWidget {
  SubscribeView({super.key});
  final subscribe = Get.put(CustomerAddController());
  SubscriptionType? _selectedSubscription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        title: Row(
          children: [
            Icon(Icons.add_card_outlined),
            SizedBox(
              width: Get.width * 0.02,
            ),
            GlobalText(
              'Subscription',
              fontWeight: FontWeight.bold,
              color: MyColor.cardIColorIndigo,
            ),
          ],
        ),
      ),
      body: Obx(
        () {
          if (subscribe.subscribeLoading.value) {
            return Center(
                child: CircularProgressIndicator(
              color: MyColor.colorBlueHome,
            ));
          }

          if (subscribe.subscribeView.value == null) {
            return Center(child: GlobalText('Error loading data'));
          }

          final subscribeData = subscribe.subscribeView.value?.data;

          return Column(
            children: [
              ...?subscribeData?.map((item) {
                return RadioListTile<SubscriptionType>(
                  title: GlobalText(item.planId?.type ?? 'No Plan'),
                  value: item.planId?.type == 'Monthly'
                      ? SubscriptionType.monthly
                      : SubscriptionType.annual,
                  groupValue: _selectedSubscription,
                  onChanged: (SubscriptionType? value) {
                    _selectedSubscription = value;
                  },
                );
              }).toList(),
            ],
          );
        },
      ),
    );
  }
}

enum SubscriptionType { monthly, annual }
