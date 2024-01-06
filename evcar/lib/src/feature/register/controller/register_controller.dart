import 'package:evcar/src/feature/google_map/view/pages/google_map_page.dart';
import 'package:evcar/src/feature/otp/view/page/otp_page.dart';
import 'package:evcar/src/feature/register/model/user_model.dart';
import 'package:evcar/src/feature/register/repository/register_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  hidePassword() {
    if (hide.value == false) {
      hide.value = true;
    } else if (hide.value == true) {
      hide.value = false;
    }
  }

  vaildPhoneNumber(String? phoneNumber) {
    if (GetUtils.isPhoneNumber(phoneNumber!)) {
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

  userRegister(UserModel userModel) {
    RegisterRepository().postUser(userModel);
    Get.to(const GoogleMapPage());
  }

  onSignup(UserModel user) {
    if (fromKey.currentState!.validate()) {
      Get.to(OtpPage(
        userModel: user,
      ));
    }
  }
}
