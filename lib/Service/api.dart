import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:twentyfourby_seven/Operator/operatorController.dart';
import 'package:twentyfourby_seven/Service/constant.dart';
import 'package:twentyfourby_seven/SignUp/signUpController.dart';
import 'package:twentyfourby_seven/Utils/SharedPrefrance.dart';
import 'package:twentyfourby_seven/models/OperatorModel.dart';

Map<String, dynamic>? data;
var operatorController = Get.put(OperatorController());
var signController = Get.put(SignupController());

Future<void> login() async {
  final url = Uri.parse(ApiURl.userLoginUrl);
  final headers = <String, String>{
    'Content-Type': 'application/json',
  };
  final body = jsonEncode({
    'email': 'admin@gmail.com',
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
      SharedPrefs.putString('Token', token);
      //var viewToken = SharedPrefs.getString('Token');
      log('ViewToken==>$token');
      log('jsonResponse==>$jsonResponse');
    } else {
      log('Failed to login: ${response.statusCode}');
    }
  } catch (e) {
    log('Error: $e');
  }
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
