import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twentyfourby_seven/Customer/customerView.dart';
import 'package:twentyfourby_seven/Login/loginController.dart';
import 'package:twentyfourby_seven/Utils/Mycolor.dart';
import 'package:twentyfourby_seven/Utils/addImage.dart';
import 'package:twentyfourby_seven/Utils/globalText.dart';

import '../Home/requestLocation.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          elevation: 12,
          child: Container(
            height: Get.height * 0.55,
            width: Get.width * 0.9,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                shape: BoxShape.rectangle,
                color: MyColor.white),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.02, vertical: Get.height * 0.02),
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        AddImage.homeLogo,
                        height: Get.height * 0.05,
                      ),
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                      Obx(() => Form(
                            key: loginController.formKey,
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  controller: loginController.emailController,
                                  decoration: const InputDecoration(
                                    suffixIcon: Icon(
                                      Icons.account_circle_rounded,
                                      color: MyColor.nevyBlue,
                                    ),
                                    labelText: 'Enter Email Id',
                                    border: OutlineInputBorder(),
                                    errorStyle: TextStyle(color: Colors.red),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter an email';
                                    }
                                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                        .hasMatch(value)) {
                                      return 'Please enter a valid email';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 20),
                                TextFormField(
                                  controller:
                                      loginController.passwordController,
                                  decoration: InputDecoration(
                                    suffixIcon: InkWell(
                                      onTap: loginController.showPassword,
                                      child:
                                          loginController.isViewPassword.value
                                              ? Icon(
                                                  Icons.visibility_off,
                                                  color: MyColor.nevyBlue,
                                                )
                                              : Icon(Icons.visibility,
                                                  color: MyColor.nevyBlue),
                                    ),
                                    labelText: 'Enter Password',
                                    border: const OutlineInputBorder(),
                                    errorStyle: TextStyle(color: Colors.red),
                                  ),
                                  obscureText:
                                      loginController.isViewPassword.value,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a password';
                                    }
                                    if (value.length < 6) {
                                      return 'Password must be at least 6 characters';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    Obx(
                                      () => Checkbox(
                                        value: loginController.rememberMe.value,
                                        onChanged: (bool? value) {
                                          loginController.rememberMe.value =
                                              value ?? false;
                                        },
                                      ),
                                    ),
                                    GlobalText('Remember me'),
                                    SizedBox(
                                      width: Get.width * 0.1,
                                    ),
                                    InkWell(
                                      onTap: () =>
                                          loginController.forgotPassword(),
                                      child: GlobalText(
                                        'Forgot your Password?',
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    loginController.submit();
                                    //Get.to(() => OperatorView());
                                    Get.to(() => CustomerView());
                                  },
                                  child: Container(
                                    height: Get.height * 0.05,
                                    width: Get.width,
                                    decoration: BoxDecoration(
                                        color: MyColor.nevyBlue,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Center(
                                        child: GlobalText(
                                      'Login',
                                      fontSize: Get.height * 0.02,
                                      color: MyColor.white,
                                    )),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: RichText(
                                    text: TextSpan(
                                      text: "Don't have an account? ",
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 16),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'Sign Up',
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 16,
                                              decoration:
                                                  TextDecoration.underline),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Get.to(() => RequestLocation());
                                            },
                                        ),
                                        TextSpan(
                                          text: ' to become customer',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ))
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
