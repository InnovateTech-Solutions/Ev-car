import 'dart:async';
import 'dart:math';

import 'package:evcar/src/feature/forget_password/view/pages/rest_password_page.dart';
import 'package:evcar/src/feature/google_map/view/widget/text/google_map_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ForgetOTPController extends GetxController {
  static ForgetOTPController get instance => Get.find();
  ForgetOTPController(this.number);
  final String number;
  final RxString otp = 'not found'.obs;
  final RxBool ispressed = true.obs;
  RxInt timer = 0.obs;

  final otpTextEditing = TextEditingController();

  void startTimer() {
    ispressed.value = false;
    onButtonPressed();

    Timer(const Duration(seconds: 30), () {
      ispressed.value = true;
      timer.value;
    });
  }

  void onButtonPressed() {
    otp.value = generateOTP();
    makeGetRequest();
  }

  String generateOTP() {
    Random random = Random();
    int otpValue =
        1000 + random.nextInt(9000); // Random number between 100000 and 999999
    return otpValue.toString();
  }

  void makeGetRequest() async {
    // Specify the API URL

    final String apiUrl =
        'https://josmsservice.com/SMSServices/Clients/Prof/RestSingleSMS/SendSMS?senderid=Ev%20car&numbers=$number&accname=evcar&AccPass=uN7iI6eT4qD5bP5d&msg=$otp';

    try {
      // Make the GET request
      final response = await http.get(Uri.parse(apiUrl));

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Print the response body
        print('Response: ${response.body}');
      } else {
        // Print an error message if the request was not successful
        print(
            'Failed to make GET request. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the request
      print('Error making GET request: $e');
    }
  }

  Future<bool> isMatch(String code, String number) async {
    if (code == otp.value) {
      print('allowed');

      Get.to(RestPasswordPage(phone: number));
      return true;
    } else {
      print('not allowed');
      Get.snackbar("ERROR", "Invalid Data",
          titleText: Align(
            alignment: Alignment.topRight, // Set your desired alignment
            child: searchsec('حدث خطأ'),
          ),
          messageText: Align(
            alignment: Alignment.topRight, // Set your desired alignment
            child: searchsec('رمز ال OTP خطأ'),
          ),
          snackStyle: SnackStyle.FLOATING,
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.red);

      return false;
    }
  }
}