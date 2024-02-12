import 'package:evcar/src/config/routes/routes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/home_page/controller/home_controller.dart';
import 'package:evcar/src/feature/information_page/controller/profile_controller.dart';
import 'package:evcar/src/feature/login/controller/login_controller.dart';
import 'package:evcar/src/feature/register/controller/user_register_controller.dart';
import 'package:evcar/src/feature/vendor_dashboard/view/widget/main_widget/vendor_dashboard_widget.dart';
import 'package:evcar/src/feature/vendor_dashboard/view/widget/test/vendor_dashboard_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorDashboardPage extends StatelessWidget {
  const VendorDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final registerToken = Get.put(UserRegisterController());
    final loginToken = Get.put(LoginController());
    final homeController = Get.put(HomePageController());
    final ProfileController profileController = Get.put(ProfileController());

    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
              isExtended: true,
              backgroundColor: AppTheme.lightAppColors.buttoncolor,
              onPressed: () {
                registerToken.token.value = '';
                loginToken.token.value = '';
                Get.offAllNamed(AppRoutes.spalshPage);
                homeController.logout();
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.camera_alt,
                    color: AppTheme.lightAppColors.background,
                  ),
                  VendorDashboardText.buttonText("إضافة إعلان")
                ],
              )),
          body: Center(
            child: VendorDashboardWidget(),
          )),
    );
  }
}
