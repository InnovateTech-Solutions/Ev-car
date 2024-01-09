import 'package:evcar/src/feature/charging_station/controller/home_controller.dart';
import 'package:evcar/src/feature/login/view/widget/login_widget.dart';
import 'package:evcar/src/feature/register/controller/register_subcontroller.dart';
import 'package:evcar/src/feature/splash_screen/splash_page.dart';
import 'package:get/get.dart';

class TokenController extends GetxController {
  final homeController = Get.put(HomeController());
  final LoginController loginController = Get.put(LoginController());
  final SubRegisterController registerController =
      Get.put(SubRegisterController());
  late String loginToken = loginController.token.value;
  late String registerToken = registerController.token.value;
  late RxString concatenatedTokens = (loginToken + registerToken).obs;
  // final TokenGetter tokenGetter = Get.put(TokenGetter());
  clearConcatenatedTokens() {
    concatenatedTokens.value = '';
    registerController.token.value = '';
    loginController.token.value = '';
    registerController.clearToken();
    loginController.clearToken();
    homeController.logout();
    Get.offAll(const SplashPage());
  }
}

class TokenGetter extends GetxController {
  final TokenController token = Get.put(TokenController());
  RxString userToken = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    updateUserToken(userToken.value);
  }

  void updateUserToken(String newToken) {
    userToken.value = newToken;

    // Trigger a manual rebuild
    update();
  }

  clearToken() {
    userToken.value = '';
  }
}
