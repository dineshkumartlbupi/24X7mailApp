import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Service/api.dart';
import '../Utils/SharedPrefrance.dart';

class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var rememberMe = false.obs;
  var isViewPassword = false.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final resetEmailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void onClose() {
    emailController.clear();
    passwordController.clear();
    super.onClose();
  }

  void forgotPassword() {
    changePassword('new', '450');
    log('Forgot Password clicked');
  }

  void showPassword() {
    isViewPassword.value = !isViewPassword.value;
  }

  void submit() async {
    var token = SharedPrefs.getString('Token');
    if (formKey.currentState!.validate() && token.isEmpty) {
      await login(emailController.text, passwordController.text);
    }
    log('Email: ${emailController.text}');
    log('Password: ${passwordController.text}');
  }
}
