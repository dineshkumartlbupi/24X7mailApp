import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twentyfourby_seven/Operator/operatorController.dart';
import 'package:twentyfourby_seven/Utils/globalText.dart';

class OperatorView extends StatelessWidget {
  OperatorView({super.key});

  final opController = Get.put(OperatorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: Get.height * 0.5,
          child: Obx(
            () => ListView.builder(
                itemCount: opController.operatorView.value.data?.length,
                itemBuilder: (_, index) {
                  var OperatorData =
                      opController.operatorView.value.data?[index];
                  return Column(
                    children: [
                      GlobalText(OperatorData?.fName.toString() ?? '')
                    ],
                  );
                }),
          )),
    );
  }
}
