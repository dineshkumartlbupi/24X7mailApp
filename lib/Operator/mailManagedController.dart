import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Service/api.dart';
import '../operator_models/mailManagementModelOP.dart';

class MailManagedController extends GetxController {
  Rx<MailManagementModelOp> mailOperations = MailManagementModelOp().obs;
  var selectedDateCtrl = TextEditingController().obs;
  var searchCtrl = TextEditingController().obs;
  var searchMailId = TextEditingController().obs;
  @override
  void onInit() {
    mailManagedOperatorData();
    super.onInit();
  }

  Future<void> mailManagedOperatorData() async {
    mailOperations.value = await mailManagementOp() ?? mailOperations.value;
  }
}
