import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:twentyfourby_seven/Utils/Mycolor.dart';
import 'package:twentyfourby_seven/operator_settings/settingOperatorController.dart';

import '../Service/api.dart';
import '../Utils/globalText.dart';

// ignore: must_be_immutable
class OperatorSettingView extends StatelessWidget {
  OperatorSettingView({super.key});
  var settingOperator = Get.put(OperatorSetting());
  var fromController = TextEditingController();
  var toController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const GlobalText('Setting', fontWeight: FontWeight.w600),
          bottom: const TabBar(
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
                  padding: EdgeInsets.only(
                      left: Get.width * 0.05, top: Get.height * 0.015),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _buildActionButtons(context),
                        SizedBox(height: Get.height * 0.003),
                        _buildRow('Name',
                            '${settingOperator.settingView.value.data?.fName ?? ''} ${settingOperator.settingView.value.data?.lName ?? ''}'),
                        SizedBox(height: Get.height * 0.03),
                        _buildRow(
                            'Email',
                            settingOperator.settingView.value.data?.email ??
                                ''),
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
                            settingOperator
                                    .settingView.value.data?.state?.name ??
                                ''),
                        SizedBox(height: Get.height * 0.03),
                        _buildRow(
                            'City',
                            settingOperator
                                    .settingView.value.data?.city?.name ??
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
            ),
            Container(
              color: MyColor.backgroundLogin,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const GlobalText(
                      'Mailbox Range',
                      fontWeight: FontWeight.w300,
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: fromController,
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
                      keyboardType: TextInputType.number,
                      controller: toController,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(
                          Icons.arrow_drop_up,
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
                    Center(
                      child: ElevatedButton(
                          onPressed: () async {
                            await addRange(
                                fromController.text, toController.text);
                          },
                          child: const GlobalText('Save Setting')),
                    ),
                    Card(
                      color: MyColor.yellowGold,
                      child: Wrap(
                        children: [
                          Obx(() => GlobalText(
                                settingOperator.settingView.value.data?.range
                                        .toString()
                                        .padRight(15) ??
                                    '',
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              )),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.delete),
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
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

  Widget _buildActionButtons(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                TextEditingController oldPasswordController =
                    TextEditingController();
                TextEditingController newPasswordController =
                    TextEditingController();
                TextEditingController confirmPasswordController =
                    TextEditingController();

                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  title: const GlobalText(
                    'Change Password',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  content: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        TextField(
                          controller: oldPasswordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Old Password',
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.remove_red_eye),
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextField(
                          controller: newPasswordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'New Password',
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.remove_red_eye),
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextField(
                          controller: confirmPasswordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Confirm Password',
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.remove_red_eye),
                          ),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Get.back(),
                      child: GlobalText(
                        'Cancel',
                        color: Colors.grey[700],
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                      ),
                      onPressed: () async {
                        String oldPassword = oldPasswordController.text;
                        String newPassword = newPasswordController.text;
                        String confirmPassword = confirmPasswordController.text;

                        if (newPassword == confirmPassword) {
                          await operatorChangePassword(
                              oldPasswordController.text,
                              confirmPasswordController.text);
                          log('Password changed successfully!');
                        } else {
                          log('old $oldPassword');
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: GlobalText('Passwords do not match.'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                        Get.back();
                      },
                      child: const GlobalText('Change Password'),
                    ),
                  ],
                );
              },
            );
          },
          child: const GlobalText(
            'Change Password',
            color: MyColor.deepPurple,
          ),
        ),
        SizedBox(width: Get.width * 0.02),
        ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                var businessName = TextEditingController(
                    text:
                        settingOperator.settingView.value.data?.businessName ??
                            '');
                var firstName = TextEditingController(
                    text: settingOperator.settingView.value.data?.fName ?? '');
                var lastName = TextEditingController(
                    text: settingOperator.settingView.value.data?.lName ?? '');
                var email = TextEditingController(
                    text: settingOperator.settingView.value.data?.email ?? '');
                var phone = TextEditingController(
                    text: settingOperator.settingView.value.data?.phone
                            .toString() ??
                        '');
                var businessAdd = TextEditingController(
                    text: settingOperator
                            .settingView.value.data?.businessAddress ??
                        '');
                var zipNo = TextEditingController(
                    text:
                        settingOperator.settingView.value.data?.zipCode ?? '');

                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  title: const GlobalText(
                    'Edit Profile',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  content: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        TextField(
                          controller: businessName,
                          decoration: InputDecoration(
                            hintText: '$businessName',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            suffixIcon: const Icon(Icons.business),
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextField(
                          controller: firstName,
                          decoration: InputDecoration(
                            hintText: '$firstName',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            suffixIcon: const Icon(Icons.person),
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextField(
                          controller: lastName,
                          decoration: InputDecoration(
                            hintText: '$lastName',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            suffixIcon: const Icon(Icons.person_outlined),
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextField(
                          readOnly: true,
                          controller: email,
                          decoration: InputDecoration(
                            hintText: '$email',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            suffixIcon: const Icon(Icons.mail_lock),
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextField(
                          controller: phone,
                          decoration: InputDecoration(
                            hintText: '$phone',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            suffixIcon: const Icon(Icons.call),
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextField(
                          controller: businessAdd,
                          decoration: InputDecoration(
                            hintText: '$businessAdd',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            suffixIcon: const Icon(Icons.business_sharp),
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextField(
                          controller: zipNo,
                          decoration: InputDecoration(
                            hintText: '$zipNo',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            suffixIcon: const Icon(Icons.confirmation_number_sharp),
                          ),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Get.back(),
                      child: GlobalText(
                        'Cancel',
                        color: Colors.grey[700],
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                      ),
                      onPressed: () async {
                        await updateOperatorProfile(
                            businessName.text,
                            firstName.text,
                            lastName.text,
                            businessAdd.text,
                            phone.text,
                            zipNo.text);
                      },
                      child: const GlobalText('Update'),
                    ),
                  ],
                );
              },
            );
          },
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
