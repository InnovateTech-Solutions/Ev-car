import 'package:get/get.dart';

class PasswordVisibilityController extends GetxController {
  var isPasswordHidden = true.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.toggle();
  }
}
