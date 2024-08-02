import 'package:get/get.dart';

import '../../Service/api.dart';
import '../../models/shipmentstatus_model.dart';

class Indexshipmentcontroller extends GetxController {
  Rx<ShipmentstatusModel> shipmentPastData = ShipmentstatusModel().obs;

  void getShipmentData() async {
    shipmentPastData.value = await pastShipmentList() ?? shipmentPastData.value;
  }
}
