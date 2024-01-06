import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:evcar/src/core/controller/api_response.dart';

class ApiService {
  static const String baseUrl =
      'https://adventurous-yak-pajamas.cyclic.app/auth/register';

  Future<ApiResponse> registerUser(Map<String, dynamic> userData) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(userData),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = json.decode(response.body);
      return ApiResponse.fromJson(responseBody);
    } else {
      throw Exception('Failed to register user');
    }
  }
}
