// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:evcar/src/feature/login/model/user_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepository extends GetxController {
  static LoginRepository get instance => Get.find();
  final RxString token = ''.obs;
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    _loadToken();
  }

  _loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token.value = prefs.getString('LoginToken') ?? '';
  }

  clearToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('LoginToken');
    token.value = '';
  }

  _saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('LoginToken', token);
  }

  Future<void> postUser(UserLogin user) async {
    var apiUrl =
        Uri.parse('https://adventurous-yak-pajamas.cyclic.app/auth/login');

    var jsonString = jsonEncode(user.toJson());

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
}
