import 'dart:convert';

import 'package:http/http.dart' as http;

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
      print('Login successful: $jsonResponse');
    } else {
      print('Failed to login: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
