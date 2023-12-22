import 'package:evcar/src/config/routes/routes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/future/opening_screen/view/pages/opening_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Orange E-commerce',
      theme: AppTheme.light,
      initialRoute: AppRoutes.onBoard,
      locale: const Locale('ar', 'AR'),
      getPages: AppRoutes.routes,
      home: const OpeningPage(),
    );
  }
}
