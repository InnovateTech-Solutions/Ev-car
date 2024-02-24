import 'dart:convert';

import 'package:evcar/src/core/constants/api_key.dart';
import 'package:evcar/src/feature/google_map/view/widget/text/google_map_text.dart';
import 'package:evcar/src/feature/nav_bar/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../home_page/controller/home_controller.dart';

class LoginController extends GetxController {
  final RxString token = ''.obs;
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final fromKey = GlobalKey<FormState>();
  final HomePageController homeController = Get.put(HomePageController());
  String removeLeadingZero(String input) {
    return input.replaceAll(RegExp('^0+'), '');
  }

  String? validatePhoneNumber(String? phoneNumber) {
    if (phoneNumber != null && phoneNumber.length >= 9) {
      if (GetUtils.isPhoneNumber(phoneNumber)) {
        return null;
      } else {
        return 'رقم الهاتف غير صالح';
      }
    } else {
      return 'رقم الهاتف يجب أن يكون من 10 أرقام';
    }
  }

  vaildPassword(String? password) {
    if (!GetUtils.isLengthGreaterOrEqual(password, 6)) {
      return ' الرقم السري غير صالحة';
    }
    return null;
  }

  @override
  void onInit() {
    super.onInit();
  }

  loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token.value = prefs.getString('LoginToken') ?? '';
    print("token " + token.value);
  }

  clearToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('LoginToken');
    token.value = '';
  }

  _saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('LoginToken', token);
    print("save token    ${prefs.getString('LoginToken') ?? ""}");
  }

  Future<void> postUser(context) async {
    var apiUrl = Uri.parse(ApiKey.login);

    var jsonData = {
      'phone': "962${removeLeadingZero(phoneController.text)}",
      'password': passwordController.text,
    };

    var jsonString = jsonEncode(jsonData);

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

        homeController.login('user');
        Navigator.of(context, rootNavigator: true).pop();

        Get.offAll(const NavBarWidget());
      } else {
        Navigator.of(context, rootNavigator: true).pop();

        // Handle error case
        Get.snackbar("ERROR", "Invalid Data",
            titleText: Align(
              alignment: Alignment.topRight, // Set your desired alignment
              child: searchsec('حدث خطأ'),
            ),
            messageText: Align(
              alignment: Alignment.topRight, // Set your desired alignment
              child: searchsec('تأكد من الايميل او الرقم السري'),
            ),
            snackStyle: SnackStyle.FLOATING,
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
            backgroundColor: Colors.red);
      }
    } catch (error) {
      print('Error sending data: $error');
    }
  }
}
