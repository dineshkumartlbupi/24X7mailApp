import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twentyfourby_seven/Utils/Mycolor.dart';
import 'package:twentyfourby_seven/Utils/globalText.dart';
import 'package:twentyfourby_seven/customer_Address/customer_AddController.dart';

import '../../Utils/addImage.dart';

enum SubscriptionType { monthly, annual }

class SubscribeView extends StatefulWidget {
  SubscribeView({super.key});

  @override
  State<SubscribeView> createState() => _SubscribeViewState();
}

class _SubscribeViewState extends State<SubscribeView> {
  final subscribe = Get.put(CustomerAddController());

  SubscriptionType? selectedSubscriptionValue;

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
            const GlobalText(
              'Subscription',
              fontWeight: FontWeight.bold,
              color: MyColor.cardIColorIndigo,
            ),
          ],
        ),
      ),
      body: Obx(
        () {
          final subscribeData = subscribe.subscribeView.value?.data ?? [];

          final monthlySubscription =
              subscribeData.firstWhereOrNull((item) => item.type == 'monthly');
          final annualSubscription =
              subscribeData.firstWhereOrNull((item) => item.type == 'yearly');

          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (monthlySubscription != null)
                    Expanded(
                      child: RadioListTile<SubscriptionType>(
                        title: const GlobalText(
                          'Monthly',
                          fontWeight: FontWeight.w700,
                        ),
                        value: SubscriptionType.monthly,
                        groupValue: selectedSubscriptionValue,
                        onChanged: (SubscriptionType? value) {
                          setState(() => selectedSubscriptionValue = value);
                        },
                      ),
                    ),
                  if (annualSubscription != null)
                    Expanded(
                      child: RadioListTile<SubscriptionType>(
                        title: const GlobalText(
                          'Annual',
                          fontWeight: FontWeight.w700,
                        ),
                        value: SubscriptionType.annual,
                        groupValue: selectedSubscriptionValue,
                        onChanged: (SubscriptionType? value) {
                          setState(() => selectedSubscriptionValue = value);
                        },
                      ),
                    ),
                ],
              ),
              selectedSubscriptionValue == SubscriptionType.monthly
                  ? Expanded(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Stack(
                            children: [
                              Image.asset(
                                AddImage.packagePlanM9,
                                width: Get.width * 0.95,
                                height: Get.height * 0.75,
                              ),
                              Positioned(
                                top: Get.height * 0.60,
                                bottom: Get.height * 0.02,
                                left: Get.width * 0.28,
                                right: Get.width * 0.08,
                                child: InkWell(
                                  onTap: () => showFeesDialog(context),
                                  child: GlobalText(
                                    'Show Additional Fees',
                                    fontSize: Get.height * 0.02,
                                    fontWeight: FontWeight.w600,
                                    color: MyColor.colorBlueHome,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Stack(
                            children: [
                              Image.asset(
                                AddImage.packagePlanM18,
                                width: Get.width * 0.95,
                                height: Get.height * 0.75,
                              ),
                              Positioned(
                                top: Get.height * 0.60,
                                bottom: Get.height * 0.02,
                                left: Get.width * 0.28,
                                right: Get.width * 0.08,
                                child: InkWell(
                                  onTap: () => showFeesDialog(context),
                                  child: GlobalText(
                                    'Show Additional Fees',
                                    fontSize: Get.height * 0.02,
                                    fontWeight: FontWeight.w600,
                                    color: MyColor.colorBlueHome,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Stack(
                            children: [
                              Image.asset(
                                AddImage.packagePlanM39,
                                width: Get.width * 0.95,
                                height: Get.height * 0.75,
                              ),
                              Positioned(
                                top: Get.height * 0.60,
                                bottom: Get.height * 0.02,
                                left: Get.width * 0.28,
                                right: Get.width * 0.08,
                                child: InkWell(
                                  onTap: () => showFeesDialog(context),
                                  child: GlobalText(
                                    'Show Additional Fees',
                                    fontSize: Get.height * 0.02,
                                    fontWeight: FontWeight.w600,
                                    color: MyColor.colorBlueHome,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  : Expanded(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Stack(
                            children: [
                              Image.asset(
                                AddImage.packagePlanY199,
                                width: Get.width * 0.95,
                                height: Get.height * 0.75,
                              ),
                              Positioned(
                                top: Get.height * 0.60,
                                bottom: Get.height * 0.02,
                                left: Get.width * 0.28,
                                right: Get.width * 0.08,
                                child: InkWell(
                                  onTap: () => showFeesDialog(context),
                                  child: GlobalText(
                                    'Show Additional Fees',
                                    fontSize: Get.height * 0.02,
                                    fontWeight: FontWeight.w600,
                                    color: MyColor.colorBlueHome,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Stack(
                            children: [
                              Image.asset(
                                AddImage.packagePlanY99,
                                width: Get.width * 0.95,
                                height: Get.height * 0.75,
                              ),
                              Positioned(
                                top: Get.height * 0.60,
                                bottom: Get.height * 0.02,
                                left: Get.width * 0.28,
                                right: Get.width * 0.08,
                                child: InkWell(
                                  onTap: () => showFeesDialog(context),
                                  child: GlobalText(
                                    'Show Additional Fees',
                                    fontSize: Get.height * 0.02,
                                    fontWeight: FontWeight.w600,
                                    color: MyColor.colorBlueHome,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Stack(
                            children: [
                              Image.asset(
                                AddImage.packagePlanY399,
                                width: Get.width * 0.95,
                                height: Get.height * 0.75,
                              ),
                              Positioned(
                                top: Get.height * 0.60,
                                bottom: Get.height * 0.02,
                                left: Get.width * 0.28,
                                right: Get.width * 0.08,
                                child: InkWell(
                                  onTap: () => showFeesDialog(context),
                                  child: GlobalText(
                                    'Show Additional Fees',
                                    fontSize: Get.height * 0.02,
                                    fontWeight: FontWeight.w600,
                                    color: MyColor.colorBlueHome,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
            ],
          );
        },
      ),
    );
  }

  void showFeesDialog(BuildContext context) {
    Get.defaultDialog(
      title: 'Additional Fees',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRow(
              'Add\'l Received', '\$1.00 per extra envelope or package scan.'),
          _buildRow(
              'Add\'l Open & Scan', '\$0.25 per envelope additional pages.'),
          _buildRow(
              'Mail Forwarding', 'No handling fees, Shipping fees will apply.'),
          _buildRow('Mail Storage',
              'The first 30 days are free, then \$0.05 per envelope per day.'),
          _buildRow('Package Storage',
              'The first 7 days are free, then as per the type of package.'),
          _buildRow('Add\'l Users / Recipients',
              '\$4.99 per month, per additional user or recipient.'),
          _buildRow('Local Pickup', 'Unlimited Pickup during business hours.'),
          _buildRow('Mail Shredding', '\$0.10 for each mail.'),
        ],
      ),
      confirm: ElevatedButton(
        onPressed: () => Get.back(),
        child: const GlobalText('Close'),
      ),
    );
  }

  Widget _buildRow(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: GlobalText(
              title,
              color: MyColor.colorBlueHome, // Your blue color
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            flex: 3,
            child: GlobalText(
              subtitle,
              color: Colors.black, // Default color
            ),
          ),
        ],
      ),
    );
  }
}
