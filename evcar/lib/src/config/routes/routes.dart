import 'package:evcar/src/future/splash_screen/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String spalshPage = '/';
  static const String register = '/register';
  static const String mainPage = '/MainPage';
  static const String dashBoard = '/dashborad';
  static final List<GetPage> routes = [
    GetPage(
      name: spalshPage,
      page: () => const SplashPage(),
    ),
    // GetPage(
    //   name: register,
    //   page: () => const DetailPage(),
    // ),
    GetPage(
      name: mainPage,
      page: () => const Scaffold(),
    ),
    GetPage(
      name: dashBoard,
      page: () => const Scaffold(),
    ),
  ];
}
