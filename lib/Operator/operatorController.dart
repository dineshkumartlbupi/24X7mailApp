import 'package:get/get.dart';
import 'package:twentyfourby_seven/models/OperatorModel.dart';

import '../Service/api.dart';

class OperatorController extends GetxController {
  Rx<OperatorModel> operatorView = OperatorModel().obs;

  Future<void> getOperatorList() async {
    operatorView.value = await getOperatorApi() ?? operatorView.value;
  }

  @override
  void onInit() {
    getOperatorList();
    super.onInit();
  }
}
