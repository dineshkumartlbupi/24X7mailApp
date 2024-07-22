import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:twentyfourby_seven/Utils/Mycolor.dart';
import 'package:twentyfourby_seven/Utils/globalText.dart';

import 'customer_AddController.dart';

class StatementView extends StatelessWidget {
  StatementView({super.key});
  var addStatement = Get.put(CustomerAddController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Padding(
          padding:
              EdgeInsets.only(top: Get.height * 0.10, left: Get.width * 0.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: Get.height * 0.10,
                width: Get.width * 0.56,
                color: MyColor.pastelBlue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GlobalText(
                          '\$${addStatement.statement.value.data?.length.toDouble()}',
                          fontWeight: FontWeight.w700,
                          fontSize: Get.height * 0.04,
                        ),
                        GlobalText(
                          ' Credit Balanced',
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: Get.width * 0.12,
                    ),
                    Icon(
                      Icons.attach_money,
                      size: Get.height * 0.05,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GlobalText('#'),
                  GlobalText('Date'),
                  GlobalText('Description'),
                  GlobalText('Amount'),
                ],
              ),
              Container(
                height: Get.height * 0.2,
                child: ListView.builder(
                  itemCount: addStatement.statement.value.data?.length,
                  itemBuilder: (_, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GlobalText('${index + 1}'),
                        GlobalText(addStatement
                                    .statement.value.data?[index].createdAt !=
                                null
                            ? DateFormat('dd-MM-yyyy').format(DateTime.parse(
                                addStatement.statement.value.data?[index]
                                        .createdAt ??
                                    ''))
                            : ''),
                        GlobalText(addStatement
                                .statement.value.data?[index].description
                                .toString() ??
                            ''),
                        GlobalText(
                            '\$${addStatement.statement.value.data?[index].amount.toString() ?? ''}'),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
