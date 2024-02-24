import 'dart:convert';

import 'package:evcar/src/core/constants/api_key.dart';
import 'package:evcar/src/feature/otp/view/page/otp_page.dart';
import 'package:evcar/src/feature/register/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RegisterController extends GetxController {
  static RegisterController get instance => Get.find();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController carType = TextEditingController();
  final fromKey = GlobalKey<FormState>();
  RxBool hide = true.obs;

  String removeLeadingZero(String input) {
    // Use regular expression to remove leading zeros
    return input.replaceAll(RegExp('^0+'), '');
  }

  Future<bool> fetchUserExistence(String number) async {
    String apiUrl = ApiKey.userExits + number;

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // Parse the response JSON
        Map<String, dynamic> data = json.decode(response.body);

        // Return the boolean value directly
        return data['result'];
      } else {
        print("Error: ${response.statusCode}");
        // Return false in case of an error
        return false;
      }
    } catch (error) {
      print("Error: $error");
      // Return false in case of an error
      return false;
    }
  }

  hidePassword() {
    if (hide.value == false) {
      hide.value = true;
    } else if (hide.value == true) {
      hide.value = false;
    }
  }

  vaildPhoneNumber(String? phoneNumber) {
    if (GetUtils.isPhoneNumber(phoneNumber!) && phoneNumber.length >= 9) {
      return null;
    }
    return 'رقم الهاتف غير صالح';
  }

  vaildPassword(String? password) {
    if (!GetUtils.isLengthGreaterOrEqual(password, 6)) {
      return ' الرقم السري غير صالحة';
    }
    return null;
  }

  validCar(String? car) {
    if (car!.isEmpty) {
      return "نوع السيارة غير صالح";
    }
    return null;
  }

  validUsername(String? name) {
    if (name!.isEmpty) {
      return "اسم المستخدم غير صالح";
    }
    return null;
  }

  onSignup(UserModel user) {
    if (fromKey.currentState!.validate()) {
      Get.to(OtpPage(
        userModel: user,
      ));
    }
  }
}
