import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Customer/customerView.dart';
import '../Operator/operator_requestHome.dart';
import '../Service/api.dart';
import '../Utils/SharedPrefrance.dart';

class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var rememberMe = false.obs;
  var isViewPassword = true.obs;
  var isLoginData = false.obs;
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

  void showPassword() {
    isViewPassword.value = !isViewPassword.value;
  }

  Future<void> submit() async {
    if (formKey.currentState!.validate()) {
      final loginResponse =
          await login(emailController.text, passwordController.text);
      log('login response==> $loginResponse');
      if (loginResponse != null) {
        if (loginResponse['token'] != null && loginResponse['data'] != null) {
          final userType = loginResponse['data']['user_type'] ?? '';
          log('Controller userType: $userType');

          if (userType == 'user') {
            Get.offAll(() => CustomerView());
            final firstName = SharedPrefs.getString('firstName') ?? '';
            final lastName = SharedPrefs.getString('lastName') ?? '';
            log('User First Name: $firstName, Last Name: $lastName');
          } else if (userType == 'operator') {
            Get.offAll(() => OperatorRequestHome());
            final firstNameOp = SharedPrefs.getString('firstNameOp') ?? '';
            final lastNameOp = SharedPrefs.getString('lastNameOp') ?? '';
            log('Operator First Name: $firstNameOp, Last Name: $lastNameOp');
          } else {
            Get.snackbar('Error', 'Invalid user type: $userType');
          }
        } else {
          showLoginErrorDialog('Email or password is incorrect.');
        }
      }
    } else {
      log('Form validation failed.');
    }
  }
}
