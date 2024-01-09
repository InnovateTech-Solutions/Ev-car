// register_controller.dart
// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:evcar/src/feature/profile/controller/profile_controller.dart';
import 'package:evcar/src/feature/register/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiResponse {
  final String status;
  final String token;

  ApiResponse({required this.status, required this.token});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      status: json['status'],
      token: json['token'],
    );
  }
}

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

class SubRegisterController extends GetxController {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController carTypeController = TextEditingController();

  final ApiService apiService = ApiService();

  final RxString token = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  loadToken() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      token.value = prefs.getString('token') ?? '';
      // Remove the following line since it's not necessary to save the token again
      // await _saveToken(token.value);
      // Check if token exists and navigate accordingly
      print('done');
      print(token.value);
    } catch (e) {
      print('Error loading token: $e');
    }
  }

  _saveToken(String token) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', token);
      print("save token: " + token);
    } catch (e) {
      print('Error saving token: $e');
    }
  }

  clearToken() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove('token');
      token.value = '';
    } catch (e) {
      print('Error clearing token: $e');
    }
  }

  void postUser(UserModel userModel) async {
    var apiUrl =
        Uri.parse('https://adventurous-yak-pajamas.cyclic.app/auth/register');

    final Map<String, dynamic> jsonData = {
      'phone': userModel.phone,
      'username': userModel.username,
      "carType": userModel.carType,
      'password': userModel.password,
      'role': 'user',
    };

    var jsonString = jsonEncode(jsonData);

    try {
      var response = await http.post(
        apiUrl,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonString,
      );

      if (response.statusCode == 200) {
        print('Data sent successfully');
        print('Response: ${response.body}');
      } else {
        print('Failed to send data. Status code: ${response.statusCode}');
        print('Response: ${response.body}');
      }

      Map<String, dynamic> responseMap = json.decode(response.body);

      if (responseMap['status'] == 'success') {
        String userToken = responseMap['token'];
        _saveToken(userToken);
        token.value = userToken;
      } else {
        // Handle error case
      }
    } catch (error) {
      print('Error sending data: $error');
    }
  }

  // @override
  // void dispose() {
  //   phoneController.dispose();
  //   usernameController.dispose();
  //   passwordController.dispose();
  //   carTypeController.dispose();
  //   super.dispose();
  // }
}
