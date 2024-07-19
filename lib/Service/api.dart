import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:twentyfourby_seven/Operator/operatorController.dart';
import 'package:twentyfourby_seven/Service/constant.dart';
import 'package:twentyfourby_seven/SignUp/signUpController.dart';
import 'package:twentyfourby_seven/Utils/SharedPrefrance.dart';
import 'package:twentyfourby_seven/models/OperatorModel.dart';
import 'package:twentyfourby_seven/models/customerMailModel.dart';

Map<String, dynamic>? data;
var operatorController = Get.put(OperatorController());
var signController = Get.put(SignupController());

Future<void> login() async {
  final url = Uri.parse(ApiURl.userLoginUrl);
  final headers = <String, String>{
    'Content-Type': 'application/json',
  };
  final body = jsonEncode({
    'email': 'ashutosh@yopmail.com',
    'password': '123456',
  });

  try {
    final response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      String token = jsonResponse['token'].toString();
      String customerID = jsonResponse['data']['_id'];
      String firstName = jsonResponse['data']['fname'];
      String lastName = jsonResponse['data']['lname'];
      SharedPrefs.putString('Token', token);
      SharedPrefs.putString('cID', customerID);
      SharedPrefs.putString('firstNAme', firstName);
      SharedPrefs.putString('lastNAme', lastName);
      var viewCID = SharedPrefs.getString('cID');
      //log('jsonResponse==>${jsonResponse['data']}');
    } else {
      log('Failed to login: ${response.statusCode}');
    }
  } catch (e) {
    log('Error: $e');
  }
}

Future<CustomerMailModel?> getCustomerApi() async {
  final url = Uri.parse(
      'https://service.24x7mail.com/assign?request_comple%E2%80%A6&user_id=667d923246b74b03f473b3a7&page=1&limit=10');

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = CustomerMailModel.fromJson(jsonDecode(response.body));
      log('customerData==>$jsonData');
      return jsonData;
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    print('Error: $e');
  } finally {}
}

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
      log('checkStatus $checkStatus');
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
    if (response.statusCode == 200) {
      var deleteResponse = jsonDecode(response.body);
      log('deleteResponse=>$deleteResponse');
    }
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

      signController.setStates(stateNames);
      log('stateNames ${stateNames}');
    } else {
      log('Server error: ${response.statusCode}');
    }
  } catch (e) {
    log('Network error: $e');
  }
}

Future<void> fetchCountries() async {
  final response = await http.get(Uri.parse(ApiURl.getCountryApi));
  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    if (data['status'] == true) {
      operatorController.countries = data['data'];
    }
  } else {
    throw Exception('Failed to load countries');
  }
}
