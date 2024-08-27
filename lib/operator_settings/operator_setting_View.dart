import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:twentyfourby_seven/Utils/Mycolor.dart';
import 'package:twentyfourby_seven/operator_settings/settingOperatorController.dart';

import '../Service/api.dart';
import '../Utils/globalText.dart';

class OperatorSettingView extends StatelessWidget {
  OperatorSettingView({super.key});
  var settingOperator = Get.put(OperatorSetting());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: GlobalText('Setting', fontWeight: FontWeight.w600),
          bottom: TabBar(
            automaticIndicatorColorAdjustment: true,
            tabs: [
              Tab(text: 'My Account'),
              Tab(text: 'Mailbox Setting'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              height: Get.height * 0.5,
              color: MyColor.backgroundLogin,
              child: Obx(
                () => Padding(
                  padding: EdgeInsets.only(left: Get.width * 0.05),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildActionButtons(),
                      SizedBox(height: Get.height * 0.004),
                      _buildRow('Name',
                          '${settingOperator.settingView.value.data?.fName ?? ''} ${settingOperator.settingView.value.data?.lName ?? ''}'),
                      SizedBox(height: Get.height * 0.03),
                      _buildRow('Email',
                          settingOperator.settingView.value.data?.email ?? ''),
                      SizedBox(height: Get.height * 0.03),
                      _buildRow(
                          'Business Name',
                          settingOperator
                                  .settingView.value.data?.businessName ??
                              ''),
                      SizedBox(height: Get.height * 0.03),
                      _buildFlexibleRow(
                          'Business Address',
                          settingOperator
                                  .settingView.value.data?.businessAddress ??
                              ''),
                      SizedBox(height: Get.height * 0.03),
                      _buildRow(
                          'Registered Date',
                          formatDate(settingOperator
                                  .settingView.value.data?.updatedAt ??
                              '')),
                      SizedBox(height: Get.height * 0.03),
                      _buildRow(
                          'Country',
                          settingOperator
                                  .settingView.value.data?.country?.name ??
                              ''),
                      SizedBox(height: Get.height * 0.03),
                      _buildRow(
                          'State',
                          settingOperator.settingView.value.data?.state?.name ??
                              ''),
                      SizedBox(height: Get.height * 0.03),
                      _buildRow(
                          'City',
                          settingOperator.settingView.value.data?.city?.name ??
                              ''),
                      SizedBox(height: Get.height * 0.03),
                      _buildRow(
                          'Mobile Number',
                          settingOperator.settingView.value.data?.phone
                                  .toString() ??
                              ''),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: MyColor.backgroundLogin,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GlobalText(
                      'Mailbox Range',
                      fontWeight: FontWeight.w300,
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        suffixIcon: const Icon(
                          Icons.arrow_drop_down,
                          color: MyColor.cardIColorIndigo,
                        ),
                        hintText: 'from',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        suffixIcon: const Icon(
                          Icons.arrow_upward,
                          color: MyColor.cardIColorIndigo,
                        ),
                        hintText: 'to',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        child: const GlobalText('Save Setting'))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String formatDate(String? date) {
    if (date == null || date.isEmpty) return '';

    try {
      DateTime dateTime = DateTime.parse(date);

      return DateFormat('MM-dd-yyyy').format(dateTime);
    } catch (e) {
      return date;
    }
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () async {
            await operatorChangePassword();
          },
          child: const GlobalText(
            'Change Password',
            color: MyColor.deepPurple,
          ),
        ),
        SizedBox(width: Get.width * 0.02),
        ElevatedButton(
          onPressed: () {},
          child: const GlobalText(
            'Edit',
            color: MyColor.deepPurple,
          ),
        ),
      ],
    );
  }

  Widget _buildRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GlobalText(
          label,
          fontWeight: FontWeight.w700,
          color: MyColor.deepPurple,
          fontSize: Get.height * 0.02,
        ),
        SizedBox(width: Get.width * 0.04),
        GlobalText(
          value,
          fontWeight: FontWeight.w400,
          fontSize: Get.height * 0.02,
        ),
      ],
    );
  }

  Widget _buildFlexibleRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GlobalText(
          label,
          color: MyColor.deepPurple,
          fontWeight: FontWeight.w700,
          fontSize: Get.height * 0.02,
        ),
        SizedBox(width: Get.width * 0.03),
        Flexible(
          child: GlobalText(
            value,
            fontWeight: FontWeight.w400,
            fontSize: Get.height * 0.02,
          ),
        ),
      ],
    );
  }
}
