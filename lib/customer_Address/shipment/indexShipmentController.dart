import 'package:get/get.dart';

import '../../Service/api.dart';
import '../../models/shipmentstatus_model.dart';

class Indexshipmentcontroller extends GetxController {
  Rx<ShipmentstatusModel> shipmentPastData = ShipmentstatusModel().obs;
  Rx<ShipmentstatusModel> pendingShipmentView = ShipmentstatusModel().obs;
  Rx<ShipmentstatusModel> traceView = ShipmentstatusModel().obs;
  var pendingListLoading = false.obs;
  var traceListLoading = false.obs;
  //pendingShipmentList()
  @override
  void onInit() {
    getShipmentData();
    getShipmentPending();
    getTraceList();
    super.onInit();
  }

  void getShipmentData() async {
    shipmentPastData.value = await pastShipmentList() ?? shipmentPastData.value;
  }

  void getShipmentPending() async {
    pendingListLoading.value = true;

    pendingShipmentView.value =
        await pendingShipmentList() ?? shipmentPastData.value;
    pendingListLoading.value = false;
  }

  void getTraceList() async {
    traceListLoading.value = true;

    traceView.value = await getTrashList() ?? traceView.value;
    traceListLoading.value = false;
  }
}
