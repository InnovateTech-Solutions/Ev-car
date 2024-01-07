import 'dart:convert';

import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/register/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();
  final phoneNumber = TextEditingController();
  final username = TextEditingController();
  final carType = TextEditingController();
  final fromKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    getUserDetails();
  }

  vaildPhoneNumber(String? phoneNumber) {
    if (GetUtils.isPhoneNumber(phoneNumber!)) {
      return null;
    }
    return 'رقم الهاتف غير صالح';
  }

  validCar(String? car) {
    if (!GetUtils.isUsername(car!)) {
      return "نوع السيارة غير صالح";
    }
    return null;
  }

  validUsername(String? name) {
    if (!GetUtils.isUsername(name!)) {
      return "اسم المستخدم غير صالح";
    }
    return null;
  }

  Future<UserModel> getUserDetails() async {
    final response = await http.get(
      Uri.parse(
          'https://adventurous-yak-pajamas.cyclic.app/users/getUserDetails'),
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZSI6Ijk2Mjc3Nzc3Nzc3NyIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzA0NTczODM0LCJleHAiOjE3MDUxNzg2MzR9.60avxilUR3FwUfMENXbRnlMfu9pHsj7754Pr7qhPDH0',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final UserModel user = UserModel.fromJson(responseData);
      phoneNumber.text = user.phone;
      username.text = user.username;
      carType.text = user.carType;
      return user;
    } else {
      throw Exception('Failed to load user details');
    }
  }

  Future<void> putUserDetails(String username, String carType) async {
    if (fromKey.currentState!.validate()) {
    } else {
      Get.snackbar("ERROR", "Invalid data",
          snackPosition: SnackPosition.BOTTOM,
          colorText: AppTheme.lightAppColors.background,
          backgroundColor: Colors.red);
    }
    final response = await http.put(
      Uri.parse('https://adventurous-yak-pajamas.cyclic.app/users/update'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZSI6Ijk2Mjc3Nzc3Nzc3NyIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzA0NTczODM0LCJleHAiOjE3MDUxNzg2MzR9.60avxilUR3FwUfMENXbRnlMfu9pHsj7754Pr7qhPDH0',
      },
      body: json.encode({
        'username': username,
        'carType': carType,
      }),
    );

    if (response.statusCode == 201) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      this.username.text = username;
      this.carType.text = carType;
      print('Updated user details: $responseData');
    } else {
      throw Exception('Failed to update user details');
    }
  }
}
