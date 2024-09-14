import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:twentyfourby_seven/Login/loginController.dart';
import 'package:twentyfourby_seven/Operator/operatorController.dart';
import 'package:twentyfourby_seven/Service/constant.dart';
import 'package:twentyfourby_seven/SignUp/signUpController.dart';
import 'package:twentyfourby_seven/Utils/SharedPrefrance.dart';
import 'package:twentyfourby_seven/customer_Address/shipment_customer/shipmentController.dart';
import 'package:twentyfourby_seven/models/OperatorModel.dart';
import 'package:twentyfourby_seven/models/customerMailModel.dart';
import 'package:twentyfourby_seven/models/profileModel.dart';
import 'package:twentyfourby_seven/models/statementModell.dart';

import '../Utils/Mycolor.dart';
import '../Utils/globalText.dart';
import '../customer_Address/customer_AddController.dart';
import '../models/operatorHomeModel.dart';
import '../models/packageModel.dart';
import '../models/shipmentModel.dart';
import '../models/shipmentstatus_model.dart';
import '../models/uploadImageModel.dart';
import '../operator_models/AssignMailModel.dart';
import '../operator_models/closeAccountModel.dart';
import '../operator_models/mailManagementModelOP.dart';
import '../operator_models/operationModel.dart';
import '../operator_models/operatorOperationModel.dart';
import '../operator_models/operator_settings.dart';
import '../operator_models/statementReportModel.dart';

var operatorController = Get.put(OperatorController());
var signController = Get.put(SignupController());
var customerAddCtrl = Get.put(ShipmentController());
var getCustomerAdd = Get.put(CustomerAddController());
var loginCtrl = Get.put(LoginController());
void showLoginErrorDialog(String mes) {
  Get.defaultDialog(
    backgroundColor: MyColor.backgroundLogin,
    title: 'Please check your credentials',
    titleStyle: const TextStyle(
      color: MyColor.colorRedHome,
      fontWeight: FontWeight.w700,
    ),
    middleText: mes,
    confirm: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: MyColor.cardIColorIndigo,
      ),
      onPressed: () => Get.back(),
      child: const GlobalText(
        'Ok',
        fontWeight: FontWeight.w700,
        color: MyColor.white,
      ),
    ),
  );
}

Future<Map<String, dynamic>?> login(String email, String password) async {
  final url = Uri.parse(ApiURl.userLoginUrl);
  final body = {
    'email': email,
    'password': password,
  };

  try {
    loginCtrl.isLoginData = true.obs;

    final response = await http.post(url, body: body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      final responseData = jsonDecode(response.body);
      log('response with model $responseData}');
      loginCtrl.isLoginData = true.obs;
      if (responseData['token'] != null && responseData['data'] != null) {
        final data = responseData['data'];
        final token = responseData['token'] ?? '';
        final userId = data['_id'] ?? '';
        final userType = data['user_type'] ?? '';

        log('user current id $userId');
        SharedPrefs.putString('Token', token);
        SharedPrefs.putString('userId', userId);

        if (userType == 'user') {
          _storeUserDetails(data, userId);
        } else if (userType == 'operator') {
          _storeOperatorDetails(data, userId);
        } else {
          Get.snackbar('Error', 'Invalid user type: $userType');
          return null;
        }
        return responseData;
      } else {
        log('Invalid response data');
        showLoginErrorDialog(responseData['msg'] ?? 'Login failed.');
        return null;
      }
    } else {
      log('Failed request: ${response.statusCode}');
      showLoginErrorDialog('Failed with status code ${response.statusCode}');
      return null;
    }
  } catch (e) {
    log('Error: $e');
    showLoginErrorDialog(e.toString());
    return null;
  } finally {
    loginCtrl.isLoginData = false.obs;
  }
}

void _storeUserDetails(Map<String, dynamic> data, String userId) {
  SharedPrefs.putString('customerId', userId);
  final firstName = data['fname'] ?? '';
  final lastName = data['lname'] ?? '';
  final email = data['email'] ?? '';
  final password = data['password'] ?? '';

  SharedPrefs.putString('firstName', firstName);
  SharedPrefs.putString('lastName', lastName);
  SharedPrefs.putString('emailId', email);
  SharedPrefs.putString('password', password);
}

