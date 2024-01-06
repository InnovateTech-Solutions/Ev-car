import 'package:evcar/src/feature/google_map/view/pages/google_map_page.dart';
import 'package:evcar/src/feature/login/controller/login_controller.dart';
import 'package:evcar/src/feature/register/controller/register_controller.dart';
import 'package:evcar/src/feature/register/controller/register_subcontroller.dart';
import 'package:evcar/src/feature/splash_screen/splash_page.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
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
    SubRegisterController().clearToken();
    Get.offAll(() => const SplashPage());
  }
}
