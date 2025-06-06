import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twentyfourby_seven/Home/drawerProperty.dart';
import 'package:twentyfourby_seven/Operator/operatorController.dart';
import 'package:twentyfourby_seven/Utils/Mycolor.dart';
import 'package:twentyfourby_seven/Utils/addImage.dart';
import 'package:twentyfourby_seven/Utils/globalText.dart';

class OperatorView extends StatelessWidget {
  OperatorView({super.key});

  final opController = Get.put(OperatorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(child: DrawerProperty()),
      appBar: AppBar(
          actions: [
            Obx(() => DropdownButton<String>(
                  value: opController.selectedValue.value,
                  items: <String>['All', 'Rejected', 'Pending', 'Approved']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      opController.updateValue(newValue);
                    }
                  },
                )),
            SizedBox(
              width: Get.width * 0.05,
            ),
            Image.asset(
              AddImage.homeLogo,
              height: Get.height * 0.04,
            ),
          ],
          title: const GlobalText(
            'Operator',
            fontWeight: FontWeight.w700,
          )),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.height * 0.02),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText:
                            'Search with Business Name, Phone No, Zipcode...'),
                  ),
                ),
                SizedBox(width: Get.width * 0.02),
                ElevatedButton(
                    onPressed: () {
                      opController.showAddOperatorDialog(context);
                    },
                    child: const GlobalText('Add')),
              ],
            ),
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                  itemCount: opController.operatorView.value.data?.length,
                  itemBuilder: (_, index) {
                    var operatorData =
                        opController.operatorView.value.data?[index];
                    return Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: const BorderSide(
                              color: MyColor.cardIColorIndigo, width: 2.0)),
                      margin: EdgeInsets.symmetric(
                          vertical: Get.height * 0.015,
                          horizontal: Get.width * 0.02),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: CircleAvatar(
                                  backgroundColor: MyColor.yellowGold,
                                  radius: 10,
                                  child: GlobalText(
                                    '${index + 1}',
                                    fontWeight: FontWeight.w700,
                                  ),
                                )),
                            Row(
                              children: [
                                GlobalText(
                                  'OPERATOR NAME :',
                                  fontWeight: FontWeight.w700,
                                  fontSize: Get.height * 0.015,
                                ),
                                GlobalText(
                                  '${operatorData?.fName.toString() ?? ''}${operatorData?.lName.toString() ?? ''}',
                                  fontWeight: FontWeight.w500,
                                  fontSize: Get.height * 0.014,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                GlobalText(
                                  'EMAIL :',
                                  fontWeight: FontWeight.w700,
                                  fontSize: Get.height * 0.015,
                                ),
                                GlobalText(
                                  operatorData?.email.toString() ?? '',
                                  fontWeight: FontWeight.w500,
                                  fontSize: Get.height * 0.014,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                GlobalText(
                                  'BUSINESS NAME :',
                                  fontWeight: FontWeight.w700,
                                  fontSize: Get.height * 0.015,
                                ),
                                GlobalText(
                                  operatorData?.businessName.toString() ?? '',
                                  fontWeight: FontWeight.w500,
                                  fontSize: Get.height * 0.014,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    GlobalText(
                                      'COUNTRY :',
                                      fontWeight: FontWeight.w700,
                                      fontSize: Get.height * 0.015,
                                    ),
                                    GlobalText(
                                      operatorData?.country?.name.toString() ??
                                          '',
                                      fontWeight: FontWeight.w500,
                                      fontSize: Get.height * 0.014,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    GlobalText(
                                      'STATE :',
                                      fontWeight: FontWeight.w700,
                                      fontSize: Get.height * 0.015,
                                    ),
                                    GlobalText(
                                      operatorData?.state?.name.toString() ??
                                          '',
                                      fontWeight: FontWeight.w500,
                                      fontSize: Get.height * 0.014,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    GlobalText(
                                      'CITY :',
                                      fontWeight: FontWeight.w700,
                                      fontSize: Get.height * 0.015,
                                    ),
                                    GlobalText(
                                      operatorData?.city?.name.toString() ?? '',
                                      fontWeight: FontWeight.w500,
                                      fontSize: Get.height * 0.014,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    GlobalText(
                                      'ZIP CODE :',
                                      fontWeight: FontWeight.w700,
                                      fontSize: Get.height * 0.015,
                                    ),
                                    GlobalText(
                                      operatorData?.zipCode.toString() ?? '',
                                      fontWeight: FontWeight.w500,
                                      fontSize: Get.height * 0.014,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                GlobalText(
                                  'BUSINESS ADDRESS:',
                                  fontWeight: FontWeight.w700,
                                  fontSize: Get.height * 0.015,
                                ),
                                Expanded(
                                  child: GlobalText(
                                    operatorData?.businessAddress.toString() ??
                                        '',
                                    fontWeight: FontWeight.w500,
                                    fontSize: Get.height * 0.014,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                GlobalText(
                                  'CREATED DATE :',
                                  fontWeight: FontWeight.w700,
                                  fontSize: Get.height * 0.015,
                                ),
                                GlobalText(
                                  operatorData?.createdAt.toString() ?? '',
                                  fontWeight: FontWeight.w500,
                                  fontSize: Get.height * 0.014,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const CircleAvatar(
                                  child: Icon(
                                    Icons.edit,
                                  ),
                                ),
                                SizedBox(
                                  width: Get.height * 0.012,
                                ),
                                const CircleAvatar(child: Icon(Icons.update)),
                                SizedBox(
                                  width: Get.height * 0.012,
                                ),
                                InkWell(
                                    onTap: () async {
                                      //await postOperatorRejectApi(operatorData?.id.toString() ?? '');
                                    },
                                    child: const CircleAvatar(
                                        child: Icon(Icons.clear))),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
