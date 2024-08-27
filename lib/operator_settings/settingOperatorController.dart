import 'package:get/get.dart';

import '../Service/api.dart';
import '../operator_models/operator_settings.dart';

class OperatorSetting extends GetxController {
  Rx<OperatorAddModel> settingView = OperatorAddModel().obs;
  @override
  void onInit() {
    getSettingAPi();
    super.onInit();
  }

  Future<void> getSettingAPi() async {
    settingView.value = await getOperatorSettingApi() ?? settingView.value;
  }
}
