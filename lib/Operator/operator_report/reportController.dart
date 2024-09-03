import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../Service/api.dart';
import '../../operator_models/closeAccountModel.dart';
import '../../operator_models/operationModel.dart';
import '../../operator_models/operatorOperationModel.dart';
import '../../operator_models/operator_settings.dart';
import '../../operator_models/statementReportModel.dart';

class OperationReport extends GetxController {
  Rx<OperatorAddModel> operatorModel = OperatorAddModel().obs;
  Rx<OperationModel> operatorCustomerModel = OperationModel().obs;
  Rx<CloseAccountModel> closeAccountData = CloseAccountModel().obs;
  Rx<OperatorOperationModel> operatorOperationModel =
      OperatorOperationModel().obs;
  Rx<StatementReportModel> statementReportModel = StatementReportModel().obs;
  RxString searchQuery = ''.obs;
  var searchController = TextEditingController();
  var searchList = [].obs;

  @override
  void onInit() {
    getOperationOperatorData();
    getOperationCustomerOperatorData();
    getStatementData();
    getCloseAccountData();
    getCloseAccountData().then((_) {
      searchList.assignAll(
          closeAccountData.value.data ?? []); // Use assignAll for efficiency
    });
    super.onInit();
  }

  @override
  void onClose() {
    searchController.clear();
    super.onClose();
  }

  Future<void> getOperationData() async {
    operatorModel.value =
        await getOperatorReportOperationApi() ?? operatorModel.value;
  }

  Future<void> getOperationOperatorData() async {
    operatorOperationModel.value = await getOperatorReportOperationHOmeApi() ??
        operatorOperationModel.value;
  }

  Future<void> getOperationCustomerOperatorData() async {
    operatorCustomerModel.value =
        await getOperatorReportCustomerApi() ?? operatorCustomerModel.value;
  }

  Future<void> getStatementData() async {
    statementReportModel.value =
        await statementReport() ?? statementReportModel.value;
  }

  Future<void> getCloseAccountData() async {
    final fetchedData = await getDeleteCustomerList();
    if (fetchedData != null) {
      closeAccountData.value = fetchedData;
      searchList.addAll(fetchedData.data ?? ['dada']);
    }
  }

  List get filteredList => searchQuery.isEmpty
      ? searchList.toList()
      : searchList
          .where((item) =>
              item.userinfo?.mailBoxNum
                  ?.toLowerCase()
                  .contains(searchQuery.value.toLowerCase()) ||
              (item.userinfo?.fname ?? '')
                  .toLowerCase()
                  .contains(searchQuery.value.toLowerCase()) ||
              (item.userinfo?.lname ?? '')
                  .toLowerCase()
                  .contains(searchQuery.value.toLowerCase()))
          .toList();
}
