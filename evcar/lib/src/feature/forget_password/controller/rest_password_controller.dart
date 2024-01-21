import 'dart:convert';

import 'package:evcar/src/config/routes/routes.dart';
import 'package:evcar/src/core/constants/api_key.dart';
import 'package:evcar/src/feature/google_map/view/widget/text/google_map_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RestPasswordController extends GetxController {
  final newPassword = TextEditingController();
  final fromKey = GlobalKey<FormState>();

  vaildPassword(String? password) {
    if (!GetUtils.isLengthGreaterOrEqual(password, 6)) {
      return ' الرقم السري غير صالحة';
    }
    return null;
  }

  Future<void> makePutRequest(
      {required String phone, required String password}) async {
    final String apiUrl =
        ApiKey.restPassword; // Replace with your actual API endpoint

    // Replace with the actual body you want to send
    Map<String, dynamic> requestBody = {
      "phone": phone,
      "password": password,
    };

    try {
      final response = await http.put(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          // Add any other headers your API may require
        },
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        print("PUT Request Successful");
        print("Response: ${response.body}");
        Get.snackbar("ERROR", "Invalid Data",
            titleText: Align(
              alignment: Alignment.topRight, // Set your desired alignment
              child: searchsec('تمت العملية بنجاح'),
            ),
            messageText: Align(
              alignment: Alignment.topRight, // Set your desired alignment
              child: searchsec('تم تغير كلمة السر'),
            ),
            snackStyle: SnackStyle.FLOATING,
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
            backgroundColor: Colors.green);

        Get.offAllNamed(AppRoutes.spalshPage);
      } else {
        print("PUT Request Failed");
        print("Status Code: ${response.statusCode}");
        print("Error: ${response.body}");
      }
    } catch (e) {
      print("Error making PUT request: $e");
    }
  }

  onSignup() async {
    if (fromKey.currentState!.validate()) {}
  }
}
