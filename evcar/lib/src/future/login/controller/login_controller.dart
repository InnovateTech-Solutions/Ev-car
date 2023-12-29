import 'dart:convert';

import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/future/register/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final phoneNumber = TextEditingController();
  final fromKey = GlobalKey<FormState>();

  String? validatePhoneNumber(String? phoneNumber) {
    if (phoneNumber != null && phoneNumber.length == 10) {
      if (GetUtils.isPhoneNumber(phoneNumber)) {
        return null;
      } else {
        return 'رقم الهاتف غير صالح';
      }
    } else {
      return 'رقم الهاتف يجب أن يكون من 10 أرقام';
    }
  }

  Future<void> loginUser(UserModel user) async {
    const url = 'https://real-dove-cap.cyclic.app/auth/login';
    if (fromKey.currentState!.validate()) {
      try {
        final response = await http.post(
          Uri.parse(url),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(user.toJson()),
        );
        print('Request Body: ${user.toJson()}');

        if (response.statusCode == 201) {
          final Map<String, dynamic> data = json.decode(response.body);
          String token = data['token'];
          print('Token: $token');
        } else {
          print('Failed to login. Status code: ${response.statusCode}');
          print('Response: ${response.body}');
        }
      } catch (error) {
        print('Error: $error');
      }
    } else {
      Get.snackbar("ERROR", "value not valid",
          snackPosition: SnackPosition.BOTTOM,
          colorText: AppTheme.lightAppColors.mainTextcolor,
          backgroundColor: Colors.red);
    }
  }
}
