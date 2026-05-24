import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthService {

  static const baseUrl =
      'http://10.0.2.2:3000';

  static Future register(
    String username,
    String email,
    String password
  ) async {

  final response =
      await http.post(

    Uri.parse(
        '$baseUrl/register'
    ),

    headers: {
      'Content-Type':
      'application/json'
    },

    body: jsonEncode({
      'username': username,
      'email': email,
      'password': password
      }),
    );

    return jsonDecode(
      response.body
    );
  }

  static Future login(
      String email,
      String password
  ) async {

    final response = await http.post(
      Uri.parse('$baseUrl/login'),

      headers: {
        'Content-Type':'application/json'
      },

      body: jsonEncode({
        'email': email,
        'password': password
      }),
    );

    return jsonDecode(response.body);
  }
}