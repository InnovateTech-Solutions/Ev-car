import 'dart:convert';
import 'package:evcar/src/feature/google_map/view/pages/google_map_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final phoneNumber = TextEditingController();
  final RxString token = ''.obs;
  final password = TextEditingController();
  final fromKey = GlobalKey<FormState>();
  @override
  void onInit() {
    super.onInit();
    _loadToken();
  }

  removeLeadingZero(String input) {
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

  vaildPassword(String? password) {
    if (!GetUtils.isLengthGreaterOrEqual(password, 6)) {
      return ' الرقم السري غير صالحة';
    }
    return null;
  }

  _loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token.value = prefs.getString('LoginToken') ?? '';
  }

  clearToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('LoginToken');
    token.value = '';
  }

  _saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('LoginToken', token);
  }

  Future<void> postUser(String number, String password) async {
    var apiUrl =
        Uri.parse('https://adventurous-yak-pajamas.cyclic.app/auth/login');
    var jsonData = {
      'phone': number,
      'password': password,
    };
    var jsonString = jsonEncode(jsonData);
    if (fromKey.currentState!.validate()) {
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
        } else {}
        Get.to(const GoogleMapPage());
      } catch (error) {
        print('Error sending data: $error');
      }
    }
  }
}
