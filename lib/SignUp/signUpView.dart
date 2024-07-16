import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twentyfourby_seven/SignUp/signUpController.dart';
import 'package:twentyfourby_seven/Utils/globalText.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});
  final signUpController = Get.put(SignupController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SignupController>(builder: (signUpController) {
        return ListView(
          children: [
            Center(
                child: GlobalText(
              'SIGN UP TO INCREASE YOUR BUSINESS',
              fontWeight: FontWeight.w700,
              fontSize: Get.height * 0.02,
            )),
            Form(
              key: signUpController.formKey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: signUpController.businessNameController,
                        decoration: InputDecoration(
                          labelText: 'Business Name',
                          hintText: 'Enter Business Name',
                          errorText: signUpController
                                  .businessNameController.text.isEmpty
                              ? 'This field is required'
                              : null,
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a business name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: Get.height * 0.015),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: Get.width * 0.25,
                            child: TextFormField(
                              controller: signUpController.firstNameController,
                              decoration: InputDecoration(
                                labelText: 'first Name',
                                hintText: 'Enter First Name',
                                errorText: signUpController
                                        .firstNameController.text.isEmpty
                                    ? 'This field is required'
                                    : null,
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a first name';
                                }
                                return null;
                              },
                            ),
                          ),
                          Container(
                            width: Get.width * 0.25,
                            child: TextFormField(
                              controller: signUpController.lastNameController,
                              decoration: InputDecoration(
                                labelText: 'lastName Name',
                                hintText: 'Enter LastName Name',
                                errorText: signUpController
                                        .lastNameController.text.isEmpty
                                    ? 'This field is required'
                                    : null,
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a business name';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        controller: signUpController.phoneNumberController,
                        decoration: InputDecoration(
                          labelText: 'phone Number',
                          hintText: 'Enter phone Number',
                          errorText: signUpController
                                  .phoneNumberController.text.isEmpty
                              ? 'This field is required'
                              : null,
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please a phone Number';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: Get.height * 0.015),
                      TextFormField(
                        controller: signUpController.emailController,
                        decoration: InputDecoration(
                          labelText: 'Add Email',
                          hintText: 'Enter EmailId',
                          errorText:
                              signUpController.emailController.text.isEmpty
                                  ? 'This field is required'
                                  : null,
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a valid Email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: Get.height * 0.015),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: Get.width * 0.25,
                            child: TextFormField(
                              controller: signUpController.password,
                              decoration: InputDecoration(
                                labelText: 'password',
                                hintText: 'Enter Password',
                                errorText:
                                    signUpController.password.text.isEmpty
                                        ? 'This field is required'
                                        : null,
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a password';
                                }
                                return null;
                              },
                            ),
                          ),
                          Container(
                            width: Get.width * 0.25,
                            child: TextFormField(
                              controller: signUpController.confirmPassword,
                              decoration: InputDecoration(
                                labelText: 'Confirm Password',
                                hintText: 'Enter Confirm Password',
                                errorText: signUpController
                                        .confirmPassword.text.isEmpty
                                    ? 'This field is required'
                                    : null,
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a business name';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: Get.height * 0.015),
                      TextFormField(
                        controller: signUpController.businessAdd,
                        decoration: InputDecoration(
                          labelText: 'Add BusinessAddress',
                          hintText: 'Enter Business Address',
                          errorText: signUpController.businessAdd.text.isEmpty
                              ? 'This field is required'
                              : null,
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a Business Address';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: Get.height * 0.015),
                      Row(
                        children: [
                          Obx(
                            () => DropdownButton<String>(
                              hint: const Text('Select a Country'),
                              value: signUpController.selectedCountry.value,
                              onChanged: (String? newValue) {
                                signUpController.selectedCountry.value =
                                    newValue;
                              },
                              items: signUpController.countries
                                  .map<DropdownMenuItem<String>>((country) {
                                return DropdownMenuItem<String>(
                                  value: country,
                                  child: Text(country),
                                );
                              }).toList(),
                            ),
                          ),
                          SizedBox(
                            width: Get.width * 0.05,
                          ),
                          Obx(
                            () => Container(
                              width: Get.width * 0.23,
                              child: DropdownButton<String>(
                                hint: GlobalText('Select a State'),
                                value: signUpController.selectedState.value,
                                onChanged: (String? newValue) {
                                  signUpController.selectedState.value =
                                      newValue;
                                },
                                items: signUpController.states
                                    .map<DropdownMenuItem<String>>((state) {
                                  return DropdownMenuItem<String>(
                                    value: state,
                                    child: GlobalText(state),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: Get.height * 0.015),
                      Row(
                        children: [
                          Obx(
                            () => DropdownButton<String>(
                              hint: const Text('Select a city'),
                              value: signUpController.selectedCountry.value,
                              onChanged: (String? newValue) {
                                signUpController.selectedCountry.value =
                                    newValue;
                              },
                              items: signUpController.countries
                                  .map<DropdownMenuItem<String>>((country) {
                                return DropdownMenuItem<String>(
                                  value: country,
                                  child: Text(country),
                                );
                              }).toList(),
                            ),
                          ),
                          SizedBox(
                            width: Get.width * 0.05,
                          ),
                          Obx(
                            () => Container(
                              width: Get.width * 0.23,
                              child: TextFormField(
                                controller: signUpController.postalController,
                                decoration: InputDecoration(
                                  labelText: 'Add postalCode',
                                  hintText: 'Enter PostalCode',
                                  errorText: signUpController
                                          .postalController.text.isEmpty
                                      ? 'This field is required'
                                      : null,
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a PostalCode';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: Get.width * 0.05,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (signUpController.formKey.currentState!
                              .validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: GlobalText('Processing Data')));
                          }
                        },
                        child: GlobalText('Send'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
