import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:twentyfourby_seven/Operator/operatorController.dart';
import 'package:twentyfourby_seven/Service/constant.dart';
import 'package:twentyfourby_seven/SignUp/signUpController.dart';
import 'package:twentyfourby_seven/Utils/SharedPrefrance.dart';
import 'package:twentyfourby_seven/customer_Address/shipment_customer/shipmentController.dart';
import 'package:twentyfourby_seven/models/OperatorModel.dart';
import 'package:twentyfourby_seven/models/customerMailModel.dart';
import 'package:twentyfourby_seven/models/profileModel.dart';
import 'package:twentyfourby_seven/models/statementModell.dart';

import '../customer_Address/customer_AddController.dart';
import '../models/operatorHomeModel.dart';
import '../models/packageModel.dart';
import '../models/shipmentModel.dart';
import '../models/shipmentstatus_model.dart';
import '../models/uploadImageModel.dart';

var operatorController = Get.put(OperatorController());
var signController = Get.put(SignupController());
var customerAddCtrl = Get.put(ShipmentController());
var getCustomerAdd = Get.put(CustomerAddController());

Future<UserModel?> login(String email, password) async {
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
      final loginResponse = UserModel.fromJson(jsonDecode(response.body));
      log('login==> ${loginResponse.token}');
      String token = loginResponse.token.toString();
      String customerID = loginResponse.data?.id.toString() ?? '';
      String firstName = loginResponse.data?.fname.toString() ?? '';
      String lastName = loginResponse.data?.lname.toString() ?? '';
      String email = loginResponse.data?.email.toString() ?? '';
      String password = loginResponse.data?.password.toString() ?? '';
      log('emailll $email,$password');
      SharedPrefs.putString('emailId', email);
      SharedPrefs.putString('password', password);
      SharedPrefs.putString('Token', token);
      SharedPrefs.putString('cID', customerID);
      SharedPrefs.putString('firstNAme', firstName);
      SharedPrefs.putString('lastNAme', lastName);

      return loginResponse;
    } else {
      log('Failed to login: ${response.statusCode}');
    }
  } catch (e) {
    log('Error: $e');
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

Future<ShipmentstatusModel?> pastShipmentList() async {
  try {
    var userID = SharedPrefs.getString('cID');
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
    var userID = SharedPrefs.getString('cID');
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
    var userID = SharedPrefs.getString('cID');
    var token = SharedPrefs.getString('Token');

    final response = await http.get(
      Uri.parse(
          'https://service.24x7mail.com/assign?&search=&fromDate=&toDate=&user_id=$userID&page=1&limit=10&current_status=pickup status'),
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
    if (response.statusCode == 200) {
      var deleteResponse = jsonDecode(response.body);
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

      final List<Map<String, String>> statDetails = stateData.map((state) {
        return {
          'name': state['name'] as String,
          'state_id': state['state_id'] as String,
        };
      }).toList();
      log('stateDetails==> $statDetails');
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

      log('stateModel ${stateModel.data}');
      return stateModel;

      /*final List<dynamic> cityData = jsonDecode(response.body);

      List<String> cityList = cityData.map((city) {
        return city['name'].toString();
      }).toList();
      log('cityList==> $cityList');
      return cityList;*/
    } else {
      throw Exception('Failed to load city list');
    }
  } catch (e) {
    log('Error: $e');
    return ShipmentModel();
  }
}

Future<List<String>> fetchCityList() async {
//Future<List<String>> fetchCityList(int stateId) async {
  final String apiUrl = 'https://service.24x7mail.com/city/1400';

  try {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200 || response.statusCode == 201) {
      log(response.body);
      final List<dynamic> cityData = jsonDecode(response.body);

      List<String> cityList = cityData.map((city) {
        return city['name'].toString();
      }).toList();
      log('cityList==> $cityList');
      return cityList;
    } else {
      throw Exception('Failed to load city list');
    }
  } catch (e) {
    log('Error: $e');
    return [];
  }
}

Future<PackageModel?> subscriptionApi() async {
  try {
    var userID = SharedPrefs.getString('cID');
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
  var userID = SharedPrefs.getString('cID');

  String readValue = isRead ? 'true' : 'false';
  var url =
      'https://service.24x7mail.com/assign?&search=&fromDate=&toDate=&user_id=$userID&page=1&limit=10&read=$isRead';
  final response = await http.get(
    Uri.parse(url),
    // 'https://service.24x7mail.com/assign?request_completed=true&search=&from_date=$fromDate&to_date=$toDate&user_id=$userID&page=1&limit=10&read=$readValue'),
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
  var userID = SharedPrefs.getString('cID');
  var token = SharedPrefs.getString('Token');
  final response = await http.get(
    //Uri.parse('https://service.24x7mail.com/assign/shipment-list-added'),
    Uri.parse(
        'https://service.24x7mail.com/assign?request_completed=true&&search=&$fromDate=&$toDate=&user_id=$userID&page=1&limit=10'),
    headers: {
      'Authorization': token,
    },
  );

  if (response.statusCode == 200 || response.statusCode == 201) {
    var responseData = CustomerMailModel.fromJson(jsonDecode(response.body));
    //log('View Index: $responseData');

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
    print('Success: ${response.body}');
  } else {
    print('Error: ${response.statusCode} ${response.body}');
  }
}

void submitShippingAddress() async {
  var userID = SharedPrefs.getString('cID');
  var token = SharedPrefs.getString('Token');
  const String url = "https://service.24x7mail.com/shipping-address";

  final Map<String, dynamic> body = {
    "name": customerAddCtrl.nameController.text,
    "company": customerAddCtrl.companyController.text,
    "address1": customerAddCtrl.addLineOneController.text,
    "address2": customerAddCtrl.addLineTwoController.text ?? '',
    "country": {"country_id": "233", "name": "United States"},
    "state": {"country_id": "233", "state_id": 1456, "name": "Alabama"},
    "city": {"state_id": 1456, "city_id": 111146, "name": "Alexander City"},
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
      log('Shipment added successfully: ${response.body}');
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

/// readView
/// https://service.24x7mail.com/assign?&search=&fromDate=&toDate=&user_id=667d923246b74b03f473b3a7&page=1&limit=10&read=true
/// https://service.24x7mail.com/assign?&search=&fromDate=&toDate=&user_id=667d923246b74b03f473b3a7&page=1&limit=10&read=false
///scan request patch
Future<void> scanRequestPatchApi(String scanRequest) async {
  try {
    var userID = SharedPrefs.getString('cID');
    var token = SharedPrefs.getString('Token');
//scan-request
    final Map<String, dynamic> payload = {
      "ids": ["669a168923ba32ee0e468379"]
    };

    final response = await http.patch(
      Uri.parse('https://service.24x7mail.com/assign/$scanRequest'),
      headers: {
        'Authorization': token,
        'Content-Type': 'application/json',
      },
      body: json.encode(payload),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final patchResponse = jsonDecode(response.body);

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
    print('Error: $e');
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
Future<OperatorHomeModel?> getOperatorRequestApi() async {
  var token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjdjMDNiNTRmMTljNzMzYTAxYmNiOWMiLCJ1c2VyX3R5cGUiOiJvcGVyYXRvciIsImlhdCI6MTcyMzU2MzY2MCwiZXhwIjoxNzIzNjUwMDYwfQ.Pvf0t8KOwpqa-cjT0DvioOz6tsRPIpGncTivu3XbpJ4';

  final response = await http.get(
    // Uri.parse('${ApiURl.operatorHomeApi}+${'667c03b54f19c733a01bcb9c'}'),
    Uri.parse(
        'https://service.24x7mail.com/assign/status-count/667c03b54f19c733a01bcb9c'),
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

Future<UploadImageModel?> getNewMailOperator() async {
  var token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjdjMDNiNTRmMTljNzMzYTAxYmNiOWMiLCJ1c2VyX3R5cGUiOiJvcGVyYXRvciIsImlhdCI6MTcyMzU2MzY2MCwiZXhwIjoxNzIzNjUwMDYwfQ.Pvf0t8KOwpqa-cjT0DvioOz6tsRPIpGncTivu3XbpJ4';

  final response = await http.get(
    Uri.parse(
        'https://service.24x7mail.com/user/customer-list-by-feature/667c046a9503bee4ce480c04?search='),
    headers: {
      'Authorization': token,
    },
  );
  log('mailNewMail response ${response.body}');

  if (response.statusCode == 200 || response.statusCode == 201) {
    var OperatorNewData = UploadImageModel.fromJson(jsonDecode(response.body));

    log('OperatorNewDataList=> $OperatorNewData');
    return OperatorNewData;
  } else {
    Get.snackbar("Error", "Failed to requestMail: ${response..statusCode}");
  }
  return UploadImageModel();
}
