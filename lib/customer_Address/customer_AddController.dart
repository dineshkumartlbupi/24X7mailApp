import 'dart:async';
import 'dart:developer';
import 'dart:io';

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
  var image = Rx<File?>(null);
  var softCash = "".obs;
  var subscribeLoading = false.obs;
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
    await getSOftStatement();
  }

  Future<void> getAddressDetails() async {
    propertyModel.value = await getProfileApi() ?? propertyModel.value;
    log(propertyModel.value?.data?.username.toString() ?? '');
  }

  Future<void> getSubscribeData() async {
    subscribeLoading.value = true;
    subscribeView.value = await subscriptionApi();
    subscribeLoading.value = false;
  }
}
