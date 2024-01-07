import 'package:evcar/src/config/routes/routes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/main_widget/main_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
