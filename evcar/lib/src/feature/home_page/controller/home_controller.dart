import 'package:evcar/src/feature/intro_page/view/pages/Intro_page.dart';
import 'package:evcar/src/feature/login/controller/login_controller.dart';
import 'package:evcar/src/feature/nav_bar/nav_bar.dart';
import 'package:evcar/src/feature/on_board/view/pages/onboard_page.dart';
import 'package:evcar/src/feature/register/controller/user_register_controller.dart';
import 'package:evcar/src/feature/vendor_dashboard/view/page/vendor_dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageController extends GetxController {
  RxBool isGoogleMapEnabled = false.obs;

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.clear();
    await prefs.remove('userType');
    isGoogleMapEnabled.value = false;
    LoginController().clearToken();
    UserRegisterController().clearToken();
    Get.offAll(() => const IntroPage());
  }

  Future<String?> getUserType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userType');
  }

  Widget navigateToDashboard(String? userType) {
    switch (userType) {
      case 'user':
        return const NavBarWidget();
      case 'vendor':
        return const VendorDashboardPage();

      default:
        // Handle invalid user type
        return OnBoardPage();
    }
  }

  login(String userType) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userType', userType);
    Get.offAll(() => navigateToDashboard(userType));
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
