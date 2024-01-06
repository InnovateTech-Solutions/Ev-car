import 'package:evcar/src/config/routes/routes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/profile/view/pages/profile_page.dart';
import 'package:evcar/src/feature/register/controller/register_subcontroller.dart';
import 'package:evcar/src/feature/splash_screen/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final SubRegisterController subRegisterController = SubRegisterController();
    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ev Car',
        theme: AppTheme.light,
        locale: const Locale('ar', 'AE'),
        home: subRegisterController.token.value.isEmpty
            ? const SplashPage()
            : const ProfilePage(),
        getPages: AppRoutes.routes,
      ),
    );
  }
}