void _storeOperatorDetails(Map<String, dynamic> data, String userId) {
  SharedPrefs.putString('operatorId', userId);
  final firstNameOp = data['f_name'] ?? '';
  final lastNameOp = data['l_name'] ?? '';
  final emailOp = data['email'] ?? '';
  final passwordOp = data['password'] ?? '';

  SharedPrefs.putString('firstNameOp', firstNameOp);
  SharedPrefs.putString('lastNameOp', lastNameOp);
  SharedPrefs.putString('emailIdOp', emailOp);
  SharedPrefs.putString('passwordOp', passwordOp);
}

Future<void> deleteAccountCustomer() async {
  var userID = SharedPrefs.getString('userId');

  String baseUrl = 'https://service.24x7mail.com/user/soft-delete/$userID';

  var token = SharedPrefs.getString('Token');

  try {
    var response = await http.delete(
      Uri.parse(baseUrl),
      headers: {
        'Authorization': token,
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      log('deleted Id successfully: ${response.body}');
      Get.snackbar(
        "Deleted",
        "The account has been deleted successfully",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    } else {
      log('Failed to search mail: ${response.statusCode}');
    }
  } catch (e) {
    log('Error adding range: $e');
  }
}

Future<void> changePassword(
  String sendmail,
) async {
  var token = SharedPrefs.getString('Token');
  final url = Uri.parse('https://service.24x7mail.com/user/forgot-password');

  final response = await http.post(
    url,
    headers: {'Authorization': token},
    body: {
      'email': sendmail,
    },
  );

  if (response.statusCode == 200 || response.statusCode == 201) {
    var forgetPassword = jsonDecode(response.body);
    Get.snackbar('${forgetPassword['msg']}', '');
    return forgetPassword;
  } else {
    log('Failed to change password: ${response.statusCode}');
  }
}

Future<CustomerMailModel?> getCustomerApi() async {
  var userID = SharedPrefs.getString('userId');

  final url = Uri.parse(
      'https://service.24x7mail.com/assign?request_comple%E2%80%A6&user_id=$userID&page=1&limit=10');

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = CustomerMailModel.fromJson(jsonDecode(response.body));
      //log('customerData==>$jsonData');
      return jsonData;
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    log('Error: $e');
  } finally {}
  return null;
}

Future<StatementModell?> getStatementApi() async {
  try {
    var userID = SharedPrefs.getString('userId');
    final response =
        await http.get(Uri.parse('${ApiURl.getStatementUrl}$userID'));
    if (response.statusCode == 200) {
      log('stat statuscode ${response.statusCode}');
      final jsonResponse = jsonDecode(response.body);
      final statement = StatementModell.fromJson(jsonResponse);

      return statement;
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    log('Error: $e');
  } finally {}
  return StatementModell();
}

Future<UserModel?> getProfileApi() async {
  try {
    var token = SharedPrefs.getString('Token');
    log('profileURl ${ApiURl.getProfileApi}');
    final response = await http.get(
      Uri.parse(ApiURl.getProfileApi),
      headers: {
        'Authorization': token,
      },
    );
    log('Profile status-code ${response.statusCode}');

    if (response.statusCode == 200) {
      final jsonResponse = UserModel.fromJson(jsonDecode(response.body));
      log('profile==>$jsonResponse');
      log('response ${response.body}');

      return jsonResponse;
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    log('Error: $e');
  } finally {}
  return UserModel();
}

Future<UploadImageModel?> uploadImageOperator(
    String mailType, File file) async {
  try {
    var token = SharedPrefs.getString('Token');

    var request = http.MultipartRequest(
      'PATCH',
      Uri.parse('https://24x7mail.com/operator/mail/upload-new-mail'),
    );

    request.headers['Authorization'] = token;
    request.headers['Content-Type'] = 'multipart/form-data';

    request.files.add(await http.MultipartFile.fromPath(
      'file',
      file.path,
      filename: basename(file.path),
    ));

    request.fields['mailType'] = mailType;

    var response = await request.send();
    log('image upload review ${response.statusCode}');
    if (response.statusCode == 200 || response.statusCode == 201) {
      var responseBody = await http.Response.fromStream(response);

      var jsonResponse = json.decode(responseBody.body);
      var uploaded = UploadImageModel.fromJson(jsonResponse);
      Get.snackbar('file upload', uploaded.msg.toString());
      return uploaded;
    } else {
      var responseBody = await http.Response.fromStream(response);
      throw Exception('Failed to upload file: ${responseBody.reasonPhrase}');
    }
  } catch (e) {
    log('Error: $e');
    return null;
  }
}

Future<void> getShipment() async {
  try {
    var userID = SharedPrefs.getString('userId');
    var token = SharedPrefs.getString('Token');

    final response = await http.get(
      Uri.parse(
          'https://service.24x7mail.com/assign/shipment-list?username=customer&id=$userID'),
      headers: {
        'Authorization': token,
      },
    );
    log('shipment ${response.statusCode}');
    log('shipment==>${response.body}');

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      return jsonResponse;
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    log('Error: $e');
  } finally {}
}

Future<ShipmentstatusModel?> pastShipmentList() async {
  try {
    var userID = SharedPrefs.getString('userId');
    var token = SharedPrefs.getString('Token');

    final response = await http.get(
      Uri.parse(
          'https://service.24x7mail.com/assign?&search=&fromDate=&toDate=&user_id=$userID&page=1&limit=10&current_status=shipment_complete'),
      // Uri.parse('https://service.24x7mail.com/assign?&search=&fromDate=&toDate=&user_id=$userID&page=1&limit=10&current_status=shipment_complete'),
      headers: {
        'Authorization': token,
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final jsonResponse =
          ShipmentstatusModel.fromJson(jsonDecode(response.body));

      return jsonResponse;
    } else {
      log('Failed to load data: ${response.reasonPhrase}');
      throw Exception('Failed to load data: ${response.reasonPhrase}');
    }
  } catch (e) {
    log('Error: $e');
    rethrow;
  }
}

Future<ShipmentstatusModel?> pendingShipmentList() async {
  try {
    var userID = SharedPrefs.getString('userId');
    var token = SharedPrefs.getString('Token');

    final response = await http.get(
      Uri.parse(
          'https://service.24x7mail.com/assign?&search=&fromDate=&toDate=&user_id=$userID&page=1&limit=10&current_status=past-shipment-list'),
      headers: {
        'Authorization': token,
      },
    );
    log('pendingList ${response.statusCode}');
    log('==>${response.body}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      final jsonResponse =
          ShipmentstatusModel.fromJson(jsonDecode(response.body));

      return jsonResponse;
    } else {
      log('Failed to load data: ${response.reasonPhrase}');
      throw Exception('Failed to load data: ${response.reasonPhrase}');
    }
  } catch (e) {
    log('Error: $e');
    rethrow;
  }
}

Future<ShipmentstatusModel?> pickedUpList() async {
  try {
    var userID = SharedPrefs.getString('userId');
    var token = SharedPrefs.getString('Token');

    final response = await http.get(
      Uri.parse(
          'https://service.24x7mail.com/assign?&search=&fromDate=&toDate=&user_id=$userID&page=1&limit=10&current_status=local_pickup_complete'),
      headers: {
        'Authorization': token,
      },
    );
    log('pendingList ${response.statusCode}');
    log('==>${response.body}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      final jsonResponse =
          ShipmentstatusModel.fromJson(jsonDecode(response.body));

      return jsonResponse;
    } else {
      log('Failed to load data: ${response.reasonPhrase}');
      throw Exception('Failed to load data: ${response.reasonPhrase}');
    }
  } catch (e) {
    log('Error: $e');
    rethrow;
  }
}

//https://24x7mail.com/user/inbox/past-shipment-list
/// Get All customer
/// https://service.24x7mail.com/assign/shipment-list-added

Future<OperatorModel?> getOperatorApi() async {
  try {
    final response = await http.get(Uri.parse(ApiURl.operatorUrl));
    if (response.statusCode == 200) {
      var temp = OperatorModel.fromJson(jsonDecode(response.body));
      return temp;
    } else {
      log('Server error: ${response.statusCode}');
    }
  } catch (e) {
    log('Network error: $e');
  }
  return OperatorModel();
}

Future<void> postOperatorRejectApi(String uId) async {
  try {
    final response = await http
        .post(Uri.parse(ApiURl.postOperatorReject), body: {'user_id': uId});
    if (response.statusCode == 200) {
      var checkStatus = jsonDecode(response.body);
      return checkStatus;
    } else {
      log('Server error: ${response.statusCode}');
    }
  } catch (e) {
    log('Network error: $e');
  }
}

Future<void> deleteOperator() async {
  try {
    final response = await http.delete(Uri.parse(ApiURl.deleteOperatorApi));
    if (response.statusCode == 200) {}
  } catch (e) {
    log('manage $e');
  }
}

Future<void> getViewState() async {
  try {
    final response = await http.get(Uri.parse(ApiURl.getStateUrl));
    if (response.statusCode == 200) {
      final Map<String, dynamic> parsedJson = json.decode(response.body);
      final List<dynamic> stateData = parsedJson['data'];
      final List<String> stateNames =
          stateData.map((state) => state['name'] as String).toList();

      final List<String> stateIds =
          stateData.map((state) => state['state_id'] as String).toList();

      log('stateDetails==> $stateNames');
      //log('stateIds==> $stateIds');
      signController.setStates(stateNames);
      customerAddCtrl.setStates(stateNames);
    } else {
      log('Server error: ${response.statusCode}');
    }
  } catch (e) {
    log('Network error: $e');
  }
}

Future<ShipmentModel?> getSTatedata() async {
  const String apiUrl = 'https://service.24x7mail.com/state/233';
  try {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200 || response.statusCode == 201) {
      final jsonResponse = jsonDecode(response.body);

      final stateModel = ShipmentModel.fromJson(jsonResponse);
      log('json Response of GetState==> ${stateModel}');

      return stateModel;
    } else {
      throw Exception('Failed to load city list');
    }
  } catch (e) {
    log('Error: $e');
    return ShipmentModel();
  }
}

Future<void> fetchCityList() async {
//Future<List<String>> fetchCityList(int stateId) async {
  const String apiUrl = 'https://service.24x7mail.com/city/1400';

  try {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200 || response.statusCode == 201) {
      final Map<String, dynamic> parsedCityJson = json.decode(response.body);
      final List<dynamic> cityData = parsedCityJson['data'];
      List<String> cityList = cityData.map((city) {
        return city['name'].toString();
      }).toList();

      customerAddCtrl.setStatesCities(cityList);
    } else {
      throw Exception('Failed to load city list');
    }
  } catch (e) {
    log('Error: $e');
  }
}

Future<PackageModel?> subscriptionApi() async {
  try {
    var token = SharedPrefs.getString('Token');

    final response = await http.get(
      Uri.parse('https://service.24x7mail.com/package'),
      headers: {
        'Authorization': token,
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      final jsonResponse = jsonDecode(response.body);

      final subscriptionModel = PackageModel.fromJson(jsonResponse);
      return subscriptionModel;
    } else {
      log('Failed to load data, Status Code: ${response.statusCode}');
      throw Exception('Failed to load data');
    }
  } catch (e) {
    log('Error: $e');
  }
  return PackageModel();
}

Future<ShipmentstatusModel> getTrashList() async {
  var token = SharedPrefs.getString('Token');
  final response = await http.get(
    Uri.parse(ApiURl.getTraceList),
    headers: {
      'Authorization': token,
    },
  );
  if (response.statusCode == 200) {
    final traceListDta =
        ShipmentstatusModel.fromJson(jsonDecode(response.body));

    return traceListDta;
  } else {
    throw Exception('Failed to load traceList');
  }
}

Future<CustomerMailModel> getReadList(bool isRead) async {
  var token = SharedPrefs.getString('Token');
  var userID = SharedPrefs.getString('userId');

  var url =
      'https://service.24x7mail.com/assign?&search=&fromDate=&toDate=&user_id=$userID&page=1&limit=10&read=$isRead';
  final response = await http.get(
    Uri.parse(url),
    headers: {
      'Authorization': token,
    },
  );

  if (response.statusCode == 200) {
    final readListData = CustomerMailModel.fromJson(jsonDecode(response.body));
    return readListData;
  } else {
    throw Exception('Failed to load readList');
  }
}

Future<CustomerMailModel?> getViewIndexData(String? fromDate, toDate) async {
  var userID = SharedPrefs.getString('userId');
  var token = SharedPrefs.getString('Token');
  final response = await http.get(
    Uri.parse(
        'https://service.24x7mail.com/assign?request_completed=true&&search=&$fromDate=&$toDate=&user_id=$userID&page=1&limit=10'),
    headers: {
      'Authorization': token,
    },
  );

  if (response.statusCode == 200 || response.statusCode == 201) {
    var responseData = CustomerMailModel.fromJson(jsonDecode(response.body));

    return responseData;
  } else {
    throw Exception('Failed to load traceList');
  }
}

Future<void> getSOftStatement() async {
  var token = SharedPrefs.getString('Token');
  final response = await http.get(
    Uri.parse('https://service.24x7mail.com/user/soft-cash'),
    headers: {
      'Authorization': token,
    },
  );
  if (response.statusCode == 200 || response.statusCode == 201) {
    var responseData = jsonDecode(response.body);
    if (responseData['status'] == true && responseData['data'] != null) {
      var softCash = responseData['data']['soft_cash'];
      getCustomerAdd.softCash.value = softCash;
      log('Soft Cash: ${softCash}');

      return responseData;
    } else {
      throw Exception('Failed to load traceList');
    }
  }
}

Future<void> uploadUspsData(Map<String, dynamic> updates) async {
  var token = SharedPrefs.getString('Token');
  final url = Uri.parse("https://service.24x7mail.com/user/usps-upload");

  final response = await http.patch(
    url,
    headers: {
      "Content-Type": "application/json",
      'Authorization': token,
    },
    body: jsonEncode(updates),
  );

  if (response.statusCode == 200) {
    log('Success: ${response.body}');
  } else {
    log('Error: ${response.statusCode} ${response.body}');
  }
}

void submitShippingAddress() async {
  var userID = SharedPrefs.getString('userId');
  var token = SharedPrefs.getString('Token');
  const String url = "https://service.24x7mail.com/shipping-address";

  final Map<String, dynamic> body = {
    "name": customerAddCtrl.nameController.text,
    "company": customerAddCtrl.companyController.text,
    "address1": customerAddCtrl.addLineOneController.text,
    "address2": customerAddCtrl.addLineTwoController.text,
    "country": {
      "country_id": "233",
      "name": customerAddCtrl.selectedCountry.toString()
    },
    "state": {
      "country_id": "233",
      "state_id": 1456,
      "name": customerAddCtrl.selectedState.toString()
    },
    "city": {
      "state_id": 1456,
      "city_id": 111146,
      "name": customerAddCtrl.selectedCity.toString()
    },
    "postal_code": customerAddCtrl.postolController.text,
    "phone": customerAddCtrl.phoneController.text,
    "user_id": userID
  };

  try {
    final response = await GetConnect().post(
      url,
      body,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': token,
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      Get.snackbar("Success", "Shipping address submitted successfully!");
    } else {
      Get.snackbar(
          "Error", "Failed to submit shipping address: ${response.statusText}");
    }
  } catch (e) {
    log('Error occurred: $e');
    Get.snackbar("Error",
        "An error occurred while submitting the shipping address. Please try again.");
  }
}

Future<ShipmentModel?> getShipiingList() async {
  var token = SharedPrefs.getString('Token');
  const String url =
      "https://service.24x7mail.com/shipping-address/address-list";
  final response = await http.get(
    Uri.parse(url),
    headers: {
      'Authorization': token,
    },
  );
  if (response.statusCode == 200) {
    var shipmentData = ShipmentModel.fromJson(jsonDecode(response.body));

    return shipmentData;
  } else {
    Get.snackbar(
        "Error", "Failed to submit shipping address: ${response..statusCode}");
  }
  return ShipmentModel();
}

///scan request patch
Future<void> scanRequestPatchApi(String scanRequest) async {
  try {
    var token = SharedPrefs.getString('Token');
    var userID = SharedPrefs.getString('userId');

//scan-request
    final Map<String, dynamic> payload = {
      "ids": [userID]
    };

    final response = await http.patch(
      Uri.parse('https://service.24x7mail.com/assign/$scanRequest'),
      headers: {
        'Authorization': token,
        'Content-Type': 'application/json',
      },
      body: json.encode(payload),
    );
    log('response dialogu ${response.body}');
    if (response.statusCode == 200 || response.statusCode == 201) {
      final patchResponse = jsonDecode(response.body);
      Get.snackbar(' Request', patchResponse['msg'].toString());
      return patchResponse;
    } else {
      log('Failed to load patchRequest: ${response.reasonPhrase}');
      throw Exception('Failed to load data: ${response.reasonPhrase}');
    }
  } catch (e) {
    log('Error: $e');
    rethrow;
  }
}

Future<UploadImageModel?> uploadUspsFile(File file, String userId) async {
  try {
    var token = SharedPrefs.getString('Token');

    var request = http.MultipartRequest(
      'PATCH',
      Uri.parse('https://service.24x7mail.com/user/usps-upload'),
    );

    request.headers['Authorization'] = token;
    request.headers['Content-Type'] = 'multipart/form-data';

    request.files.add(await http.MultipartFile.fromPath(
      'file',
      file.path,
      filename: basename(file.path),
    ));

    request.fields['user_id'] = userId;

    var response = await request.send();
    log('image upload review ${response.statusCode}');
    if (response.statusCode == 200 || response.statusCode == 201) {
      var responseBody = await http.Response.fromStream(response);

      var jsonResponse = json.decode(responseBody.body);
      var uploaded = UploadImageModel.fromJson(jsonResponse);
      Get.snackbar('file upload', uploaded.msg.toString());
      return uploaded;
    } else {
      var responseBody = await http.Response.fromStream(response);
      throw Exception('Failed to upload file: ${responseBody.reasonPhrase}');
    }
  } catch (e) {
    log('Error: $e');
    return null;
  }
}

///https://service.24x7mail.com/assign/scan-request
///https://service.24x7mail.com/assign/add-shipment
///{ids: ["669a168923ba32ee0e468379"]}
///https://service.24x7mail.com/assign/recycle-request
///https://service.24x7mail.com/assign/shred-request
///https://service.24x7mail.com/assign/rescan-request
///https://service.24x7mail.com/pickup/request
///upload api payload
//file: (binary)
// user_id: 667d923246b74b03f473b3a7

///OpertorApi Data
///https://service.24x7mail.com/user/customer-list-by-feature/667c046a9503bee4ce480c04?search=&page=1&limit=10
///https://service.24x7mail.com/operator/single?id=667c03b54f19c733a01bcb9c
Future<OperatorHomeModel?> getOperatorRequestApi() async {
  var token = SharedPrefs.getString('Token');
  var userID = SharedPrefs.getString('userId');

  final response = await http.get(
    // Uri.parse('${ApiURl.operatorHomeApi}+${'667c03b54f19c733a01bcb9c'}'),
    Uri.parse('https://service.24x7mail.com/assign/status-count/$userID'),
    headers: {
      'Authorization': token,
    },
  );
  log('operatorHome ${response.body}');

  if (response.statusCode == 200 || response.statusCode == 201) {
    var OperatorData = OperatorHomeModel.fromJson(jsonDecode(response.body));

    log('operatorHomeList=> $OperatorData');
    return OperatorData;
  } else {
    Get.snackbar(
        "Error", "Failed to submit operator Request: ${response..statusCode}");
  }
  return OperatorHomeModel();
}

Future<UploadImageModel?> operatorCustomerList() async {
  var token = SharedPrefs.getString('Token');
  var userID = SharedPrefs.getString('userId');

  try {
    final response = await http.get(
      Uri.parse(
          'https://service.24x7mail.com/user/customer-list-by-feature/$userID?search=&page=1&limit=10'),
      headers: {
        'Authorization': token,
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      operatorController.isLoadingCustomer.value == true;
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      log('jsonResponse: $jsonResponse');

      var modelParsed = UploadImageModel.fromJson(jsonResponse);

      log('Parsed UploadImageModel: ${modelParsed.msg} items found.');

      return modelParsed;
    } else {
      log('Failed to load customer list: ${response.statusCode}');
      return null;
    }
  } catch (e) {
    operatorController.isLoadingCustomer.value == false;

    log('Exception occurred: $e');
    return null;
  }
}

Future<OperatorAddModel?> getOperatorSettingApi() async {
  var token = SharedPrefs.getString('Token');
  var userID = SharedPrefs.getString('userId');

  final response = await http.get(
    Uri.parse('https://service.24x7mail.com/operator/single?id=$userID'),
    headers: {
      'Authorization': token,
    },
  );
  if (response.statusCode == 200 || response.statusCode == 201) {
    var operatorData = OperatorAddModel.fromJson(jsonDecode(response.body));

    log('Operator setting with model=> ${operatorData.msg}');
    return operatorData;
  } else {
    Get.snackbar("Error",
        "Failed to submit operator setting View: ${response..statusCode}");
  }
  return OperatorAddModel();
}

Future<void> operatorChangePassword(String oldPassword, newPassword) async {
  var token = SharedPrefs.getString('Token');
  final url = Uri.parse('https://api.24x7mail.com/user/change-password');

  final response = await http.post(url,
      headers: {'Authorization': token},
      body: jsonEncode(
          {"currentPassword": oldPassword, "newPassword": newPassword}));

  if (response.statusCode == 200 || response.statusCode == 201) {
    var forgetPassword = jsonDecode(response.body);
    Get.snackbar(' Operator password ${forgetPassword['msg']}', '');
    return forgetPassword;
  } else {
    log('Failed to change password: ${response.statusCode}');
  }
}

Future<void> updateOperatorProfile(
  String fname,
  String lName,
  String bName,
  String buAdd,
  String phoneN,
  String zipNumber,
) async {
  const String baseUrl = 'https://service.24x7mail.com/operator/profile-update';
  var token = SharedPrefs.getString('Token');

  var body = {
    "f_name": fname,
    "l_name": lName,
    "business_name": bName,
    "business_address": buAdd,
    "phone": phoneN,
    "zip_code": zipNumber,
  };

  try {
    var response = await http.patch(
      Uri.parse(baseUrl),
      headers: {
        'Authorization': token,
      },
      body: body,
    );

    log('Response: ${response.body}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      log('Profile updated successfully: ${response.body}');
      Get.snackbar('Success', 'Profile updated successfully');
    } else {
      log('Failed to update profile: ${response.statusCode} - ${response.body}');
      Get.snackbar('Error', 'Failed to update profile: ${response.statusCode}');
    }
  } catch (e) {
    log('Error updating profile: $e');
    Get.snackbar('Error', 'An error occurred: $e');
  }
}

Future<void> addRange(String fromData, toData) async {
  var userID = SharedPrefs.getString('userId');

  const String baseUrl = 'https://service.24x7mail.com/operator/add-range';

  ///view status get Api  https://service.24x7mail.com/operator/single?id=667c04004f19c733a01bcba3

  var token = SharedPrefs.getString('Token');

  var body = {
    "id": "$userID",
    "range": {"from": fromData, "to": toData}
  };

  try {
    var response = await http.post(
      Uri.parse(baseUrl),
      headers: {
        'Authorization': token,
      },
      body: jsonEncode(body),
    );

    log('Response status: ${response.statusCode}');
    log('Response body: ${response.body}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      log('Range added successfully: ${response.body}');
      Get.snackbar('Success', 'Range added successfully');
    } else {
      log('Failed to add range: ${response.statusCode}');
      Get.snackbar('Error', 'Failed to add range: ${response.statusCode}');
    }
  } catch (e) {
    log('Error adding range: $e');
    Get.snackbar('Error', 'An error occurred: $e');
  }
}

Future<OperatorAddModel?> getOperatorReportOperationApi() async {
  var token = SharedPrefs.getString('Token');
  var userID = SharedPrefs.getString('userId');

  final response = await http.get(
    Uri.parse(
        'https://service.24x7mail.com/operator/customer-operation/$userID?limit=10&page_no=1'),
    headers: {
      'Authorization': token,
    },
  );
  if (response.statusCode == 200 || response.statusCode == 201) {
    var operatorData = OperatorAddModel.fromJson(jsonDecode(response.body));

    log('Operator report with model=> ${operatorData.msg}');
    return operatorData;
  } else {
    Get.snackbar("Error",
        "Failed to submit operator setting View: ${response..statusCode}");
  }
  return OperatorAddModel();
}

Future<OperationModel?> getOperatorReportCustomerApi() async {
  var token = SharedPrefs.getString('Token');
  var userID = SharedPrefs.getString('userId');

  final response = await http.get(
    Uri.parse(
        'https://service.24x7mail.com/operator/customer-operation/$userID?limit=10&page_no=1'),
    headers: {
      'Authorization': token,
    },
  );
  log('operatorHome ${response.body}');

  if (response.statusCode == 200 || response.statusCode == 201) {
    var OperatorData = OperationModel.fromJson(jsonDecode(response.body));

    log('operatorHomeList=> $OperatorData');
    return OperatorData;
  } else {
    Get.snackbar(
        "Error", "Failed to submit operator Request: ${response..statusCode}");
  }
  return OperationModel();
}

Future<OperatorOperationModel?> getOperatorReportOperationHOmeApi() async {
  var token = SharedPrefs.getString('Token');
  var userID = SharedPrefs.getString('userId');

  final response = await http.get(
    Uri.parse(
        'https://service.24x7mail.com/operator/operator-operation/$userID'),
    headers: {
      'Authorization': token,
    },
  );
  log('operatorHome ${response.body}');

  if (response.statusCode == 200 || response.statusCode == 201) {
    var OperatorData =
        OperatorOperationModel.fromJson(jsonDecode(response.body));

    log('operatorOperation=> $OperatorData');
    return OperatorData;
  } else {
    Get.snackbar(
        "Error", "Failed to submit operator Request: ${response..statusCode}");
  }
  return OperatorOperationModel();
}

Future<StatementReportModel?> statementReport() async {
  var token = SharedPrefs.getString('Token');
  var userID = SharedPrefs.getString('userId');

  final response = await http.get(
    Uri.parse('https://service.24x7mail.com/monthly-report/get-report/$userID'),
    headers: {
      'Authorization': token,
    },
  );
  log('operatorHome ${response.body}');

  if (response.statusCode == 200 || response.statusCode == 201) {
    var OperatorData = StatementReportModel.fromJson(jsonDecode(response.body));

    log('sttementReport=> $OperatorData');
    return OperatorData;
  } else {
    Get.snackbar(
        "Error", "Failed to submit operator Request: ${response..statusCode}");
  }
  return StatementReportModel();
}

Future<CloseAccountModel?> getDeleteCustomerList() async {
  var token = SharedPrefs.getString('Token');
  var userID = SharedPrefs.getString('userId');

  final response = await http.get(
    Uri.parse(
        'https://service.24x7mail.com/operator/delete-customer-list/$userID'),
    headers: {
      'Authorization': token,
    },
  );
  log('deleteCustomer ${response.body}');

  if (response.statusCode == 200 || response.statusCode == 201) {
    var OperatorData = CloseAccountModel.fromJson(jsonDecode(response.body));

    log('deleteCustomerList=> $OperatorData');
    return OperatorData;
  } else {
    Get.snackbar(
        "Error", "Failed to submit operator Request: ${response..statusCode}");
  }
  return CloseAccountModel();
}

Future<AssignMailModel?> getAssignMailPending(String mailStatus) async {
  var token = SharedPrefs.getString('Token');
  var userID = SharedPrefs.getString('userId');
  final response = await http.get(
    Uri.parse(
        'https://service.24x7mail.com/mails?operator=$userID&mail_status=$mailStatus&page=1&limit=9'),
    headers: {
      'Authorization': token,
    },
  );
  log('assignPending ${response.body}');

  if (response.statusCode == 200 || response.statusCode == 201) {
    var assignPending = AssignMailModel.fromJson(jsonDecode(response.body));

    return assignPending;
  } else {
    Get.snackbar(
        "Error", "Failed to submit assign Pending: ${response..statusCode}");
  }
  return AssignMailModel();
}

Future<MailManagementModelOp?> mailManagementOp(String manageMails) async {
  var token = SharedPrefs.getString('Token');
  var userID = SharedPrefs.getString('userId');
  final response = await http.get(
    Uri.parse(
        'https://service.24x7mail.com/assign?operator=$userID&current_status=$manageMails&search=&fromDate=&toDate=&page=1&limit=100'),
    headers: {
      'Authorization': token,
    },
  );
  log('MailManagementModelOp ${response.body}');

  if (response.statusCode == 200 || response.statusCode == 201) {
    var mailManagementModelOpData =
        MailManagementModelOp.fromJson(jsonDecode(response.body));

    log('MailManagementModelOp=> $mailManagementModelOpData');
    return mailManagementModelOpData;
  } else {
    Get.snackbar(
        "Error", "Failed to submit assign Pending: ${response..statusCode}");
  }
  return MailManagementModelOp();
}

Future<MailManagementModelOp?> mailManagementAssignOp() async {
  var token = SharedPrefs.getString('Token');
  var userID = SharedPrefs.getString('userId');
  final response = await http.get(
    Uri.parse(
        'https://service.24x7mail.com/assign?operator=$userID&page=1&limit=10&search=&fromDate=&toDate=&current_status='),
    headers: {
      'Authorization': token,
    },
  );
  log('MailManagementModelOp ${response.body}');

  if (response.statusCode == 200 || response.statusCode == 201) {
    var mailManagementModelOpData =
        MailManagementModelOp.fromJson(jsonDecode(response.body));

    log('MailManagementModelOp=> $mailManagementModelOpData');
    return mailManagementModelOpData;
  } else {
    Get.snackbar(
        "Error", "Failed to submit assign Pending: ${response..statusCode}");
  }
  return MailManagementModelOp();
}

Future<void> searchMail(String mailId) async {
  String baseUrl = 'https://service.24x7mail.com/mails?mail_id=$mailId';

  var token = SharedPrefs.getString('Token');

  try {
    var response = await http.get(
      Uri.parse(baseUrl),
      headers: {
        'Authorization': token,
      },
    );

    log('Search mail: ${response.body}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      log('mail successfully: ${response.body}');
      Get.snackbar('Success', 'send mail successfully');
    } else {
      log('Failed to search mail: ${response.statusCode}');
      Get.snackbar('Error', 'Failed to search mail: ${response.statusCode}');
    }
  } catch (e) {
    log('Error adding range: $e');
    Get.snackbar('Error', 'An error occurred: $e');
  }
}
