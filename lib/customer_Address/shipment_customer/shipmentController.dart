import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../Service/api.dart';
import '../../models/shipmentModel.dart';

class ShipmentController extends GetxController {
  Rx<ShipmentModel?> shipment = ShipmentModel().obs;
  final RxBool isLoadingShipment = false.obs;
  var nameController = TextEditingController();
  var companyController = TextEditingController();
  var addLineOneController = TextEditingController();
  var addLineTwoController = TextEditingController();
  var postolController = TextEditingController();
  var phoneController = TextEditingController();
  var countryController = TextEditingController();
  var stateController = TextEditingController();
  var cityController = TextEditingController();

  final countries = ['United States'].obs;
  Rx<String?> selectedCountry = Rx<String?>(null);
  var selectedState = Rx<String?>(null);
  var selectedCity = Rx<String?>(null);

  final states = <String>[].obs;
  final cities = <String>[].obs;
  var shipmentName = ''.obs;
  var shipmentNumber = ''.obs;
  var shipmentDate = ''.obs;
  @override
  void onInit() {
    getshipmentData();

    super.onInit();
  }

  void setStates(List<String> stateNames) {
    states.addAll(stateNames);
    update();
  }

  void setStatesCities(List<String> cityName) {
    cities.addAll(cityName);
    update();
  }

  Future<void> getshipmentData() async {
    log('shipment value ${shipment.value?.msg.toString()}');
    shipment.value = await getShipiingList();
    update();
  }
}
