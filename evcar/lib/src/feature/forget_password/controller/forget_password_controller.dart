import 'dart:convert';

import 'package:evcar/src/core/constants/api_key.dart';
import 'package:evcar/src/feature/forget_password/view/pages/otp_forget_password.dart';
import 'package:evcar/src/feature/forget_password/view/widget/main_widget/otp_forget_widget.dart';
import 'package:evcar/src/feature/register/view/widget/widget_collectio.dart/user_exist_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final phone = TextEditingController();

  final fromKey = GlobalKey<FormState>();

  String removeLeadingZero(String input) {
    return input.replaceAll(RegExp('^0+'), '');
  }

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

  onSignup(String phoneNumber, BuildContext context) async {
    if (fromKey.currentState!.validate()) {
      bool userExits = await fetchUserExistence('962$phoneNumber');

      if (!userExits) {
        userExistDialog(context, 'المستخدم غير موجود الرجاء انشاء حساب');
      } else {
        Get.to(ForgetOtpPage(number: phoneNumber));
      }
    }
  }
}
