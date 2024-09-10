import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Service/api.dart';
import '../operator_models/mailManagementModelOP.dart';

class MailManagedController extends GetxController {
  Rx<MailManagementModelOp> mailOperations = MailManagementModelOp().obs;
  Rx<MailManagementModelOp> mailOperationsPick = MailManagementModelOp().obs;
  Rx<MailManagementModelOp> mailOperationsAssignData =
      MailManagementModelOp().obs;
  var selectedDateCtrl = TextEditingController().obs;
  var searchCtrl = TextEditingController().obs;
  var searchMailId = TextEditingController().obs;
  var searchQuery = ''.obs;
  var selectedDateRange = Rx<DateTimeRange?>(null);
  var selectedStatus = ''.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    mailManagedOperatorData();
    mailManageAssignData();
    mailManagedPickUPData();
    super.onInit();
  }

  Future<void> mailManagedOperatorData() async {
    mailOperations.value =
        await mailManagementOp('shipment_complete') ?? mailOperations.value;
  }

  Future<void> mailManagedPickUPData() async {
    mailOperationsPick.value =
        await mailManagementOp('local_pickup_complete') ??
            mailOperationsPick.value;
  }

  Future<void> mailManageAssignData() async {
    mailOperationsAssignData.value =
        await mailManagementAssignOp() ?? mailOperationsAssignData.value;
  }

  void searchMailbox(String query) {
    // Your search logic
  }

  void selectDateRange(DateTimeRange? newDateRange) {
    selectedDateRange.value = newDateRange;
  }

  void selectStatus(String? status) {
    selectedStatus.value = status ?? 'All';
  }
}
