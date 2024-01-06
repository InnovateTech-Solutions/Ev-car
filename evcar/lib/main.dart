import 'package:evcar/src/config/routes/routes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/charging_station/controller/home_controller.dart';
import 'package:evcar/src/feature/main_widget/main_widget.dart';
import 'package:evcar/src/feature/profile/view/pages/profile_page.dart';
import 'package:evcar/src/feature/register/controller/register_subcontroller.dart';
import 'package:evcar/src/feature/splash_screen/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use Get.put outside of the build method to ensure a consistent instance.

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ev Car',
      theme: AppTheme.light,
      locale: const Locale('ar', 'AE'),
      home: const MainWidget(),
      getPages: AppRoutes.routes,
    );
  }
}
