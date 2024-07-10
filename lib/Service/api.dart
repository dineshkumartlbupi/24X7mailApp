import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:twentyfourby_seven/Utils/SharedPrefrance.dart';

Map<String, dynamic>? data;

Future<void> login() async {
  final url = Uri.parse('https://service.24x7mail.com/user/login');
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
      var viewToken = SharedPrefs.getString('Token');
      log('ViewToken==>$token');
      log('ViewTokensss==>$viewToken');
    } else {
      log('Failed to login: ${response.statusCode}');
    }
  } catch (e) {
    log('Error: $e');
  }
}

Future<void> ViewState() async {
  String apiUrl = "https://service.24x7mail.com/state/233";
  try {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      data = json.decode(response.body);
    } else {
      print('Server error: ${response.statusCode}');
    }
  } catch (e) {
    // Handle network error
    print('Network error: $e');
  }
}
