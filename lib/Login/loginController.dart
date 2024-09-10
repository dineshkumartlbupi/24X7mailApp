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

  void showPassword() {
    isViewPassword.value = !isViewPassword.value;
  }

  Future<void> submit() async {
    var emailText = SharedPrefs.getString('emailId');
    var passwordText = SharedPrefs.getString('password');
    var emailOpText = SharedPrefs.getString('emailIdOp');
    var passwordOpText = SharedPrefs.getString('passwordOp');

    if (formKey.currentState!.validate()) {
      final loginResponse =
          await login(emailController.text, passwordController.text);

      if (loginResponse != null) {
        if (loginResponse['token'] != null && loginResponse['data'] != null) {
          final userType = loginResponse['data']['user_type'] ?? '';
          log('Controller userType: $userType');

          if (userType == 'user') {
            bool isEmailMatching = emailController.text == emailText;
            bool isPasswordMatching = passwordController.text == passwordText;

            log('User email check: ${emailController.text} == $emailText');
            log('User password check: ${passwordController.text} == $passwordText');

            if (isEmailMatching || isPasswordMatching) {
              final firstName = SharedPrefs.getString('firstName') ?? '';
              final lastName = SharedPrefs.getString('lastName') ?? '';
              log('User First Name: $firstName, Last Name: $lastName');
              Get.offAll(() => CustomerView());
            } else {
              showLoginErrorDialog(
                  'Email or password does not match the stored user credentials.');
            }
          } else if (userType == 'operator') {
            bool isEmailMatching = emailController.text == emailOpText;
            bool isPasswordMatching = passwordController.text == passwordOpText;

            log('Operator email check: ${emailController.text} == $emailOpText');
            log('Operator password check: ${passwordController.text} == $passwordOpText');

            if (isEmailMatching || isPasswordMatching) {
              final firstNameOp = SharedPrefs.getString('firstNameOp') ?? '';
              final lastNameOp = SharedPrefs.getString('lastNameOp') ?? '';
              log('Operator First Name: $firstNameOp, Last Name: $lastNameOp');
              Get.offAll(() => OperatorRequestHome());
            } else {
              showLoginErrorDialog(
                  'Email or password does not match the stored operator credentials.');
            }
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
