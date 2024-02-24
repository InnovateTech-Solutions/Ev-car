import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/home_page/controller/home_controller.dart';
import 'package:evcar/src/feature/splash_screen/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomePageController());
    return FutureBuilder(
      future: controller.getUserType(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(
            color: AppTheme.lightAppColors.bordercolor,
          );
        } else {
          if (snapshot.hasData) {
            return controller.navigateToDashboard(snapshot.data);
          } else {
            return SplashPage();
          }
        }
      },
    );
  }
}
