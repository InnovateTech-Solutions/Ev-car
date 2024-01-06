import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/login/model/user_login.dart';
import 'package:evcar/src/feature/login/repostiory/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final phoneNumber = TextEditingController();
  final fromKey = GlobalKey<FormState>();
  final controller = Get.put(LoginRepository());

  userLogin(UserLogin user) {
    controller.postUser(user);
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

  Future<void> loginUser(UserLogin user) async {
    if (fromKey.currentState!.validate()) {
      try {
        print(user.phone);
        userLogin(user);
      } catch (error) {
        print('Error: $error');
      }
    } else {
      Get.snackbar("ERROR", "value not valid",
          snackPosition: SnackPosition.BOTTOM,
          colorText: AppTheme.lightAppColors.mainTextcolor,
          backgroundColor: Colors.red);
    }
  }
}
