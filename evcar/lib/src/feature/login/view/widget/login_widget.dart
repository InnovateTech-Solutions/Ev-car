// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:evcar/src/config/theme/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/core/widgets/custem_button.dart';
import 'package:evcar/src/feature/charging_station/controller/home_controller.dart';
import 'package:evcar/src/feature/google_map/view/pages/google_map_page.dart';
import 'package:evcar/src/feature/google_map/view/widget/google_map_text.dart';
import 'package:evcar/src/feature/login/view/widget/login_form_widget.dart';
import 'package:evcar/src/feature/login/view/widget/login_partial.dart';
import 'package:evcar/src/feature/register/model/form_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_text.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final RxString token = ''.obs;
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final fromKey = GlobalKey<FormState>();
  final HomeController homeController = Get.put(HomeController());
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

  @override
  void onInit() {
    super.onInit();
    _loadToken();
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

  Future<void> postUser() async {
    var apiUrl =
        Uri.parse('https://adventurous-yak-pajamas.cyclic.app/auth/login');

    var jsonData = {
      'phone': "962${phoneController.text}",
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

        homeController.toggleValueAndNavigate();
        Get.offAll(const GoogleMapPage());
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

class LoginWidget extends StatelessWidget {
  LoginWidget({super.key});

  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Form(
          key: controller.fromKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LoginText.mainText('تسجيل الدخول'),
              SizedBox(
                height: 0.02 * context.screenHeight,
              ),
              LoginText.secText(
                'يرجى تأكيد رمز البلد الخاص بك وإدخال رقم هاتفك.',
              ),
              SizedBox(
                height: 0.05 * context.screenHeight,
              ),
              Divider(
                height: 1,
                color: AppTheme.lightAppColors.bordercolor,
              ),
              Container(
                margin: const EdgeInsets.all(15.0),
                child: LoginText.secText(
                  'الاردن',
                ),
              ),
              Divider(
                height: 1,
                color: AppTheme.lightAppColors.bordercolor,
              ),
              Row(
                children: [
                  Expanded(
                    child: LoginFormWidget(
                      formModel: FormModel(
                          controller: controller.phoneController,
                          enableText: false,
                          textAligment: TextAlign.end,
                          hintText: '0000 000 000',
                          invisible: false,
                          validator: null,
                          type: TextInputType.phone,
                          inputFormat: [
                            LengthLimitingTextInputFormatter(10),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          onTap: null),
                    ),
                  ),
                  verticalDivider(),
                  Column(
                    children: [
                      SizedBox(
                        height: context.screenHeight * 0.02,
                      ),
                      LoginText.secText('962+'),
                      SizedBox(
                        height: context.screenHeight * 0.015,
                      ),
                      Container(
                        width: context.screenWidth * 0.1,
                        height: 1,
                        color: AppTheme.lightAppColors.bordercolor,
                      )
                    ],
                  )
                ],
              ),
              LoginFormWidget(
                formModel: FormModel(
                  enableText: false,
                  icon: null,
                  textAligment: TextAlign.start,
                  controller: controller.passwordController,
                  hintText: 'الرقم السري',
                  invisible: true,
                  validator: (password) => controller.vaildPassword(password),
                  type: TextInputType.visiblePassword,
                  inputFormat: null,
                  onTap: () {},
                ),
              ),
              SizedBox(
                height: 0.1 * context.screenHeight,
              ),
              CustemButton(
                text: 'التالي',
                onPressed: () async {
                  if (controller.fromKey.currentState!.validate()) {
                    await controller.postUser();
                  }
                },
                colorText: AppTheme.lightAppColors.mainTextcolor,
                colorButton: AppTheme.lightAppColors.buttoncolor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
