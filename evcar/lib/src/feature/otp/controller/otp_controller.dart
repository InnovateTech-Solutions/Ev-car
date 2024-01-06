// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:math';
import 'package:evcar/src/feature/google_map/view/pages/google_map_page.dart';
import 'package:evcar/src/feature/register/controller/register_subcontroller.dart';
import 'package:evcar/src/feature/register/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class OTPController extends GetxController {
  final String number;
  OTPController(this.number);
  final RxBool isButtonDisabled = false.obs;

  final RxInt countdown = 5.obs;

  final RxString otp = 'not found'.obs;
  final TextEditingController name = TextEditingController();

  validateFiled(String? text) {
    if (GetUtils.isUsername(text!)) {
      return null;
    }
    return 'Filed is not vaild';
  }

  String generateOTP() {
    Random random = Random();
    int otpValue =
        1000 + random.nextInt(9000); // Random number between 100000 and 999999
    return otpValue.toString();
  }

  void onButtonPressed() {
    otp.value = generateOTP();
    isButtonDisabled.value = true;
    print(isButtonDisabled.value);
    // Call the function to make the GET request

    makeGetRequest();
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

  Future<bool> isMatch(String code, UserModel user) async {
    if (code == otp.value) {
      print('allowed');
      SubRegisterController().postUser(user);
      Get.offAll(const GoogleMapPage());
      return true;
    } else {
      print('not allowed');
      Get.snackbar("ERROR", "Invalid Data",
          messageText: const Align(
            alignment: Alignment.topLeft, // Set your desired alignment
            child: Text('"Invalid Data",'),
          ),
          snackStyle: SnackStyle.FLOATING,
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.red);
      return false;
    }
  }

  sendOTP() {
    if (isButtonDisabled.value) {
      onButtonPressed();
      isButtonDisabled.value = !isButtonDisabled.value;
      print('send');
    } else if (!isButtonDisabled.value) {
      isButtonDisabled.value = !isButtonDisabled.value;
    }
    print(isButtonDisabled.value);
  }
}
