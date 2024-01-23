import 'package:evcar/src/feature/vendor_account/model/vednor_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorController extends GetxController {
  static VendorController get instance => Get.find();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController pictureBase64 = TextEditingController();
  final TextEditingController pBase64 = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController pictureofLicence = TextEditingController();
  final TextEditingController description = TextEditingController();
  final vendorKey = GlobalKey<FormState>();

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

  String removeLeadingZero(String input) {
    return input.replaceAll(RegExp('^0+'), '');
  }

  validtionFiled(String? filed) {
    if (filed!.isEmpty) {
      return 'اسم المركز غير صالح';
    }
  }

  validtionImageFiled(String? filed) {
    if (filed!.isEmpty) {
      return 'ادخل صورة للمركز';
    }
  }

  onSignup(Vendor vendor) {
    if (vendorKey.currentState!.validate()) {}
  }
}
