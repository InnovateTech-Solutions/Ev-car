import 'package:evcar/src/feature/login/controller/login_controller.dart';
import 'package:evcar/src/feature/register/controller/user_register_controller.dart';
import 'package:evcar/src/feature/splash_screen/splash_page.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageController extends GetxController {
  RxBool isGoogleMapEnabled = false.obs;

  @override
  void onInit() {
    _loadPreferences();
    super.onInit();
  }

  Future<void> _loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isGoogleMapEnabled.value = prefs.getBool('isGoogleMapEnabled') ?? false;
  }

  Future<void> toggleValueAndNavigate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isGoogleMapEnabled.value = true;
    await prefs.setBool('isGoogleMapEnabled', isGoogleMapEnabled.value);

    // isGoogleMapEnabled.value
    //     ? Get.offAll(() => const GoogleMapPage())
    //     : Get.offAll(() => const SplashPage());
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.clear();
    isGoogleMapEnabled.value = false;
    LoginController().clearToken();
    UserRegisterController().clearToken();
    Get.offAll(() => const SplashPage());
  }

  // clearConcatenatedTokens() {
  //   concatenatedTokens.value = '';
  //   registerController.token.value = '';
  //   loginController.token.value = '';
  //   registerController.clearToken();
  //   loginController.clearToken();
  //   homeController.logout();
  //   Get.offAll(const SplashPage());
  // }
}
