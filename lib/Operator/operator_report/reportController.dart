import 'package:get/get.dart';

import '../../Service/api.dart';
import '../../operator_models/operator_settings.dart';

class OperationReport extends GetxController {
  Rx<OperatorAddModel> operatorModel = OperatorAddModel().obs;

  Future<void> getOperationData() async {
    operatorModel.value =
        await getOperatorReportOperationApi() ?? operatorModel.value;
  }
}
