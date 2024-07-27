import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Customer/customerView.dart';
import '../Service/api.dart';

class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var rememberMe = false.obs;
  var isViewPassword = false.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void forgotPassword() {
    log('Forgot Password clicked');
  }

  void showPassword() {
    isViewPassword.value = !isViewPassword.value;
  }

  void submit() async {
    await login(emailController.text, passwordController.text);

    if (formKey.currentState!.validate()) {
      Get.to(() => CustomerView());
      log('Email: ${emailController.text}');
      log('Password: ${passwordController.text}');
    }
  }
}
