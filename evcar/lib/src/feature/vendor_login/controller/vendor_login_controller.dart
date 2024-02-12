import 'dart:convert';
import 'package:evcar/src/feature/home_page/controller/home_controller.dart';
import 'package:evcar/src/feature/vendor_dashboard/view/page/vendor_dashboard_page.dart';
import 'package:http/http.dart' as http;
import 'package:evcar/src/feature/google_map/view/widget/text/google_map_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VendorLoginController extends GetxController {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final fromKey = GlobalKey<FormState>();

  final HomePageController homeController = Get.put(HomePageController());
  final RxString token = ''.obs;
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

  Future<void> postUser() async {
    var apiUrl = Uri.parse(
        'https://adventurous-yak-pajamas.cyclic.app/vendorAuth/login');

    var jsonData = {
      'number': "962${removeLeadingZero(phoneController.text)}",
      'password': passwordController.text,
    };
    print('962${removeLeadingZero(phoneController.text)}');
    print('${(passwordController.text)}');
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

        homeController.login('vendor');
        Get.offAll(const VendorDashboardPage());
      } else {
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
