// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:evcar/src/core/controller/api_response.dart';
import 'package:evcar/src/core/controller/api_service.dart';
import 'package:evcar/src/feature/register/model/user_model.dart';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterRepository extends GetxController {
  static RegisterRepository get instance => Get.find();

  final ApiService apiService = ApiService();

  final RxString token = 'no token avalivble'.obs;

  @override
  void onInit() {
    super.onInit();
    _loadToken();
  }

  _loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token.value = prefs.getString('token') ?? '';
  }

  clearToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    token.value = '';
  }

  _saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  Future<void> registerUser(UserModel userModel) async {
    try {
      final ApiResponse apiResponse =
          await apiService.registerUser(userModel.toJson());
      _saveToken(apiResponse.token);
      token.value = apiResponse.token;
    } catch (e) {
      print('Registration failed: $e');
    }
  }

  void postUser(UserModel user) async {
    var apiUrl =
        Uri.parse('https://adventurous-yak-pajamas.cyclic.app/auth/register');

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
