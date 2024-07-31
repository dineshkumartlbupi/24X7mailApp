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
import 'package:twentyfourby_seven/models/profileModel.dart';
import 'package:twentyfourby_seven/models/statementModell.dart';

import '../models/SubscriptionModel.dart';

Map<String, dynamic>? data;
var operatorController = Get.put(OperatorController());
var signController = Get.put(SignupController());

Future<void> login(String email, password) async {
  final url = Uri.parse(ApiURl.userLoginUrl);
  final headers = <String, String>{
    'Content-Type': 'application/json',
  };
  final body = jsonEncode({
    'email': email,
    'password': password,
    //'email': 'ashutosh@yopmail.com',
    //'password': '123456',
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
      String email = jsonResponse['data']['email'];
      String password = jsonResponse['data']['password'];
      log('emailll $email,$password');
      SharedPrefs.putString('emailId', email);
      SharedPrefs.putString('password', password);
      SharedPrefs.putString('Token', token);
      SharedPrefs.putString('cID', customerID);
      SharedPrefs.putString('firstNAme', firstName);
      SharedPrefs.putString('lastNAme', lastName);
      var viewCID = SharedPrefs.getString('cID');
      log('jsonResponse==>${jsonResponse['data']}');
    } else {
      log('Failed to login: ${response.statusCode}');
    }
  } catch (e) {
    log('Error: $e');
  }
}

Future<void> changePassword(String currentPassword, String newPassword) async {
  var token = SharedPrefs.getString('Token');
  final url = Uri.parse('https://service.24x7mail.com/user/change-password');

  final response = await http.patch(
    url,
    headers: {'Content-Type': 'application/json', 'Authorization': token},
    body: jsonEncode({
      'currentPassword': currentPassword,
      'newPassword': newPassword,
    }),
  );

  if (response.statusCode == 200) {
    log('Password changed successfully');
  } else {
    log('Failed to change password: ${response.statusCode}');
  }
}

Future<CustomerMailModel?> getCustomerApi() async {
  var userID = SharedPrefs.getString('cID');
  var token = SharedPrefs.getString('Token');

  final url = Uri.parse(
      'https://service.24x7mail.com/assign?request_comple%E2%80%A6&user_id=$userID&page=1&limit=10');

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

Future<StatementModell?> getStatementApi() async {
  try {
    var userID = SharedPrefs.getString('cID');
    final response =
        await http.get(Uri.parse('${ApiURl.getStatementUrl}$userID'));
    if (response.statusCode == 200) {
      log('stat statuscode ${response.statusCode}');
      final jsonResponse = jsonDecode(response.body);
      final statement = StatementModell.fromJson(jsonResponse);
      //log('statementDATA==>${response.body}');
      return statement;
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    print('Error: $e');
  } finally {}
  return StatementModell();
}

Future<UserModel?> getProfileApi() async {
  try {
    var userID = SharedPrefs.getString('cID');
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
    print('Error: $e');
  } finally {}
  return UserModel();
}

Future<void> uploadImage() async {
  try {
    var userID = SharedPrefs.getString('cID');
    var token = SharedPrefs.getString('Token');

    final response = await http.post(
      Uri.parse(ApiURl.postUploadMail),
      body: {''},
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
    print('Error: $e');
  } finally {}
}

Future<void> getShipment() async {
  try {
    var userID = SharedPrefs.getString('cID');
    var token = SharedPrefs.getString('Token');

    final response = await http.get(
      Uri.parse(
          'https://service.24x7mail.com/assign/shipment-list?username=customer&id=$userID'),
      headers: {
        'Authorization': token,
        //'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjdkOTIzMjQ2Yjc0YjAzZjQ3M2IzYTciLCJ1c2VyX3R5cGUiOiJ1c2VyIiwiaWF0IjoxNzIxNTU2Nzk0LCJleHAiOjE3MjE2NDMxOTR9.yNj8S55oN9C287texl_cvsc1_W1nPcYHlNy6V-Snvn4',
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

Future<SubscriptionModel?> subscriptionApi() async {
  try {
    var userID = SharedPrefs.getString('cID');
    var token = SharedPrefs.getString('Token');

    final response = await http.get(
      Uri.parse(ApiURl.subscriptionsApi),
      headers: {
        'Authorization': token,
      },
    );
    if (response.statusCode == 200) {
      log('subscription ==>${response.body}');
      final jsonResponse =
          SubscriptionModel.fromJson(jsonDecode(response.body));
      log('subscription try==>$jsonResponse');
      return jsonResponse;
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    print('Error: $e');
  } finally {}
  return SubscriptionModel();
}

Future<void> getTrashList() async {
  var token = SharedPrefs.getString('Token');
  final response = await http.get(
    Uri.parse(ApiURl.getTraceList),
    headers: {
      'Authorization': token,
    },
  );
  if (response.statusCode == 200) {
    final traceListDta = jsonDecode(response.body);

    log('traceList===> $traceListDta');
    return traceListDta;
  } else {
    throw Exception('Failed to load traceList');
  }
}

Future<void> getViewAll() async {
  var token = SharedPrefs.getString('Token');
  final response = await http.get(
    Uri.parse('https://24x7mail.com/user/inbox/pending-shipment-list'),
    headers: {
      'Authorization': token,
    },
  );
  if (response.statusCode == 200) {
    final getViewAllData = jsonDecode(response.body);

    log('getViewAll===> $getViewAllData');
    return getViewAllData;
  } else {
    throw Exception('Failed to load traceList');
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
    print('Success: ${response.body}');
  } else {
    print('Error: ${response.statusCode} ${response.body}');
  }
}
