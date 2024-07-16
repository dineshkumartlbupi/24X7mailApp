import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Service/api.dart';

class SignupController extends GetxController {
  Rx<String?> selectedCountry = Rx<String?>(null);
  var selectedState = Rx<String?>(null);

  final countries = ['United States'].obs;
  final states = <String>[].obs;
  final formKey = GlobalKey<FormState>();
  final businessNameController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final businessAdd = TextEditingController();
  final postalController = TextEditingController();

  void setStates(List<String> stateNames) {
    states.addAll(stateNames);
    update();
  }

  @override
  void onInit() async {
    await getViewState();
    super.onInit();
  }

  @override
  void dispose() {
    businessNameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    password.dispose();
    confirmPassword.dispose();
    businessAdd.dispose();
    super.dispose();
  }
}
