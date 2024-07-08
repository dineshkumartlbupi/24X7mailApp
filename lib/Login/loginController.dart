import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

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
    if (formKey.currentState!.validate()) {
      await login();

      log('Email: ${emailController.text}');
      log('Password: ${passwordController.text}');
    }
  }
}
