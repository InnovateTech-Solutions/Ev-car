import 'package:evcar/src/future/google_map/view/pages/google_map_page.dart';
import 'package:evcar/src/future/register/model/user_model.dart';
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

  Future<void> onSignup(UserModel user) async {
    if (fromKey.currentState!.validate()) {
      Get.offAll(const GoogleMapPage());
      // const url = "https://real-dove-cap.cyclic.app/auth/register";

      // try {
      //   final response = await http.post(
      //     Uri.parse(url),
      //     headers: {"Content-Type": "application/json"},
      //     body: jsonEncode(user.toJson()),
      //   );

      //   print('Request Body: ${user.toJson()}');

      //   if (response.statusCode == 200) {
      //     final Map<String, dynamic> data = json.decode(response.body);
      //     String token = data['token'];
      //     print('Token: $token');
      //   } else {
      //     print('Failed to register. Status code: ${response.statusCode}');
      //     print('Response: ${response.body}');
      //   }
      // } catch (error) {
      //   print('Error: $error');
      // }
    }
  }
}
