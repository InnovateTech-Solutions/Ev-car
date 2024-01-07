import 'package:evcar/src/feature/login/view/widget/login_widget.dart';
import 'package:evcar/src/feature/register/controller/register_subcontroller.dart';
import 'package:evcar/src/feature/splash_screen/splash_page.dart';
import 'package:get/get.dart';

class TokenController extends GetxController {
  final LoginController loginController = Get.put(LoginController());
  final SubRegisterController registerController =
      Get.put(SubRegisterController());
  late String loginToken = loginController.token.value;
  late String registerToken = registerController.token.value;
  late RxString concatenatedTokens = (loginToken + registerToken).obs;

  clearConcatenatedTokens() {
    concatenatedTokens.value = '';
    registerController.token.value = '';
    loginController.token.value = '';
    registerController.clearToken();
    loginController.clearToken();
    Get.offAll(const SplashPage());
  }
}
