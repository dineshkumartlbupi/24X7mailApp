import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twentyfourby_seven/Service/api.dart';
import 'package:twentyfourby_seven/models/SubscriptionModel.dart';
import 'package:twentyfourby_seven/models/profileModel.dart';
import 'package:twentyfourby_seven/models/statementModell.dart';

class CustomerAddController extends GetxController {
  Rx<StatementModell> statement = StatementModell().obs;
  Rx<UserModel?> propertyModel = UserModel().obs;
  Rx<SubscriptionModel?> subscribeView = SubscriptionModel().obs;
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

  final states = <String>[].obs;
  final cities = <String>[].obs;
  var image = Rx<File?>(null);
  var shipmentName = ''.obs;
  var shipmentNumber = ''.obs;
  var shipmentDate = ''.obs;
  @override
  void onInit() {
    getStatementDetails();
    getAddressDetails();
    getSubscribeData();
    super.onInit();
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image.value = File(pickedFile.path);
      log('image value ${image.value}');
    }
  }

  Future<void> getStatementDetails() async {
    statement.value = (await getStatementApi() ?? statement.value);
  }

  Future<void> getAddressDetails() async {
    log('getAddress');
    propertyModel.value = await getProfileApi() ?? propertyModel.value;
    log(propertyModel.value?.data?.username.toString() ?? '');
  }

  Future<void> getSubscribeData() async {
    subscribeView.value = await subscriptionApi();
  }
}
