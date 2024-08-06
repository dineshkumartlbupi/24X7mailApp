import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twentyfourby_seven/models/profileModel.dart';

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
  Rx<UserModel> loginModel = UserModel().obs;
  @override
  void onClose() {
    emailController.clear();
    passwordController.clear();
    super.onClose();
  }

  void showPassword() {
    isViewPassword.value = !isViewPassword.value;
  }

  Future<void> submit() async {
    var token = SharedPrefs.getString('Token');
    if (formKey.currentState!.validate() && token.isEmpty) {
      loginModel.value =
          (await login(emailController.text, passwordController.text) ??
              loginModel.value);
    }
    log('Email: ${emailController.text}');
    log('Password: ${passwordController.text}');
  }
}
