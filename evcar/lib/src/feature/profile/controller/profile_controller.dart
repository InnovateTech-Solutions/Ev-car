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

  Future<UserModel> getUserDetails(String token) async {
    final response = await http.get(
      Uri.parse(
          'https://adventurous-yak-pajamas.cyclic.app/users/getUserDetails'),
      headers: {
        'Authorization': 'Bearer  $token',
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

  Future<void> putUserDetails(
      String username, String carType, String token) async {
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
        'Authorization': 'Bearer $token',
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
